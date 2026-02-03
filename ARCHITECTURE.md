# Workout Tracker - Architecture Documentation

## System Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              PRESENTATION LAYER                                  │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐            │
│  │   Screens   │  │   Widgets   │  │  Providers  │  │    State    │            │
│  │  (Flutter)  │  │  (Flutter)  │  │  (Riverpod) │  │  Notifiers  │            │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘            │
│         │                │                │                │                    │
│         └────────────────┴────────────────┴────────────────┘                    │
│                                    │                                            │
└────────────────────────────────────┼────────────────────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────────────┐
│                               DOMAIN LAYER                                       │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐                             │
│  │  Entities   │  │  Use Cases  │  │ Repository  │                             │
│  │  (Models)   │  │  (Business  │  │ Interfaces  │                             │
│  │             │  │   Logic)    │  │             │                             │
│  └─────────────┘  └──────┬──────┘  └──────┬──────┘                             │
│                          │                │                                     │
└──────────────────────────┼────────────────┼─────────────────────────────────────┘
                           │                │
                           ▼                ▼
┌─────────────────────────────────────────────────────────────────────────────────┐
│                                DATA LAYER                                        │
│  ┌─────────────────────────────────────────────────────────────────────────┐   │
│  │                         Repository Implementation                        │   │
│  │  ┌───────────────────────────────────────────────────────────────────┐  │   │
│  │  │                        Offline-First Logic                         │  │   │
│  │  │   1. Write to Local DB (Drift/SQLite)                             │  │   │
│  │  │   2. Mark as "dirty" for sync                                     │  │   │
│  │  │   3. If online, sync to remote (Supabase)                         │  │   │
│  │  │   4. Resolve conflicts with version checking                       │  │   │
│  │  └───────────────────────────────────────────────────────────────────┘  │   │
│  └─────────────────────────────────────────────────────────────────────────┘   │
│                                                                                  │
│  ┌─────────────────────────┐           ┌─────────────────────────┐             │
│  │   Local Data Source     │           │   Remote Data Source    │             │
│  │  ┌─────────────────┐   │           │  ┌─────────────────┐   │             │
│  │  │  Drift (SQLite) │   │◄─────────►│  │    Supabase     │   │             │
│  │  │   - Type-safe   │   │   Sync    │  │  - PostgreSQL   │   │             │
│  │  │   - Reactive    │   │           │  │  - Real-time    │   │             │
│  │  │   - Migrations  │   │           │  │  - Auth         │   │             │
│  │  └─────────────────┘   │           │  └─────────────────┘   │             │
│  └─────────────────────────┘           └─────────────────────────┘             │
│                                                                                  │
└─────────────────────────────────────────────────────────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              CORE LAYER                                          │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐         │
│  │  Theme   │  │  Utils   │  │  Errors  │  │ Network  │  │Constants │         │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘  └──────────┘         │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## Folder Structure

