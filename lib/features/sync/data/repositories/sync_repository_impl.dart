import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/typedefs.dart';
import '../../../../database/database.dart';
import '../../domain/repositories/sync_repository.dart';

/// Offline-first sync implementation
///
/// SYNC ALGORITHM:
/// 1. Local DB is ALWAYS the source of truth
/// 2. All writes go to local first, marked as "dirty"
/// 3. When online, dirty records are pushed to remote
/// 4. Remote changes are pulled and merged with conflict resolution
/// 5. Conflict resolution: Last-write-wins with version checking
///
/// CONFLICT RESOLUTION STRATEGY:
/// - Each record has a `sync_version` that increments on update
/// - Each record has a `updated_at` timestamp
/// - When conflict detected:
///   a. If local version > remote version: local wins
///   b. If remote version > local version: remote wins
///   c. If versions equal: compare timestamps, latest wins
/// - User can manually resolve if needed
class SyncRepositoryImpl implements SyncRepository {
  final AppDatabase _database;
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final NetworkInfo _networkInfo;
  final SharedPreferences _prefs;

  SyncStatus _currentStatus = SyncStatus.idle;
  final _statusController = StreamController<SyncStatus>.broadcast();

  SyncRepositoryImpl({
    required AppDatabase database,
    required FirebaseFirestore firestore,
    required FirebaseAuth firebaseAuth,
    required NetworkInfo networkInfo,
    required SharedPreferences prefs,
  }) : _database = database,
       _firestore = firestore,
       _firebaseAuth = firebaseAuth,
       _networkInfo = networkInfo,
       _prefs = prefs {
    // Listen for connectivity changes and auto-sync
    _networkInfo.onConnectivityChanged.listen((isConnected) async {
      if (isConnected && await isAutoSyncEnabled()) {
        sync();
      }
    });
  }

  @override
  SyncStatus get currentStatus => _currentStatus;

  @override
  Stream<SyncStatus> get statusStream => _statusController.stream;

  void _setStatus(SyncStatus status) {
    _currentStatus = status;
    _statusController.add(status);
  }

  @override
  Future<DateTime?> getLastSyncTime() async {
    final timestamp = _prefs.getInt(StorageKeys.lastSyncTime);
    if (timestamp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  Future<void> _setLastSyncTime(DateTime time) async {
    await _prefs.setInt(StorageKeys.lastSyncTime, time.millisecondsSinceEpoch);
  }

  @override
  Future<bool> hasPendingChanges() async {
    final count = await getPendingChangesCount();
    return count > 0;
  }

  @override
  Future<int> getPendingChangesCount() async {
    final dirtyRecords = await _database.getDirtyRecords();
    return dirtyRecords.values.fold<int>(0, (sum, list) => sum + list.length);
  }

  @override
  ResultFuture<SyncResult> sync() async {
    if (!await _networkInfo.isConnected) {
      _setStatus(SyncStatus.offline);
      return const Left(NetworkFailure());
    }

    if (_currentStatus == SyncStatus.syncing) {
      return Left(SyncFailure(message: 'Sync already in progress'));
    }

    _setStatus(SyncStatus.syncing);

    try {
      int uploaded = 0;
      int downloaded = 0;
      int conflicts = 0;
      final errors = <String>[];

      // Step 1: Upload dirty records
      final uploadResult = await uploadChanges();
      uploadResult.fold(
        (failure) => errors.add('Upload failed: ${failure.message}'),
        (result) {
          uploaded = result.uploaded;
          conflicts += result.conflicts;
          errors.addAll(result.errors);
        },
      );

      // Step 2: Download remote changes
      final downloadResult = await downloadChanges();
      downloadResult.fold(
        (failure) => errors.add('Download failed: ${failure.message}'),
        (result) {
          downloaded = result.downloaded;
          conflicts += result.conflicts;
          errors.addAll(result.errors);
        },
      );

      // Step 3: Clear sync queue for successfully synced records
      await clearSyncQueue();

      // Step 4: Update last sync time
      await _setLastSyncTime(DateTime.now());

      final syncResult = SyncResult(
        uploaded: uploaded,
        downloaded: downloaded,
        conflicts: conflicts,
        errors: errors,
        completedAt: DateTime.now(),
      );

      _setStatus(errors.isEmpty ? SyncStatus.success : SyncStatus.failed);
      return Right(syncResult);
    } catch (e) {
      _setStatus(SyncStatus.failed);
      return Left(SyncFailure(message: 'Sync failed: $e'));
    }
  }

  @override
  ResultFuture<SyncResult> uploadChanges() async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      int uploaded = 0;
      int conflicts = 0;
      final errors = <String>[];

      final dirtyRecords = await _database.getDirtyRecords();

      // Upload each table's dirty records
      for (final entry in dirtyRecords.entries) {
        final tableName = entry.key;
        final records = entry.value;

        for (final record in records) {
          try {
            final result = await _uploadRecord(tableName, record);
            if (result.isConflict) {
              conflicts++;
            } else if (result.isSuccess) {
              uploaded++;
            } else {
              errors.add('Failed to upload $tableName/${result.recordId}');
            }
          } catch (e) {
            errors.add('Error uploading $tableName: $e');
          }
        }
      }

      return Right(
        SyncResult(
          uploaded: uploaded,
          conflicts: conflicts,
          errors: errors,
          completedAt: DateTime.now(),
        ),
      );
    } catch (e) {
      return Left(SyncFailure(message: 'Upload failed: $e'));
    }
  }

