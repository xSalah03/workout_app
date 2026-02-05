import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_mapper.dart';

/// Implementation of AuthRepository
/// Follows offline-first approach: local DB is source of truth
class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  final _authStateController = StreamController<User?>.broadcast();

  AuthRepositoryImpl({
    required AuthLocalDataSource localDataSource,
    required AuthRemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource,
       _networkInfo = networkInfo {
    // Listen to remote auth changes and update local state
    _remoteDataSource.authStateChanges.listen((firebaseUser) async {
      if (firebaseUser != null) {
        // User logged in remotely, sync local user
        final localUser = await _localDataSource.getCurrentUser();
        if (localUser != null) {
          _authStateController.add(UserMapper.fromEntity(localUser));
        } else {
          // If no local user but firebase user exists, we might need to fetch profile
          // This happens on fresh install or login
          _authStateController.add(null);
        }
      } else {
        // User logged out remotely
        _authStateController.add(null);
      }
    });
  }

  @override
  ResultFuture<User?> getCurrentUser() async {
    try {
      final userEntity = await _localDataSource.getCurrentUser();
      if (userEntity == null) return const Right(null);
      return Right(UserMapper.fromEntity(userEntity));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<User> signInAnonymously() async {
    try {
      // First, create local anonymous user
      final localUser = await _localDataSource.createAnonymousUser();
      var user = UserMapper.fromEntity(localUser);

      // If online, also create remote anonymous user
      if (await _networkInfo.isConnected) {
        try {
          final result = await _remoteDataSource.signInAnonymously();
          if (result.user != null) {
            // Update local user with remote ID (uid)
            final updatedEntity = localUser.copyWith(
              remoteId: Value(result.user!.uid),
              isDirty: false,
              lastSyncedAt: Value(DateTime.now()),
            );
            await _localDataSource.saveUser(updatedEntity);
            user = UserMapper.fromEntity(updatedEntity);

            // Firebase handles tokens automatically, no need to save manually
          }
        } catch (e) {
          // Failed to create remote user, continue with local only
        }
      }

      _authStateController.add(user);
      return Right(user);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<User> signInWithEmail({
    required String email,
    required String password,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final result = await _remoteDataSource.signInWithEmail(
        email: email,
        password: password,
      );

      if (result.user == null) {
        return const Left(AuthFailure(message: 'Sign in failed'));
      }

      // Check if local user exists with this UID
      var localUser = await _localDataSource.getCurrentUser();

      if (localUser == null || localUser.remoteId != result.user!.uid) {
        // Create or update local user
        final now = DateTime.now();
        final newUser = await _localDataSource.createAnonymousUser();
        // In a real app we'd fetch the Firestore profile here
        localUser = newUser.copyWith(
          email: Value(email),
          remoteId: Value(result.user!.uid),
          isAnonymous: false,
          displayName: Value(result.user!.displayName),
          isDirty: false,
          lastSyncedAt: Value(now),
        );
        await _localDataSource.saveUser(localUser);
      }

      final user = UserMapper.fromEntity(localUser);
      _authStateController.add(user);
      return Right(user);
    } on AppAuthException catch (e) {
      return Left(AuthFailure(message: e.message, code: e.code));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      // Requirement: Generic error for login failure
      return const Left(
        AuthFailure(
          message: 'Invalid email or password',
          code: 'INVALID_CREDENTIALS',
        ),
      );
    }
  }

  @override
  ResultFuture<bool> isUsernameAvailable(String username) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final available = await _remoteDataSource.isUsernameAvailable(
        username.trim(),
      );
      return Right(available);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<User> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required int age,
    required double heightCm,
    required double weightKg,
    String? avatarUrl,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final result = await _remoteDataSource.signUpWithEmail(
        email: email,
        password: password,
        username: username.trim(),
        age: age,
        heightCm: heightCm,
        weightKg: weightKg,
      );

      if (result.user == null) {
        return const Left(AuthFailure(message: 'Sign up failed'));
      }

      // Requirement: Email verification required.
      // AuthRemoteDataSourceImpl already signs out and sends verification.
      // So we return the verification required failure.
      return Left(AuthFailure.emailVerificationRequired());
    } on AppAuthException catch (e) {
      return Left(AuthFailure(message: e.message, code: e.code));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<User> upgradeAnonymousAccount({
    required String email,
    required String password,
    String? displayName,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final currentUser = await _localDataSource.getCurrentUser();
      if (currentUser == null) {
        return const Left(AuthFailure(message: 'No user logged in'));
      }

      if (!currentUser.isAnonymous) {
        return const Left(AuthFailure(message: 'User is not anonymous'));
      }

      final result = await _remoteDataSource.linkEmailToAnonymous(
        email: email,
        password: password,
      );

      if (result.user == null) {
        return const Left(AuthFailure(message: 'Upgrade failed'));
      }

      // Update local user
      final updatedUser = currentUser.copyWith(
        email: Value(email),
        displayName: Value(displayName),
        isAnonymous: false,
        isDirty: true,
        updatedAt: DateTime.now(),
      );
      await _localDataSource.saveUser(updatedUser);

      final user = UserMapper.fromEntity(updatedUser);
      _authStateController.add(user);
      return Right(user);
    } on AppAuthException catch (e) {
      return Left(AuthFailure(message: e.message, code: e.code));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  ResultVoid signOut() async {
    try {
      // Clear local session
      await _localDataSource.clearCurrentUserId();

      // Sign out from remote if online
      if (await _networkInfo.isConnected) {
        try {
          await _remoteDataSource.signOut();
        } catch (_) {
          // Ignore remote sign out errors
        }
      }

      _authStateController.add(null);
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  ResultVoid sendPasswordResetEmail(String email) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      await _remoteDataSource.sendPasswordResetEmail(email);
      return const Right(null);
    } on AppAuthException catch (e) {
      return Left(AuthFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  ResultVoid resetPassword({required String newPassword, String? code}) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      if (code != null) {
        await _remoteDataSource.confirmPasswordReset(
          code: code,
          newPassword: newPassword,
        );
      } else {
        await _remoteDataSource.updatePassword(newPassword);
      }
      return const Right(null);
    } on AppAuthException catch (e) {
      return Left(AuthFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  ResultVoid resendVerificationEmail(String email) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      await _remoteDataSource.resendVerificationEmail(email);
      return const Right(null);
    } on AppAuthException catch (e) {
      return Left(AuthFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<User> updateProfile({String? displayName, String? email}) async {
    try {
      final currentUser = await _localDataSource.getCurrentUser();
      if (currentUser == null) {
        return const Left(AuthFailure(message: 'No user logged in'));
      }

      // Update local first
      final updatedUser = currentUser.copyWith(
        displayName: Value(displayName ?? currentUser.displayName),
        email: Value(email ?? currentUser.email),
        updatedAt: DateTime.now(),
        isDirty: true,
      );
      await _localDataSource.updateUser(updatedUser);

      // Update remote if online
      if (await _networkInfo.isConnected && currentUser.remoteId != null) {
        try {
          await _remoteDataSource.updateProfileData({
            if (displayName != null) 'display_name': displayName,
            if (email != null) 'email': email,
          });

          // Mark as synced
          final syncedUser = updatedUser.copyWith(
            isDirty: false,
            lastSyncedAt: Value(DateTime.now()),
          );
          await _localDataSource.saveUser(syncedUser);

          final user = UserMapper.fromEntity(syncedUser);
          _authStateController.add(user);
          return Right(user);
        } catch (_) {
          // Remote update failed, continue with local update
        }
      }

      final user = UserMapper.fromEntity(updatedUser);
      _authStateController.add(user);
      return Right(user);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  ResultVoid deleteAccount() async {
    try {
      final currentUser = await _localDataSource.getCurrentUser();
      if (currentUser == null) {
        return const Left(AuthFailure(message: 'No user logged in'));
      }

      // Delete from remote if online
      if (await _networkInfo.isConnected && currentUser.remoteId != null) {
        try {
          await _remoteDataSource.deleteAccount();
        } catch (_) {
          // Continue with local deletion
        }
      }

      // Delete local user and all data
      await _localDataSource.deleteUser(currentUser.id);

      _authStateController.add(null);
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    return await _localDataSource.isLoggedIn();
  }

  @override
  Stream<User?> get authStateChanges => _authStateController.stream;

  /// Dispose resources
  void dispose() {
    _authStateController.close();
  }
}