```
lib/
├── main.dart                          # App entry point
├── database/
│   └── database.dart                  # Drift database definition
├── core/
│   ├── constants/
│   │   └── app_constants.dart         # App-wide constants
│   ├── errors/
│   │   ├── exceptions.dart            # Custom exceptions
│   │   └── failures.dart              # Failure types for Either
│   ├── extensions/
│   │   ├── context_extensions.dart    # BuildContext helpers
│   │   ├── datetime_extensions.dart   # DateTime formatting
│   │   └── number_extensions.dart     # Number formatting
│   ├── network/
│   │   └── network_info.dart          # Connectivity monitoring
│   ├── providers/
│   │   └── providers.dart             # Core Riverpod providers
│   ├── theme/
│   │   └── app_theme.dart             # Light/Dark themes
│   ├── utils/
│   │   ├── typedefs.dart              # Type aliases
│   │   └── validators.dart            # Input validation
│   └── widgets/                       # Shared widgets
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── auth_local_datasource.dart
│   │   │   │   └── auth_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── user_mapper.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user.dart
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart
│   │   │   └── usecases/
│   │   │       └── auth_usecases.dart
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── auth_provider.dart
│   │       ├── screens/
│   │       │   ├── auth_wrapper.dart
│   │       │   ├── login_screen.dart
│   │       │   └── onboarding_screen.dart
│   │       └── widgets/
│   ├── workout/
│   │   ├── data/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── workout_plan.dart
│   │   │   │   └── workout_session.dart
│   │   │   ├── repositories/
│   │   │   │   └── workout_repository.dart
│   │   │   └── usecases/
│   │   │       └── workout_usecases.dart
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── workout_provider.dart
│   │       ├── screens/
│   │       │   ├── active_workout_screen.dart
│   │       │   ├── home_screen.dart
│   │       │   └── workout_plans_screen.dart
│   │       └── widgets/
│   │           ├── rest_timer_widget.dart
│   │           └── set_input_row.dart
│   ├── exercise/
│   │   ├── data/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── exercise.dart
│   │   │   └── repositories/
│   │   │       └── exercise_repository.dart
│   │   └── presentation/
│   │       └── screens/
│   │           └── exercises_screen.dart
│   ├── progress/
│   │   ├── data/
│   │   │   └── services/
│   │   │       ├── export_service.dart
│   │   │       └── pr_service.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── personal_record.dart
│   │   │   └── repositories/
│   │   │       └── progress_repository.dart
│   │   └── presentation/
│   │       └── screens/
│   │           └── progress_screen.dart
│   ├── sync/
│   │   ├── data/
│   │   │   └── repositories/
│   │   │       └── sync_repository_impl.dart
│   │   └── domain/
│   │       └── repositories/
│   │           └── sync_repository.dart
│   └── settings/
│       └── presentation/
│           ├── providers/
│           │   └── settings_provider.dart
│           └── screens/
│               └── settings_screen.dart
└── test/
    ├── unit/
    ├── widget/
    └── integration/
```

## Tech Stack Justification

### Flutter (Presentation)
- Cross-platform from single codebase (iOS + Android)
- Hot reload for rapid development
- Rich widget ecosystem
- Strong typing with Dart

### Drift (SQLite) - Local Database
- **Type-safe SQL queries** with compile-time validation
- **Reactive streams** for automatic UI updates
- **Built-in migrations** for schema evolution
- Better DX than raw sqflite
- Full offline capability

### Riverpod - State Management
- **Compile-time safety** - catches errors before runtime
- **No BuildContext dependency** - use anywhere
- **Built-in dependency injection** - clean architecture friendly
- **Automatic disposal** - prevents memory leaks
- **Excellent testability** - easy to mock

### Supabase - Remote Backend
- **Generous free tier**: 500MB database, 1GB storage, 50K monthly active users
- **PostgreSQL backend** - robust, scalable
- **Built-in authentication** - email, anonymous, OAuth
- **Real-time subscriptions** (optional for future features)
- **Row Level Security** for data protection

### fl_chart - Charts
- **No native dependencies** - pure Flutter
- **Highly customizable** - matches any design
- **Performant** - handles large datasets
- **All chart types** - line, bar, pie, etc.

## Database Schema