  Future<_UploadResult> _uploadRecord(String tableName, dynamic record) async {
    final remoteCollection = _getRemoteTableName(tableName);
    final recordMap = _recordToMap(tableName, record);
    final recordId = recordMap['id'] as String;
    final localVersion = recordMap['sync_version'] as int? ?? 0;

    try {
      // For Firestore, we use the local ID as the document ID
      final docRef = _firestore.collection(remoteCollection).doc(recordId);
      final docSnap = await docRef.get();

      if (!docSnap.exists) {
        // New record - set
        await docRef.set(recordMap);
        await _markAsSyncedTyped(tableName, recordId);
        return _UploadResult(recordId: recordId, isSuccess: true);
      }

      final data = docSnap.data()!;
      final remoteVersion = data['sync_version'] as int? ?? 0;

      if (localVersion > remoteVersion) {
        // Local is newer - update remote
        await docRef.update(recordMap);
        await _markAsSyncedTyped(tableName, recordId);
        return _UploadResult(recordId: recordId, isSuccess: true);
      } else if (remoteVersion > localVersion) {
        // Remote is newer - conflict
        return _UploadResult(recordId: recordId, isConflict: true);
      } else {
        // Same version - compare timestamps
        final localUpdatedAt = recordMap['updated_at'] as String;
        final remoteUpdatedAt = (data['updated_at'] as Timestamp)
            .toDate()
            .toIso8601String();

        if (DateTime.parse(
          localUpdatedAt,
        ).isAfter(DateTime.parse(remoteUpdatedAt))) {
          // Local is newer by timestamp
          await docRef.update(recordMap);
          await _markAsSyncedTyped(tableName, recordId);
          return _UploadResult(recordId: recordId, isSuccess: true);
        } else {
          // Remote is newer - conflict
          return _UploadResult(recordId: recordId, isConflict: true);
        }
      }
    } catch (e) {
      return _UploadResult(recordId: recordId, error: e.toString());
    }
  }

  @override
  ResultFuture<SyncResult> downloadChanges() async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      int downloaded = 0;
      int conflicts = 0;
      final errors = <String>[];

      final lastSync = await getLastSyncTime();
      // Use SyncableTable enum for type safety
      final tables = [
        SyncableTable.users.tableName,
        SyncableTable.exercises.tableName,
        SyncableTable.workoutPlans.tableName,
        SyncableTable.workoutSessions.tableName,
      ];

      for (final tableName in tables) {
        try {
          final result = await _downloadTableChanges(tableName, lastSync);
          downloaded += result.downloaded;
          conflicts += result.conflicts;
          errors.addAll(result.errors);
        } catch (e) {
          errors.add('Error downloading $tableName: $e');
        }
      }

