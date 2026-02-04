import 'package:drift/drift.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../database/database.dart';

/// Local data source for authentication
abstract class AuthLocalDataSource {
  /// Get current user from local database
  Future<UserEntity?> getCurrentUser();

  /// Create anonymous user locally
  Future<UserEntity> createAnonymousUser();

  /// Save user to local database
  Future<UserEntity> saveUser(UserEntity user);

  /// Update user in local database
  Future<UserEntity> updateUser(UserEntity user);

  /// Delete user from local database
  Future<void> deleteUser(String userId);

  /// Save auth tokens securely
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });

  /// Get stored tokens
  Future<({String? accessToken, String? refreshToken})> getTokens();

  /// Clear tokens
  Future<void> clearTokens();

  /// Check if user is logged in locally
  Future<bool> isLoggedIn();

  /// Save current user ID
  Future<void> saveCurrentUserId(String userId);

  /// Get current user ID
  Future<String?> getCurrentUserId();

  /// Clear current user ID
  Future<void> clearCurrentUserId();
}

/// Implementation of AuthLocalDataSource
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final AppDatabase _database;
  final FlutterSecureStorage _secureStorage;
  final Uuid _uuid;

  AuthLocalDataSourceImpl({
    required AppDatabase database,
    FlutterSecureStorage? secureStorage,
    Uuid? uuid,
  }) : _database = database,
       _secureStorage = secureStorage ?? const FlutterSecureStorage(),
       _uuid = uuid ?? const Uuid();

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final userId = await getCurrentUserId();
      if (userId == null) return null;

      final user = await (_database.select(
        _database.users,
      )..where((t) => t.id.equals(userId))).getSingleOrNull();

      return user;
    } catch (e) {
      throw DatabaseException(
        message: 'Failed to get current user: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<UserEntity> createAnonymousUser() async {
    try {
      final userId = _uuid.v4();
      final now = DateTime.now();

      final user = UsersCompanion.insert(
        id: userId,
        isAnonymous: const Value(true),
        createdAt: Value(now),
        updatedAt: Value(now),
        isDirty: const Value(true), // Needs sync
      );

      await _database.into(_database.users).insert(user);
      await saveCurrentUserId(userId);

      final createdUser = await (_database.select(
        _database.users,
      )..where((t) => t.id.equals(userId))).getSingle();

      return createdUser;
    } catch (e) {
      throw DatabaseException(
        message: 'Failed to create anonymous user: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<UserEntity> saveUser(UserEntity user) async {
    try {
      await _database
          .into(_database.users)
          .insertOnConflictUpdate(
            UsersCompanion.insert(
              id: user.id,
              email: Value(user.email),
              displayName: Value(user.displayName),
              remoteId: Value(user.remoteId),
              isAnonymous: Value(user.isAnonymous),
              createdAt: Value(user.createdAt),
              updatedAt: Value(user.updatedAt),
              isDirty: Value(user.isDirty),
              syncVersion: Value(user.syncVersion),
              lastSyncedAt: Value(user.lastSyncedAt),
            ),
          );

      return user;
    } catch (e) {
      throw DatabaseException(
        message: 'Failed to save user: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<UserEntity> updateUser(UserEntity user) async {
    try {
      // Update fields first (without dirty/syncVersion - those are handled by markDirty)
      final companion = UsersCompanion(
        email: Value(user.email),
        displayName: Value(user.displayName),
        remoteId: Value(user.remoteId),
        isAnonymous: Value(user.isAnonymous),
      );

      await (_database.update(
        _database.users,
      )..where((t) => t.id.equals(user.id))).write(companion);

      // Use type-safe markDirty which auto-increments syncVersion
      await _database.markDirty(SyncableTable.users, user.id);

      final updatedUser = await (_database.select(
        _database.users,
      )..where((t) => t.id.equals(user.id))).getSingle();

      return updatedUser;
    } catch (e) {
      throw DatabaseException(
        message: 'Failed to update user: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> deleteUser(String userId) async {
    try {
      await (_database.delete(
        _database.users,
      )..where((t) => t.id.equals(userId))).go();
      await clearCurrentUserId();
      await clearTokens();
    } catch (e) {
      throw DatabaseException(
        message: 'Failed to delete user: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await _secureStorage.write(
        key: StorageKeys.accessToken,
        value: accessToken,
      );
      await _secureStorage.write(
        key: StorageKeys.refreshToken,
        value: refreshToken,
      );
    } catch (e) {
      throw CacheException(
        message: 'Failed to save tokens: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<({String? accessToken, String? refreshToken})> getTokens() async {
    try {
      final accessToken = await _secureStorage.read(
        key: StorageKeys.accessToken,
      );
      final refreshToken = await _secureStorage.read(
        key: StorageKeys.refreshToken,
      );
      return (accessToken: accessToken, refreshToken: refreshToken);
    } catch (e) {
      throw CacheException(
        message: 'Failed to get tokens: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> clearTokens() async {
    try {
      await _secureStorage.delete(key: StorageKeys.accessToken);
      await _secureStorage.delete(key: StorageKeys.refreshToken);
    } catch (e) {
      throw CacheException(
        message: 'Failed to clear tokens: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final userId = await getCurrentUserId();
    return userId != null;
  }

  @override
  Future<void> saveCurrentUserId(String userId) async {
    try {
      await _secureStorage.write(key: StorageKeys.userId, value: userId);
    } catch (e) {
      throw CacheException(
        message: 'Failed to save user ID: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<String?> getCurrentUserId() async {
    try {
      return await _secureStorage.read(key: StorageKeys.userId);
    } catch (e) {
      throw CacheException(
        message: 'Failed to get user ID: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> clearCurrentUserId() async {
    try {
      await _secureStorage.delete(key: StorageKeys.userId);
    } catch (e) {
      throw CacheException(
        message: 'Failed to clear user ID: $e',
        originalException: e,
      );
    }
  }
}