```sql
-- Users table
CREATE TABLE users (
  id TEXT PRIMARY KEY,
  email TEXT,
  display_name TEXT,
  supabase_id TEXT,
  is_anonymous INTEGER DEFAULT 1,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  is_dirty INTEGER DEFAULT 0,
  sync_version INTEGER DEFAULT 0,
  last_synced_at DATETIME
);

-- Exercises table
CREATE TABLE exercises (
  id TEXT PRIMARY KEY,
  user_id TEXT REFERENCES users(id),
  name TEXT NOT NULL,
  description TEXT,
  muscle_group TEXT NOT NULL,
  secondary_muscles TEXT, -- JSON array
  equipment TEXT NOT NULL,
  instructions TEXT,
  image_url TEXT,
  is_custom INTEGER DEFAULT 1,
  is_active INTEGER DEFAULT 1,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  is_dirty INTEGER DEFAULT 0,
  sync_version INTEGER DEFAULT 0,
  last_synced_at DATETIME,
  remote_id TEXT
);

-- Workout Plans table
CREATE TABLE workout_plans (
  id TEXT PRIMARY KEY,
  user_id TEXT REFERENCES users(id),
  name TEXT NOT NULL,
  description TEXT,
  target_muscle_groups TEXT, -- JSON array
  estimated_duration_minutes INTEGER,
  sort_order INTEGER DEFAULT 0,
  is_active INTEGER DEFAULT 1,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  is_dirty INTEGER DEFAULT 0,
  sync_version INTEGER DEFAULT 0,
  last_synced_at DATETIME,
  remote_id TEXT
);

-- Workout Sessions table
-- NOTE: total_volume, total_sets, total_reps are CACHED values
-- computed from workout_sets table. workout_sets is the source of truth.
CREATE TABLE workout_sessions (
  id TEXT PRIMARY KEY,
  user_id TEXT REFERENCES users(id),
  workout_plan_id TEXT REFERENCES workout_plans(id),
  name TEXT NOT NULL,
  notes TEXT,
  started_at DATETIME NOT NULL,
  completed_at DATETIME,
  duration_seconds INTEGER,
  total_volume REAL,      -- CACHED: computed from workout_sets
  total_sets INTEGER,     -- CACHED: computed from workout_sets
  total_reps INTEGER,     -- CACHED: computed from workout_sets
  status TEXT DEFAULT 'in_progress',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  is_dirty INTEGER DEFAULT 0,
  sync_version INTEGER DEFAULT 0,
  last_synced_at DATETIME,
  remote_id TEXT
);

-- WorkoutSets table (renamed from 'sets' to avoid SQL reserved word)
-- This is the SINGLE SOURCE OF TRUTH for all set data
CREATE TABLE workout_sets (
  id TEXT PRIMARY KEY,
  session_exercise_id TEXT REFERENCES session_exercises(id),
  set_number INTEGER NOT NULL,
  reps INTEGER,
  weight REAL,
  duration_seconds INTEGER,
  distance REAL,
  rest_seconds INTEGER,
  set_type TEXT DEFAULT 'working',
  rpe REAL,
  is_completed INTEGER DEFAULT 0,
  notes TEXT,
  completed_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  is_dirty INTEGER DEFAULT 0,
  sync_version INTEGER DEFAULT 0,
  remote_id TEXT
);

-- Personal Records table
CREATE TABLE personal_records (
  id TEXT PRIMARY KEY,
  user_id TEXT REFERENCES users(id),
  exercise_id TEXT REFERENCES exercises(id),
  record_type TEXT NOT NULL,
  value REAL NOT NULL,
  reps INTEGER,
  set_id TEXT REFERENCES workout_sets(id),
  achieved_at DATETIME NOT NULL,
  is_current_record INTEGER DEFAULT 1,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  is_dirty INTEGER DEFAULT 0,
  sync_version INTEGER DEFAULT 0,
  remote_id TEXT
);

-- Sync Queue table (minimal payload - data read at sync time)
CREATE TABLE sync_queue (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  target_table TEXT NOT NULL,  -- SyncableTable enum value
  record_id TEXT NOT NULL,
  operation TEXT NOT NULL,     -- SyncOperation: insert, update, delete
  retry_count INTEGER DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  last_attempt_at DATETIME,
  error_message TEXT
);

-- Indexes for performance
CREATE INDEX idx_exercises_user_id ON exercises(user_id);
CREATE INDEX idx_exercises_muscle_group ON exercises(muscle_group);
CREATE INDEX idx_workout_sessions_user_id ON workout_sessions(user_id);
CREATE INDEX idx_workout_sessions_started_at ON workout_sessions(started_at DESC);
CREATE INDEX idx_workout_sets_session_exercise_id ON workout_sets(session_exercise_id);
CREATE INDEX idx_workout_sets_completed_at ON workout_sets(completed_at);
CREATE INDEX idx_personal_records_user_exercise ON personal_records(user_id, exercise_id);
CREATE INDEX idx_dirty_records ON users(is_dirty) WHERE is_dirty = 1;
CREATE INDEX idx_sync_queue_created_at ON sync_queue(created_at);
```

