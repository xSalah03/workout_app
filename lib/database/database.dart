import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// ============================================================
// SYNCABLE TABLE ENUM
// Type-safe way to reference syncable tables, avoiding string-based errors
// ============================================================

/// Enum representing all tables that support sync operations.
/// Used for type-safe dirty marking and sync queue operations.
enum SyncableTable {
  users('users'),
  exercises('exercises'),
  workoutPlans('workout_plans'),
  workoutPlanExercises('workout_plan_exercises'),
  workoutSessions('workout_sessions'),
  sessionExercises('session_exercises'),
  workoutSets('workout_sets'), // Renamed from 'sets' to avoid SQL reserved word
  personalRecords('personal_records');

  final String tableName;
  const SyncableTable(this.tableName);
}

/// Sync operation types for the sync queue
enum SyncOperation {
  insert('insert'),
  update('update'),
  delete('delete');

  final String value;
  const SyncOperation(this.value);
}

// ============================================================
// TABLE DEFINITIONS
// ============================================================

/// Users table - stores local user data
/// Sync metadata included for offline-first architecture
@DataClassName('UserEntity')
class Users extends Table {
  TextColumn get id => text()(); // UUID, primary key
  TextColumn get email => text().nullable()();
  TextColumn get displayName => text().nullable()();
  TextColumn get remoteId => text().nullable()(); // Remote ID for sync
  IntColumn get age => integer().nullable()(); // User age (13-120)
  RealColumn get heightCm => real().nullable()(); // Height in cm (50-300)
  RealColumn get weightKg => real().nullable()(); // Weight in kg (20-500)
  BoolColumn get isAnonymous => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  // Sync metadata
  BoolColumn get isDirty => boolean().withDefault(const Constant(false))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Muscle groups enum for exercises
enum MuscleGroup {
  chest,
  back,
  shoulders,
  biceps,
  triceps,
  forearms,
  core,
  quadriceps,
  hamstrings,
  glutes,
  calves,
  fullBody,
  cardio,
}

/// Equipment types enum
enum EquipmentType {
  barbell,
  dumbbell,
  kettlebell,
  machine,
  cable,
  bodyweight,
  resistanceBand,
  other,
}

/// Exercises table - exercise library
@DataClassName('ExerciseEntity')
class Exercises extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  TextColumn get muscleGroup => text()(); // MuscleGroup enum as string
  TextColumn get secondaryMuscles => text().nullable()(); // JSON array
  TextColumn get equipment => text()(); // EquipmentType enum as string
  TextColumn get instructions => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  BoolColumn get isCustom => boolean().withDefault(const Constant(true))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  // Sync metadata
  BoolColumn get isDirty => boolean().withDefault(const Constant(false))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
  TextColumn get remoteId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Workout Plans table - reusable workout templates
@DataClassName('WorkoutPlanEntity')
class WorkoutPlans extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  TextColumn get targetMuscleGroups => text().nullable()(); // JSON array
  IntColumn get estimatedDurationMinutes => integer().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  // Sync metadata
  BoolColumn get isDirty => boolean().withDefault(const Constant(false))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
  TextColumn get remoteId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Workout Plan Exercises - exercises within a workout plan (template)
@DataClassName('WorkoutPlanExerciseEntity')
class WorkoutPlanExercises extends Table {
  TextColumn get id => text()();
  TextColumn get workoutPlanId => text().references(WorkoutPlans, #id)();
  TextColumn get exerciseId => text().references(Exercises, #id)();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  IntColumn get targetSets => integer().withDefault(const Constant(3))();
  IntColumn get targetReps => integer().nullable()();
  RealColumn get targetWeight => real().nullable()();
  IntColumn get restSeconds => integer().withDefault(const Constant(90))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  // Sync metadata
  BoolColumn get isDirty => boolean().withDefault(const Constant(false))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();
  TextColumn get remoteId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Workout Sessions table - actual workout instances
/// NOTE: totalVolume, totalSets, totalReps are CACHED values computed from WorkoutSets.
/// The WorkoutSets table is the single source of truth for set data.
/// These cached values should be recalculated when sets change.
@DataClassName('WorkoutSessionEntity')
class WorkoutSessions extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get workoutPlanId =>
      text().nullable().references(WorkoutPlans, #id)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get durationSeconds => integer().nullable()();
  // CACHED VALUES - computed from WorkoutSets table, not source of truth
  RealColumn get totalVolume => real().nullable()();
  IntColumn get totalSets => integer().nullable()();
  IntColumn get totalReps => integer().nullable()();
  TextColumn get status => text().withDefault(
    const Constant('in_progress'),
  )(); // in_progress, completed, cancelled
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  // Sync metadata
  BoolColumn get isDirty => boolean().withDefault(const Constant(false))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
  TextColumn get remoteId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Session Exercises - exercises performed in a session
@DataClassName('SessionExerciseEntity')
class SessionExercises extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text().references(WorkoutSessions, #id)();
  TextColumn get exerciseId => text().references(Exercises, #id)();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get startedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  // Sync metadata
  BoolColumn get isDirty => boolean().withDefault(const Constant(false))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();
  TextColumn get remoteId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// WorkoutSets table - individual sets performed
/// RENAMED from "Sets" to avoid SQL reserved word conflict.
/// This is the SINGLE SOURCE OF TRUTH for all set data.
/// Session totals should be computed from this table.
@DataClassName('WorkoutSetEntity')
class WorkoutSets extends Table {
  TextColumn get id => text()();
  TextColumn get sessionExerciseId =>
      text().references(SessionExercises, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get reps => integer().nullable()();
  RealColumn get weight =>
      real().nullable()(); // in kg or lbs based on user preference
  IntColumn get durationSeconds =>
      integer().nullable()(); // For timed exercises
  RealColumn get distance => real().nullable()(); // For cardio
  IntColumn get restSeconds => integer().nullable()();
  TextColumn get setType => text().withDefault(
    const Constant('working'),
  )(); // warmup, working, dropset, failure
  RealColumn get rpe =>
      real().nullable()(); // Rate of Perceived Exertion (1-10)
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  // Sync metadata
  BoolColumn get isDirty => boolean().withDefault(const Constant(false))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();
  TextColumn get remoteId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  // Override table name to use 'workout_sets' instead of default 'workout_sets'
  // This ensures consistent naming and avoids 'sets' reserved word
  @override
  String get tableName => 'workout_sets';
}

/// Personal Records table - tracks PRs for exercises
@DataClassName('PersonalRecordEntity')
class PersonalRecords extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get exerciseId => text().references(Exercises, #id)();
  TextColumn get recordType =>
      text()(); // max_weight, max_reps, max_volume, max_duration
  RealColumn get value => real()();
  IntColumn get reps => integer().nullable()(); // For weight PRs, the rep count
  TextColumn get setId => text().nullable().references(WorkoutSets, #id)();
  DateTimeColumn get achievedAt => dateTime()();
  BoolColumn get isCurrentRecord =>
      boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  // Sync metadata
  BoolColumn get isDirty => boolean().withDefault(const Constant(false))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();
  TextColumn get remoteId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Sync Queue table - tracks pending sync operations
/// MINIMAL PAYLOAD: Only stores table, recordId, and operation.
/// Actual data is read from the database at sync time to ensure consistency.
@DataClassName('SyncQueueEntity')
class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get targetTable =>
      text()(); // Use SyncableTable.tableName for type safety
  TextColumn get recordId => text()();
  TextColumn get operation => text()(); // Use SyncOperation.value
  // Removed: payload field - data should be read at sync time for consistency
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastAttemptAt => dateTime().nullable()();
  TextColumn get errorMessage => text().nullable()();
}

/// App Settings table - user preferences
@DataClassName('AppSettingEntity')
class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {key};
}

// ============================================================
// DATABASE CLASS
// ============================================================

@DriftDatabase(
  tables: [
    Users,
    Exercises,
    WorkoutPlans,
    WorkoutPlanExercises,
    WorkoutSessions,
    SessionExercises,
    WorkoutSets, // Renamed from Sets
    PersonalRecords,
    SyncQueue,
    AppSettings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Increment schema version for physical data fields (age, height, weight)
  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _createIndexes(m);
        await _seedDefaultExercises();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Migration: Rename 'sets' table to 'workout_sets'
          await customStatement('ALTER TABLE sets RENAME TO workout_sets');
          // Update indexes
          await customStatement(
            'DROP INDEX IF EXISTS idx_sets_session_exercise_id',
          );
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_workout_sets_session_exercise_id ON workout_sets(session_exercise_id)',
          );
          await customStatement('DROP INDEX IF EXISTS idx_sets_completed_at');
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_workout_sets_completed_at ON workout_sets(completed_at)',
          );
        }
        if (from < 3) {
          // Migration: Add physical data columns to users table
          await customStatement('ALTER TABLE users ADD COLUMN age INTEGER');
          await customStatement('ALTER TABLE users ADD COLUMN height_cm REAL');
          await customStatement('ALTER TABLE users ADD COLUMN weight_kg REAL');
        }
        if (from < 4) {
          // Migration: Rename users.supabase_id to users.remote_id
          await customStatement(
            'ALTER TABLE users RENAME COLUMN supabase_id TO remote_id',
          );
          // Update index
          await customStatement('DROP INDEX IF EXISTS idx_users_supabase_id');
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_users_remote_id ON users(remote_id)',
          );
        }
      },
    );
  }

  /// Create indexes for performance optimization
  Future<void> _createIndexes(Migrator m) async {
    // User indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_users_remote_id ON users(remote_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_users_dirty ON users(is_dirty) WHERE is_dirty = 1',
    );

    // Exercise indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_exercises_user_id ON exercises(user_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_exercises_muscle_group ON exercises(muscle_group)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_exercises_dirty ON exercises(is_dirty) WHERE is_dirty = 1',
    );

