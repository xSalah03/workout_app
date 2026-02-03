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
    _remoteDataSource.authStateChanges.listen((state) async {
      if (state.session != null) {
        // User logged in remotely, sync local user
        final localUser = await _localDataSource.getCurrentUser();
        if (localUser != null) {
          _authStateController.add(UserMapper.fromEntity(localUser));
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
          final response = await _remoteDataSource.signInAnonymously();
          if (response.user != null) {
            // Update local user with remote ID
            final updatedEntity = localUser.copyWith(
              supabaseId: Value(response.user!.id),
              isDirty: false,
              lastSyncedAt: Value(DateTime.now()),
            );
            await _localDataSource.saveUser(updatedEntity);
            user = UserMapper.fromEntity(updatedEntity);

            // Save tokens
            if (response.session != null) {
              await _localDataSource.saveTokens(
                accessToken: response.session!.accessToken,
                refreshToken: response.session!.refreshToken ?? '',
              );
            }
          }
        } catch (e) {
          // Failed to create remote user, continue with local only
          // Will sync later when online
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
    // Email sign-in requires network
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final response = await _remoteDataSource.signInWithEmail(
        email: email,
        password: password,
      );

      if (response.user == null) {
        return const Left(AuthFailure(message: 'Sign in failed'));
      }

      // Save tokens
      if (response.session != null) {
        await _localDataSource.saveTokens(
          accessToken: response.session!.accessToken,
          refreshToken: response.session!.refreshToken ?? '',
        );
      }

      // Check if local user exists with this supabase ID
      var localUser = await _localDataSource.getCurrentUser();

      if (localUser == null || localUser.supabaseId != response.user!.id) {
        // Create or update local user
        final now = DateTime.now();
        final newUser = await _localDataSource.createAnonymousUser();
        localUser = newUser.copyWith(
          email: Value(email),
          supabaseId: Value(response.user!.id),
          isAnonymous: false,
          displayName: Value(
            response.user!.userMetadata?['display_name'] as String?,
          ),
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
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<User> signUpWithEmail({
    required String email,
    required String password,
    String? displayName,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final response = await _remoteDataSource.signUpWithEmail(
        email: email,
        password: password,
      );

      if (response.user == null) {
        return const Left(AuthFailure(message: 'Sign up failed'));
      }

      // Save tokens
      if (response.session != null) {
        await _localDataSource.saveTokens(
          accessToken: response.session!.accessToken,
          refreshToken: response.session!.refreshToken ?? '',
        );
      }

      // Create local user
      final localUser = await _localDataSource.createAnonymousUser();
      final updatedUser = localUser.copyWith(
        email: Value(email),
        displayName: Value(displayName),
        supabaseId: Value(response.user!.id),
        isAnonymous: false,
        isDirty: false,
        lastSyncedAt: Value(DateTime.now()),
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

      // Link email to anonymous account
      final response = await _remoteDataSource.linkEmailToAnonymous(
        email: email,
        password: password,
      );

      if (response.user == null) {
        return const Left(AuthFailure(message: 'Upgrade failed'));
      }

      // Update local user
      final updatedUser = currentUser.copyWith(
        email: Value(email),
        displayName: Value(displayName),
        isAnonymous: false,
        isDirty: true, // Mark for sync
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
      await _localDataSource.clearTokens();
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
      if (await _networkInfo.isConnected && currentUser.supabaseId != null) {
        try {
          await _remoteDataSource.updateUser(
            email: email,
            data: displayName != null ? {'display_name': displayName} : null,
          );

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
      if (await _networkInfo.isConnected && currentUser.supabaseId != null) {
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