## Offline-First Sync Algorithm

### Type-Safe Sync Enums

The sync system uses type-safe enums to prevent errors from string-based table names:

```dart
/// Tables that support sync operations
enum SyncableTable {
  users('users'),
  exercises('exercises'),
  workoutPlans('workout_plans'),
  workoutPlanExercises('workout_plan_exercises'),
  workoutSessions('workout_sessions'),
  sessionExercises('session_exercises'),
  workoutSets('workout_sets'),
  personalRecords('personal_records');
}

/// Sync operation types
enum SyncOperation {
  insert('insert'),
  update('update'),
  delete('delete');
}
```

### Sync Flow

```
┌─────────────────────────────────────────────────────────────────────┐
│                    OFFLINE-FIRST SYNC FLOW                          │
└─────────────────────────────────────────────────────────────────────┘

USER ACTION (e.g., complete set)
         │
         ▼
┌─────────────────────────────────────────────────────────────────────┐
│  1. WRITE TO LOCAL DATABASE                                         │
│     - Insert/Update record in SQLite                                │
│     - Call markDirty(SyncableTable, recordId) which:                │
│       • Sets is_dirty = true                                        │
│       • Auto-increments sync_version (enforced at DAO level)        │
│       • Updates updated_at timestamp                                │
└─────────────────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────────┐
│  2. CHECK CONNECTIVITY                                              │
│     - If OFFLINE: Queue for sync (minimal payload), done            │
│     - If ONLINE: Continue to step 3                                 │
└─────────────────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────────┐
│  3. UPLOAD DIRTY RECORDS                                            │
│     For each dirty record:                                          │
│     a. Read FRESH data from local DB (not from queue payload)       │
│     b. Check if remote record exists                                │
│     c. If NOT exists: INSERT to remote                              │
│     d. If EXISTS: Compare versions (conflict check)                 │
└─────────────────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────────┐
│  4. CONFLICT RESOLUTION (Last-Write-Wins with Versioning)           │
│                                                                     │
│     if (local.sync_version > remote.sync_version):                  │
│         → Local wins, update remote                                 │
│     else if (remote.sync_version > local.sync_version):             │
│         → Remote wins, save conflict for review                     │
│     else: (versions equal)                                          │
│         Compare timestamps:                                         │
│         → More recent wins                                          │
└─────────────────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────────┐
│  5. DOWNLOAD REMOTE CHANGES                                         │
│     - Query remote for records updated since last_synced_at         │
│     - Merge with local, applying conflict resolution                │
│     - Update local last_synced_at                                   │
└─────────────────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────────┐
│  6. MARK AS SYNCED                                                  │
│     - Call markSynced(SyncableTable, recordId) which:               │
│       • Sets is_dirty = false                                       │
│       • Updates last_synced_at                                      │
│     - Clear sync queue for this record                              │
└─────────────────────────────────────────────────────────────────────┘

KEY DESIGN DECISIONS:
─────────────────────
• MINIMAL SYNC QUEUE: Queue stores only (table, recordId, operation)
  - Actual data is read at sync time for consistency
  - Avoids stale payload issues when record is updated while queued

• AUTO-INCREMENT SYNC VERSION: Enforced at DAO level, not manually
  - Prevents forgotten version bumps in UI code
  - markDirty() atomically reads current version and increments

• TYPE-SAFE TABLE REFERENCES: SyncableTable enum prevents typos
  - Compile-time error if table name is wrong
  - Deprecated string-based markAsDirty() for backward compat

CONFLICT RESOLUTION DETAILS:
────────────────────────────
• Version numbers increment on every update
• Timestamps provide secondary ordering
• User can manually resolve via UI if needed
• No data is ever silently lost - conflicts are logged

AUTOMATIC SYNC TRIGGERS:
────────────────────────
• App comes to foreground
• Network becomes available
• Every 5 minutes while online
• Manual "Sync Now" button
```

