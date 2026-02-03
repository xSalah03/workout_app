import '../../../../core/utils/typedefs.dart';
import '../../../../core/constants/app_constants.dart';
import '../entities/personal_record.dart';

/// Progress tracking repository interface
abstract class ProgressRepository {
  // ============================================================
  // PERSONAL RECORDS
  // ============================================================

  /// Get all personal records for user
  ResultFuture<List<PersonalRecord>> getPersonalRecords({
    String? exerciseId,
    RecordType? recordType,
    bool currentOnly = true,
  });

  /// Get personal records for an exercise
  ResultFuture<List<PersonalRecord>> getExerciseRecords(String exerciseId);

  /// Check and create new PR if applicable
  ResultFuture<PersonalRecord?> checkAndCreatePR({
    required String exerciseId,
    required RecordType recordType,
    required double value,
    int? reps,
    String? setId,
  });

  /// Get PR history for an exercise
  ResultFuture<List<PersonalRecord>> getPRHistory({
    required String exerciseId,
    required RecordType recordType,
  });

  // ============================================================
  // STATISTICS
  // ============================================================

  /// Get exercise stats
  ResultFuture<ExerciseStats> getExerciseStats(String exerciseId);

  /// Get weekly progress stats
  ResultFuture<ProgressStats> getWeeklyStats({DateTime? weekStart});

  /// Get monthly progress stats
  ResultFuture<ProgressStats> getMonthlyStats({DateTime? monthStart});

  /// Get volume per muscle group for period
  ResultFuture<Map<String, double>> getVolumeByMuscleGroup({
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Get workout frequency (workouts per week)
  ResultFuture<double> getWorkoutFrequency({int weeks = 4});

  /// Get workout streak (consecutive days)
  ResultFuture<int> getCurrentStreak();

  /// Get longest streak
  ResultFuture<int> getLongestStreak();

  // ============================================================
  // TRENDS & ANALYSIS
  // ============================================================

  /// Get weight progression for an exercise
  ResultFuture<List<({DateTime date, double weight, int reps})>>
  getWeightProgression({
    required String exerciseId,
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Get volume trend over time
  ResultFuture<List<({DateTime date, double volume})>> getVolumeTrend({
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Get workout duration trend
  ResultFuture<List<({DateTime date, int durationSeconds})>> getDurationTrend({
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Detect deload needed (volume/intensity drop suggestion)
  ResultFuture<bool> shouldDeload({int weeksToAnalyze = 4});

  /// Get progressive overload suggestions for an exercise
  ResultFuture<({double suggestedWeight, int suggestedReps})?>
  getProgressiveOverloadSuggestion(String exerciseId);

  // ============================================================
  // EXPORT
  // ============================================================

  /// Export workout history to CSV
  ResultFuture<String> exportToCSV({DateTime? startDate, DateTime? endDate});
}