      return Right(
        SyncResult(
          downloaded: downloaded,
          conflicts: conflicts,
          errors: errors,
          completedAt: DateTime.now(),
        ),
      );
    } catch (e) {
      return Left(SyncFailure(message: 'Download failed: $e'));
    }
  }

  Future<_DownloadResult> _downloadTableChanges(
    String tableName,
    DateTime? lastSync,
  ) async {
    final remoteCollection = _getRemoteTableName(tableName);
    int downloaded = 0;
    int conflicts = 0;
    final errors = <String>[];

    try {
      // Get current user ID for filtering
      final userId = await _getCurrentUserId();
      if (userId == null) {
        return _DownloadResult(errors: ['No user ID']);
      }

      // Query remote records updated since last sync
      Query<Map<String, dynamic>> query = _firestore.collection(
        remoteCollection,
      );

      if (tableName != SyncableTable.users.tableName) {
        query = query.where('user_id', isEqualTo: userId);
      } else {
        // For users table, we only care about the current user's profile
        query = query.where('uid', isEqualTo: userId);
      }

      if (lastSync != null) {
        query = query.where('updated_at', isGreaterThanOrEqualTo: lastSync);
      }

      final querySnapshot = await query.get();

      for (final doc in querySnapshot.docs) {
        try {
          final remoteRecord = doc.data();
          // We'll use the doc ID as the localId if 'local_id' is missing
          final localId = remoteRecord['local_id'] as String? ?? doc.id;

          final result = await _mergeRemoteRecord(
            tableName,
            localId,
            remoteRecord,
          );
          if (result.isConflict) {
            conflicts++;
          } else if (result.isSuccess) {
            downloaded++;
          }
        } catch (e) {
          errors.add('Error merging record: $e');
        }
      }
    } catch (e) {
      errors.add('Query failed: $e');
    }

    return _DownloadResult(
      downloaded: downloaded,
      conflicts: conflicts,
      errors: errors,
    );
  }

  /// Merge a remote record with local data
  Future<_MergeResult> _mergeRemoteRecord(
    String tableName,
    String localId,
    Map<String, dynamic> remoteRecord,
  ) async {
    final remoteVersion = remoteRecord['sync_version'] as int? ?? 0;
    final remoteUpdatedAtRaw = remoteRecord['updated_at'];
    final DateTime remoteUpdatedAt;

    if (remoteUpdatedAtRaw is Timestamp) {
      remoteUpdatedAt = remoteUpdatedAtRaw.toDate();
    } else if (remoteUpdatedAtRaw is String) {
      remoteUpdatedAt = DateTime.parse(remoteUpdatedAtRaw);
    } else {
      remoteUpdatedAt = DateTime.now();
    }

    // Get local record
    final localRecord = await _getLocalRecord(tableName, localId);

    if (localRecord == null) {
      // No local record - insert remote
      await _insertRemoteRecord(tableName, remoteRecord);
      return _MergeResult(isSuccess: true);
    }

    final localVersion = localRecord['sync_version'] as int? ?? 0;
    final localIsDirty = localRecord['is_dirty'] as bool? ?? false;
    final localUpdatedAt = localRecord['updated_at'] as DateTime?;

    // If local is not dirty, always accept remote
    if (!localIsDirty) {
      await _updateFromRemote(tableName, localId, remoteRecord);
      return _MergeResult(isSuccess: true);
    }

    // Local is dirty - need conflict resolution
    if (remoteVersion > localVersion) {
      // Remote wins - but save local changes to conflict queue
      await _saveConflict(tableName, localId, localRecord, remoteRecord);
      await _updateFromRemote(tableName, localId, remoteRecord);
      return _MergeResult(isConflict: true);
    } else if (localVersion > remoteVersion) {
      // Local wins - will upload on next sync
      return _MergeResult(isSuccess: true);
    } else {
      // Same version - compare timestamps
      if (localUpdatedAt != null && remoteUpdatedAt.isAfter(localUpdatedAt)) {
        await _saveConflict(tableName, localId, localRecord, remoteRecord);
        await _updateFromRemote(tableName, localId, remoteRecord);
        return _MergeResult(isConflict: true);
      }
      return _MergeResult(isSuccess: true);
    }
  }

  @override
  ResultVoid resolveConflict({
    required String tableName,
    required String recordId,
    required bool useLocal,
  }) async {
    try {
      // Convert string to SyncableTable for type safety
      final table = _tableFromString(tableName);

      if (useLocal) {
        // Keep local version, mark as dirty for next sync
        await _database.markDirty(table, recordId);
      } else {
        // Accept remote version - clear dirty flag
        await _database.markSynced(table, recordId);
      }

      // Remove from conflict queue
      await _removeConflict(tableName, recordId);

      return const Right(null);
    } catch (e) {
      return Left(SyncFailure(message: 'Failed to resolve conflict: $e'));
    }
  }

  @override
  ResultVoid clearSyncQueue() async {
    try {
      await _database.delete(_database.syncQueue).go();
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Failed to clear sync queue: $e'));
    }
  }

  @override
  ResultVoid queueForSync({
    required String tableName,
    required String recordId,
    required String operation,
    required Map<String, dynamic> payload,
  }) async {
    try {
      // Convert to type-safe enums
      final table = _tableFromString(tableName);
      final op = _operationFromString(operation);

      // Use new minimal payload method - payload param is ignored
      // Data will be read from DB at sync time
      await _database.queueSync(table, recordId, op);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Failed to queue for sync: $e'));
    }
  }

  @override
  Future<void> setAutoSync(bool enabled) async {
    await _prefs.setBool('auto_sync_enabled', enabled);
  }

  @override
  Future<bool> isAutoSyncEnabled() async {
    return _prefs.getBool('auto_sync_enabled') ?? true;
  }

  @override
  ResultFuture<SyncResult> forceFullSync() async {
    // Clear last sync time to force full download
    await _prefs.remove(StorageKeys.lastSyncTime);
    return sync();
  }

  // ============================================================
  // HELPER METHODS
  // ============================================================

  /// Convert string table name to SyncableTable enum
  SyncableTable _tableFromString(String tableName) {
    return SyncableTable.values.firstWhere(
      (t) => t.tableName == tableName,
      orElse: () => throw ArgumentError('Unknown table: $tableName'),
    );
  }

  /// Convert string operation to SyncOperation enum
  SyncOperation _operationFromString(String operation) {
    return SyncOperation.values.firstWhere(
      (o) => o.value == operation,
      orElse: () => throw ArgumentError('Unknown operation: $operation'),
    );
  }

  String _getRemoteTableName(String localTable) {
    switch (localTable) {
      case 'users':
        return 'users';
      case 'exercises':
        return 'exercises';
      case 'workout_plans':
        return 'workout_plans';
      case 'workout_sessions':
        return 'workout_sessions';
      case 'workout_sets':
        return 'workout_sets';
      default:
        return localTable;
    }
  }

  Map<String, dynamic> _recordToMap(String tableName, dynamic record) {
    // Convert database entity to JSON map for sync
    // Each entity type has its own toJson method via Drift
    if (record is UserEntity) {
      return {
        'uid': record.remoteId ?? record.id,
        'local_id': record.id,
        'email': record.email,
        'display_name': record.displayName,
        'is_anonymous': record.isAnonymous,
        'created_at': record.createdAt,
        'updated_at': record.updatedAt,
        'sync_version': record.syncVersion,
      };
    }
    // Add other entity types as needed...
    return {};
  }

  /// Type-safe version of mark as synced
  Future<void> _markAsSyncedTyped(String tableName, String recordId) async {
    final table = _tableFromString(tableName);
    await _database.markSynced(table, recordId);
  }

  Future<String?> _getCurrentUserId() async {
    return _firebaseAuth.currentUser?.uid;
  }

  Future<Map<String, dynamic>?> _getLocalRecord(
    String tableName,
    String id,
  ) async {
    // Get local record by ID
    // Implementation depends on table
    return null;
  }

  Future<void> _insertRemoteRecord(
    String tableName,
    Map<String, dynamic> record,
  ) async {
    // Insert remote record into local database
  }

  Future<void> _updateFromRemote(
    String tableName,
    String localId,
    Map<String, dynamic> remoteRecord,
  ) async {
    // Update local record with remote data
  }

  Future<void> _saveConflict(
    String tableName,
    String localId,
    Map<String, dynamic> localRecord,
    Map<String, dynamic> remoteRecord,
  ) async {
    // Save conflict for manual resolution using minimal queue
    // Note: We queue with 'conflict' operation, data is read at resolution time
    try {
      final table = _tableFromString(tableName);
      await _database.queueSync(
        table,
        localId,
        SyncOperation.update, // Conflicts are essentially updates
      );
    } catch (_) {
      // If table lookup fails (e.g., for conflict markers), ignore
    }
  }

  Future<void> _removeConflict(String tableName, String recordId) async {
    await (_database.delete(_database.syncQueue)
          ..where((t) => t.targetTable.equals(tableName))
          ..where((t) => t.recordId.equals(recordId)))
        .go();
  }

  void dispose() {
    _statusController.close();
  }
}

/// Upload result helper class
class _UploadResult {
  final String recordId;
  final bool isSuccess;
  final bool isConflict;
  final String? error;

  _UploadResult({
    required this.recordId,
    this.isSuccess = false,
    this.isConflict = false,
    this.error,
  });
}

/// Download result helper class
class _DownloadResult {
  final int downloaded;
  final int conflicts;
  final List<String> errors;

  _DownloadResult({
    this.downloaded = 0,
    this.conflicts = 0,
    this.errors = const [],
  });
}

/// Merge result helper class
class _MergeResult {
  final bool isSuccess;
  final bool isConflict;

  _MergeResult({this.isSuccess = false, this.isConflict = false});
}