## Performance Considerations

### Database Optimization
1. **Indexes on frequently queried columns**: user_id, started_at, muscle_group
2. **Partial indexes for dirty records**: Only index where is_dirty = 1
3. **Pagination for history**: Load 20 sessions at a time
4. **Lazy loading of sets**: Only load sets when expanding exercise

### UI Performance
1. **ListView.builder**: Virtualized lists for large data sets
2. **const widgets**: Minimize rebuilds
3. **Riverpod caching**: Automatic caching of computed values
4. **Image caching**: CachedNetworkImage for exercise images

### Memory Management
1. **Dispose controllers**: All TextEditingControllers disposed
2. **Cancel subscriptions**: Stream subscriptions cancelled
3. **Riverpod auto-dispose**: Unused providers cleaned up

### Network Efficiency
1. **Batch sync**: Upload/download in batches of 50
2. **Delta sync**: Only sync changed records since last sync
3. **Compression**: Consider gzip for large payloads

## Scaling Plan (100k+ Users)

### Phase 1: Current Architecture (0-10k users)
- Single Supabase instance
- SQLite local storage
- Basic sync queue

### Phase 2: Optimization (10k-50k users)
- Add Redis cache for hot data
- Implement read replicas
- Background sync with WorkManager/BGTaskScheduler
- Add analytics/crash reporting

### Phase 3: Scale Out (50k-100k+ users)
- Supabase Pro tier or self-hosted PostgreSQL
- CDN for static assets (exercise images)
- Consider sharding by user region
- Implement rate limiting
- Add API versioning for backward compatibility

### Database Scaling
- Archive old workout data (>1 year) to cold storage
- Implement soft deletes with periodic cleanup
- Consider time-series database for progress data

### Monitoring
- Sentry for crash reporting
- Custom analytics for sync health
- Performance monitoring with Firebase Performance

## Data Safety Patterns

### Source of Truth

The `workout_sets` table is the **single source of truth** for all set data:

```dart
// WorkoutSessions.totalVolume, totalSets, totalReps are CACHED values
// Always recalculate from workout_sets when sets change:
await _database.recalculateSessionStats(sessionId);
```

**Why this matters:**
- Prevents data drift between cached values and actual sets
- Ensures accurate statistics even if caching logic has bugs
- Simplifies debugging - one canonical source

### Safe Data Clearing

For multi-user scenarios and logout safety:

```dart
// PREFERRED: Clear only current user's data
await database.clearUserData(userId);

// DEPRECATED: Avoid unless doing full app reset
await database.clearAllData(); // Deprecated
```

**`clearUserData(userId)` cascade order:**
1. Sync queue entries
2. Workout sets (via session exercises)
3. Session exercises (via sessions)
4. Personal records
5. Workout sessions
6. Workout plan exercises (via plans)
7. Workout plans
8. Exercises
9. User record

This respects foreign key constraints and prevents orphaned records.

### Migration Safety

Database schema version is incremented for breaking changes:

```dart
@override
int get schemaVersion => 2; // Incremented for Sets → WorkoutSets rename

@override
MigrationStrategy get migration {
  return MigrationStrategy(
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        // Rename table, not drop/recreate (preserves data)
        await customStatement('ALTER TABLE sets RENAME TO workout_sets');
      }
    },
  );
}
```
