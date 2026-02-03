/// App-wide constants
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Workout Tracker';
  static const String appVersion = '1.0.0';

  // Database
  static const String databaseName = 'workout_tracker.sqlite';
  static const int databaseVersion = 1;

  // Sync
  static const int syncBatchSize = 50;
  static const int maxSyncRetries = 3;
  static const Duration syncInterval = Duration(minutes: 5);
  static const Duration syncTimeout = Duration(seconds: 30);

  // Cache
  static const Duration cacheDuration = Duration(hours: 24);

  // Workout
  static const int defaultRestSeconds = 90;
  static const int defaultSets = 3;
  static const int defaultReps = 10;
  static const int maxSetsPerExercise = 20;
  static const int maxExercisesPerWorkout = 30;

  // Progress
  static const int prHistoryDays = 365;
  static const int trendDaysShort = 7;
  static const int trendDaysMedium = 30;
  static const int trendDaysLong = 90;

  // Validation
  static const int minPasswordLength = 8;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 30;
  static const int maxNameLength = 100;
  static const int maxNotesLength = 1000;
  static const double maxWeight = 1000.0; // kg
  static const int maxReps = 1000;
  static const int maxDuration = 86400; // seconds (24 hours)

  // UI
  static const int animationDurationMs = 300;
  static const double cardBorderRadius = 12.0;
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
}

/// Supabase configuration
/// URL and anonKey are loaded from .env at runtime - see main.dart
class SupabaseConfig {
  SupabaseConfig._();

  /// Deep link for auth callbacks (email verification, password reset)
  /// Add this exact URL to Supabase: Auth → URL Configuration → Redirect URLs
  static const String authCallbackUrl =
      'com.workouttracker.workoutapp://auth-callback/';

  // Table names
  static const String usersTable = 'users';
  static const String exercisesTable = 'exercises';
  static const String workoutPlansTable = 'workout_plans';
  static const String workoutPlanExercisesTable = 'workout_plan_exercises';
  static const String workoutSessionsTable = 'workout_sessions';
  static const String sessionExercisesTable = 'session_exercises';
  static const String setsTable = 'workout_sets';
  static const String personalRecordsTable = 'personal_records';
}

/// Storage keys for SharedPreferences and SecureStorage
class StorageKeys {
  StorageKeys._();

  // Auth
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String isLoggedIn = 'is_logged_in';
  static const String isAnonymous = 'is_anonymous';

  // Settings
  static const String theme = 'theme';
  static const String weightUnit = 'weight_unit';
  static const String distanceUnit = 'distance_unit';
  static const String notificationsEnabled = 'notifications_enabled';
  static const String restDayReminder = 'rest_day_reminder';
  static const String lastSyncTime = 'last_sync_time';
  static const String onboardingComplete = 'onboarding_complete';
}

/// Weight units
enum WeightUnit {
  kg('kg', 'Kilograms', 1.0),
  lbs('lbs', 'Pounds', 2.20462);

  final String symbol;
  final String displayName;
  final double conversionFromKg;

  const WeightUnit(this.symbol, this.displayName, this.conversionFromKg);
}

/// Distance units
enum DistanceUnit {
  km('km', 'Kilometers', 1.0),
  miles('mi', 'Miles', 0.621371);

  final String symbol;
  final String displayName;
  final double conversionFromKm;

  const DistanceUnit(this.symbol, this.displayName, this.conversionFromKm);
}

/// Workout session status
enum WorkoutStatus {
  inProgress('in_progress', 'In Progress'),
  completed('completed', 'Completed'),
  cancelled('cancelled', 'Cancelled');

  final String value;
  final String displayName;

  const WorkoutStatus(this.value, this.displayName);

  static WorkoutStatus fromString(String value) {
    return WorkoutStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => WorkoutStatus.inProgress,
    );
  }
}

/// Set types
enum SetType {
  warmup('warmup', 'Warm-up'),
  working('working', 'Working'),
  dropset('dropset', 'Drop Set'),
  failure('failure', 'To Failure'),
  restPause('rest_pause', 'Rest-Pause');

  final String value;
  final String displayName;

  const SetType(this.value, this.displayName);

  static SetType fromString(String value) {
    return SetType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => SetType.working,
    );
  }
}

/// PR record types
enum RecordType {
  maxWeight('max_weight', 'Max Weight'),
  maxReps('max_reps', 'Max Reps'),
  maxVolume('max_volume', 'Max Volume'),
  maxDuration('max_duration', 'Max Duration'),
  oneRepMax('one_rep_max', 'Estimated 1RM');

  final String value;
  final String displayName;

  const RecordType(this.value, this.displayName);

  static RecordType fromString(String value) {
    return RecordType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => RecordType.maxWeight,
    );
  }
}