    // Workout Plan indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_workout_plans_user_id ON workout_plans(user_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_workout_plans_dirty ON workout_plans(is_dirty) WHERE is_dirty = 1',
    );

    // Workout Session indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_workout_sessions_user_id ON workout_sessions(user_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_workout_sessions_started_at ON workout_sessions(started_at DESC)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_workout_sessions_status ON workout_sessions(status)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_workout_sessions_dirty ON workout_sessions(is_dirty) WHERE is_dirty = 1',
    );

    // Session Exercise indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_session_exercises_session_id ON session_exercises(session_id)',
    );

    // WorkoutSets indexes (renamed from sets)
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_workout_sets_session_exercise_id ON workout_sets(session_exercise_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_workout_sets_completed_at ON workout_sets(completed_at)',
    );

    // Personal Records indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_personal_records_user_exercise ON personal_records(user_id, exercise_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_personal_records_current ON personal_records(is_current_record) WHERE is_current_record = 1',
    );

    // Sync Queue indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_sync_queue_created_at ON sync_queue(created_at)',
    );
  }

  /// Seed default exercises
  Future<void> _seedDefaultExercises() async {
    // Default exercises will be seeded when user is created
  }

  // ============================================================
  // TYPE-SAFE DIRTY MARKING
  // These methods auto-increment syncVersion and set isDirty atomically
  // ============================================================

  /// Mark a record as dirty using type-safe enum.
  /// Automatically increments syncVersion for proper conflict resolution.
  Future<void> markDirty(SyncableTable table, String recordId) async {
    final now = DateTime.now();
    switch (table) {
      case SyncableTable.users:
        // Get current syncVersion and increment
        final current = await (select(
          users,
        )..where((t) => t.id.equals(recordId))).getSingleOrNull();
        final newVersion = (current?.syncVersion ?? 0) + 1;
        await (update(users)..where((t) => t.id.equals(recordId))).write(
          UsersCompanion(
            isDirty: const Value(true),
            updatedAt: Value(now),
            syncVersion: Value(newVersion),
          ),
        );
        break;
      case SyncableTable.exercises:
        final current = await (select(
          exercises,
        )..where((t) => t.id.equals(recordId))).getSingleOrNull();
        final newVersion = (current?.syncVersion ?? 0) + 1;
        await (update(exercises)..where((t) => t.id.equals(recordId))).write(
          ExercisesCompanion(
            isDirty: const Value(true),
            updatedAt: Value(now),
            syncVersion: Value(newVersion),
          ),
        );
        break;
      case SyncableTable.workoutPlans:
        final current = await (select(
          workoutPlans,
        )..where((t) => t.id.equals(recordId))).getSingleOrNull();
        final newVersion = (current?.syncVersion ?? 0) + 1;
        await (update(workoutPlans)..where((t) => t.id.equals(recordId))).write(
          WorkoutPlansCompanion(
            isDirty: const Value(true),
            updatedAt: Value(now),
            syncVersion: Value(newVersion),
          ),
        );
        break;
      case SyncableTable.workoutPlanExercises:
        final current = await (select(
          workoutPlanExercises,
        )..where((t) => t.id.equals(recordId))).getSingleOrNull();
        final newVersion = (current?.syncVersion ?? 0) + 1;
        await (update(
          workoutPlanExercises,
        )..where((t) => t.id.equals(recordId))).write(
          WorkoutPlanExercisesCompanion(
            isDirty: const Value(true),
            updatedAt: Value(now),
            syncVersion: Value(newVersion),
          ),
        );
        break;
      case SyncableTable.workoutSessions:
        final current = await (select(
          workoutSessions,
        )..where((t) => t.id.equals(recordId))).getSingleOrNull();
        final newVersion = (current?.syncVersion ?? 0) + 1;
        await (update(
          workoutSessions,
        )..where((t) => t.id.equals(recordId))).write(
          WorkoutSessionsCompanion(
            isDirty: const Value(true),
            updatedAt: Value(now),
            syncVersion: Value(newVersion),
          ),
        );
        break;
      case SyncableTable.sessionExercises:
        final current = await (select(
          sessionExercises,
        )..where((t) => t.id.equals(recordId))).getSingleOrNull();
        final newVersion = (current?.syncVersion ?? 0) + 1;
        await (update(
          sessionExercises,
        )..where((t) => t.id.equals(recordId))).write(
          SessionExercisesCompanion(
            isDirty: const Value(true),
            updatedAt: Value(now),
            syncVersion: Value(newVersion),
          ),
        );
        break;
      case SyncableTable.workoutSets:
        final current = await (select(
          workoutSets,
        )..where((t) => t.id.equals(recordId))).getSingleOrNull();
        final newVersion = (current?.syncVersion ?? 0) + 1;
        await (update(workoutSets)..where((t) => t.id.equals(recordId))).write(
          WorkoutSetsCompanion(
            isDirty: const Value(true),
            updatedAt: Value(now),
            syncVersion: Value(newVersion),
          ),
        );
        break;
      case SyncableTable.personalRecords:
        final current = await (select(
          personalRecords,
        )..where((t) => t.id.equals(recordId))).getSingleOrNull();
        final newVersion = (current?.syncVersion ?? 0) + 1;
        await (update(
          personalRecords,
        )..where((t) => t.id.equals(recordId))).write(
          PersonalRecordsCompanion(
            isDirty: const Value(true),
            syncVersion: Value(newVersion),
          ),
        );
        break;
    }
  }

  /// Mark a record as synced (clear dirty flag).
  /// Called after successful sync to remote.
  Future<void> markSynced(SyncableTable table, String recordId) async {
    final now = DateTime.now();
    switch (table) {
      case SyncableTable.users:
        await (update(users)..where((t) => t.id.equals(recordId))).write(
          UsersCompanion(isDirty: const Value(false), lastSyncedAt: Value(now)),
        );
        break;
      case SyncableTable.exercises:
        await (update(exercises)..where((t) => t.id.equals(recordId))).write(
          ExercisesCompanion(
            isDirty: const Value(false),
            lastSyncedAt: Value(now),
          ),
        );
        break;
      case SyncableTable.workoutPlans:
        await (update(workoutPlans)..where((t) => t.id.equals(recordId))).write(
          WorkoutPlansCompanion(
            isDirty: const Value(false),
            lastSyncedAt: Value(now),
          ),
        );
        break;
      case SyncableTable.workoutPlanExercises:
        await (update(workoutPlanExercises)
              ..where((t) => t.id.equals(recordId)))
            .write(const WorkoutPlanExercisesCompanion(isDirty: Value(false)));
        break;
      case SyncableTable.workoutSessions:
        await (update(
          workoutSessions,
        )..where((t) => t.id.equals(recordId))).write(
          WorkoutSessionsCompanion(
            isDirty: const Value(false),
            lastSyncedAt: Value(now),
          ),
        );
        break;
      case SyncableTable.sessionExercises:
        await (update(sessionExercises)..where((t) => t.id.equals(recordId)))
            .write(const SessionExercisesCompanion(isDirty: Value(false)));
        break;
      case SyncableTable.workoutSets:
        await (update(workoutSets)..where((t) => t.id.equals(recordId))).write(
          const WorkoutSetsCompanion(isDirty: Value(false)),
        );
        break;
      case SyncableTable.personalRecords:
        await (update(personalRecords)..where((t) => t.id.equals(recordId)))
            .write(const PersonalRecordsCompanion(isDirty: Value(false)));
        break;
    }
  }

  /// @deprecated Use markDirty(SyncableTable, String) instead
  /// Kept for backwards compatibility during migration
  @Deprecated('Use markDirty(SyncableTable, String) instead')
  Future<void> markAsDirty(String tableName, String recordId) async {
    final table = SyncableTable.values.firstWhere(
      (t) => t.tableName == tableName,
      orElse: () => throw ArgumentError('Unknown table: $tableName'),
    );
    await markDirty(table, recordId);
  }

  /// Get all dirty records for sync
  Future<Map<String, List<dynamic>>> getDirtyRecords() async {
    return {
      SyncableTable.users.tableName: await (select(
        users,
      )..where((t) => t.isDirty.equals(true))).get(),
      SyncableTable.exercises.tableName: await (select(
        exercises,
      )..where((t) => t.isDirty.equals(true))).get(),
      SyncableTable.workoutPlans.tableName: await (select(
        workoutPlans,
      )..where((t) => t.isDirty.equals(true))).get(),
      SyncableTable.workoutSessions.tableName: await (select(
        workoutSessions,
      )..where((t) => t.isDirty.equals(true))).get(),
      SyncableTable.sessionExercises.tableName: await (select(
        sessionExercises,
      )..where((t) => t.isDirty.equals(true))).get(),
      SyncableTable.workoutSets.tableName: await (select(
        workoutSets,
      )..where((t) => t.isDirty.equals(true))).get(),
      SyncableTable.personalRecords.tableName: await (select(
        personalRecords,
      )..where((t) => t.isDirty.equals(true))).get(),
    };
  }

  // ============================================================
  // SYNC QUEUE OPERATIONS (MINIMAL PAYLOAD)
  // ============================================================

  /// Queue a record for sync with minimal payload.
  /// Only stores table, recordId, and operation type.
  /// Actual data is read at sync time to ensure consistency.
  Future<void> queueSync(
    SyncableTable table,
    String recordId,
    SyncOperation operation,
  ) async {
    // Check if already queued (avoid duplicates)
    final existing =
        await (select(syncQueue)
              ..where((t) => t.targetTable.equals(table.tableName))
              ..where((t) => t.recordId.equals(recordId)))
            .getSingleOrNull();

    if (existing != null) {
      // Update operation if needed (e.g., insert then update = insert)
      if (existing.operation != operation.value) {
        await (update(syncQueue)..where((t) => t.id.equals(existing.id))).write(
          SyncQueueCompanion(operation: Value(operation.value)),
        );
      }
      return;
    }

    await into(syncQueue).insert(
      SyncQueueCompanion.insert(
        targetTable: table.tableName,
        recordId: recordId,
        operation: operation.value,
      ),
    );
  }

  /// Get pending sync queue items
  Future<List<SyncQueueEntity>> getPendingSyncItems() async {
    return (select(
      syncQueue,
    )..orderBy([(t) => OrderingTerm.asc(t.createdAt)])).get();
  }

  /// Remove item from sync queue after successful sync
  Future<void> removeSyncQueueItem(int id) async {
    await (delete(syncQueue)..where((t) => t.id.equals(id))).go();
  }

  // ============================================================
  // SESSION STATISTICS (SOURCE OF TRUTH: WorkoutSets)
  // ============================================================

  /// Recalculate and update cached session statistics from WorkoutSets.
  /// Call this whenever sets are added, modified, or deleted.
  Future<void> recalculateSessionStats(String sessionId) async {
    // Get all completed sets for this session
    final sessionExerciseIds = await (select(
      sessionExercises,
    )..where((t) => t.sessionId.equals(sessionId))).map((e) => e.id).get();

    if (sessionExerciseIds.isEmpty) {
      await (update(
        workoutSessions,
      )..where((t) => t.id.equals(sessionId))).write(
        const WorkoutSessionsCompanion(
          totalVolume: Value(0.0),
          totalSets: Value(0),
          totalReps: Value(0),
        ),
      );
      return;
    }

    // Calculate totals from WorkoutSets (source of truth)
    final sets =
        await (select(workoutSets)
              ..where((t) => t.sessionExerciseId.isIn(sessionExerciseIds))
              ..where((t) => t.isCompleted.equals(true)))
            .get();

    double totalVolume = 0.0;
    int totalSets = sets.length;
    int totalReps = 0;

    for (final set in sets) {
      if (set.reps != null) {
        totalReps += set.reps!;
        if (set.weight != null) {
          totalVolume += set.weight! * set.reps!;
        }
      }
    }

    // Update cached values
    await (update(workoutSessions)..where((t) => t.id.equals(sessionId))).write(
      WorkoutSessionsCompanion(
        totalVolume: Value(totalVolume),
        totalSets: Value(totalSets),
        totalReps: Value(totalReps),
      ),
    );
  }

  // ============================================================
  // SAFE DATA CLEARING
  // ============================================================

  /// Clear all data for a specific user.
  /// Safe for multi-user scenarios - only clears data owned by userId.
  Future<void> clearUserData(String userId) async {
    // Delete in order respecting foreign key constraints
    // 1. First delete sync queue entries for this user's data
    await delete(syncQueue).go();

    // 2. Delete sets through session exercises
    final userSessionIds = await (select(
      workoutSessions,
    )..where((t) => t.userId.equals(userId))).map((s) => s.id).get();

    if (userSessionIds.isNotEmpty) {
      final sessionExerciseIds = await (select(
        sessionExercises,
      )..where((t) => t.sessionId.isIn(userSessionIds))).map((e) => e.id).get();

      if (sessionExerciseIds.isNotEmpty) {
        await (delete(
          workoutSets,
        )..where((t) => t.sessionExerciseId.isIn(sessionExerciseIds))).go();
      }
      await (delete(
        sessionExercises,
      )..where((t) => t.sessionId.isIn(userSessionIds))).go();
    }

    // 3. Delete personal records
    await (delete(personalRecords)..where((t) => t.userId.equals(userId))).go();

    // 4. Delete workout sessions
    await (delete(workoutSessions)..where((t) => t.userId.equals(userId))).go();

    // 5. Delete workout plan exercises
    final userPlanIds = await (select(
      workoutPlans,
    )..where((t) => t.userId.equals(userId))).map((p) => p.id).get();

    if (userPlanIds.isNotEmpty) {
      await (delete(
        workoutPlanExercises,
      )..where((t) => t.workoutPlanId.isIn(userPlanIds))).go();
    }

    // 6. Delete workout plans
    await (delete(workoutPlans)..where((t) => t.userId.equals(userId))).go();

    // 7. Delete exercises
    await (delete(exercises)..where((t) => t.userId.equals(userId))).go();

    // 8. Finally delete user
    await (delete(users)..where((t) => t.id.equals(userId))).go();
  }

  /// Clear ALL data (use with caution - for complete app reset only).
  /// @deprecated Prefer clearUserData(userId) for user-specific clearing.
  @Deprecated('Use clearUserData(userId) for safer per-user data clearing')
  Future<void> clearAllData() async {
    // Delete in foreign key order
    await delete(syncQueue).go();
    await delete(personalRecords).go();
    await delete(workoutSets).go();
    await delete(sessionExercises).go();
    await delete(workoutSessions).go();
    await delete(workoutPlanExercises).go();
    await delete(workoutPlans).go();
    await delete(exercises).go();
    await delete(users).go();
  }
}

/// Open database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'workout_tracker.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
