import '../../../../core/utils/typedefs.dart';

/// Sync status enum
enum SyncStatus { idle, syncing, success, failed, offline }

/// Sync result summary
class SyncResult {
  final int uploaded;
  final int downloaded;
  final int conflicts;
  final List<String> errors;
  final DateTime completedAt;

  const SyncResult({
    this.uploaded = 0,
    this.downloaded = 0,
    this.conflicts = 0,
    this.errors = const [],
    required this.completedAt,
  });

  bool get hasErrors => errors.isNotEmpty;
  bool get isSuccess => errors.isEmpty;
}

/// Sync repository interface
abstract class SyncRepository {
  /// Get current sync status
  SyncStatus get currentStatus;

  /// Stream of sync status changes
  Stream<SyncStatus> get statusStream;

  /// Get last sync time
  Future<DateTime?> getLastSyncTime();

  /// Check if there are pending changes to sync
  Future<bool> hasPendingChanges();

  /// Get count of pending changes
  Future<int> getPendingChangesCount();

  /// Perform full sync (upload dirty records, download changes)
  ResultFuture<SyncResult> sync();

  /// Upload only (push local changes)
  ResultFuture<SyncResult> uploadChanges();

  /// Download only (pull remote changes)
  ResultFuture<SyncResult> downloadChanges();

  /// Resolve sync conflict
  /// [useLocal] - if true, local version wins; if false, remote wins
  ResultVoid resolveConflict({
    required String tableName,
    required String recordId,
    required bool useLocal,
  });

  /// Clear sync queue (after successful sync)
  ResultVoid clearSyncQueue();

  /// Add item to sync queue
  ResultVoid queueForSync({
    required String tableName,
    required String recordId,
    required String operation,
    required Map<String, dynamic> payload,
  });

  /// Enable/disable auto-sync
  Future<void> setAutoSync(bool enabled);

  /// Check if auto-sync is enabled
  Future<bool> isAutoSyncEnabled();

  /// Force full re-sync (dangerous - use carefully)
  ResultFuture<SyncResult> forceFullSync();
}
