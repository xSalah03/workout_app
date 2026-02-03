import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../database/database.dart';

part 'workout_session.freezed.dart';

/// WorkoutSession entity - actual workout instance
@freezed
class WorkoutSession with _$WorkoutSession {
  const WorkoutSession._();

  const factory WorkoutSession({
    required String id,
    required String userId,
    String? workoutPlanId,
    required String name,
    String? notes,
    required DateTime startedAt,
    DateTime? completedAt,
    int? durationSeconds,
    double? totalVolume,
    int? totalSets,
    int? totalReps,
    @Default(WorkoutStatus.inProgress) WorkoutStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDirty,
    @Default(0) int syncVersion,
    DateTime? lastSyncedAt,
    String? remoteId,
    @Default([]) List<SessionExercise> exercises,
  }) = _WorkoutSession;

  /// Check if workout is in progress
  bool get isInProgress => status == WorkoutStatus.inProgress;

  /// Check if workout is completed
  bool get isCompleted => status == WorkoutStatus.completed;

  /// Get duration display
  String get durationDisplay {
    if (durationSeconds == null) {
      // Calculate from start time if not set
      final duration = DateTime.now().difference(startedAt);
      return _formatDuration(duration.inSeconds);
    }
    return _formatDuration(durationSeconds!);
  }

  String _formatDuration(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else if (minutes > 0) {
      return '${minutes}m ${secs}s';
    } else {
      return '${secs}s';
    }
  }

  /// Get volume display
  String getVolumeDisplay({String weightUnit = 'kg'}) {
    if (totalVolume == null) return '-';
    if (totalVolume! >= 1000) {
      return '${(totalVolume! / 1000).toStringAsFixed(1)}k $weightUnit';
    }
    return '${totalVolume!.toStringAsFixed(0)} $weightUnit';
  }

  /// Get sets completed
  int get completedSetsCount {
    return exercises.fold(
      0,
      (sum, ex) => sum + ex.sets.where((s) => s.isCompleted).length,
    );
  }

  /// Get total sets planned
  int get totalSetsPlanned {
    return exercises.fold(0, (sum, ex) => sum + ex.sets.length);
  }

  /// Get progress percentage (0.0 - 1.0)
  double get progressPercentage {
    if (totalSetsPlanned == 0) return 0.0;
    return completedSetsCount / totalSetsPlanned;
  }

  /// Calculate total volume from exercises
  double calculateTotalVolume() {
    return exercises.fold(0.0, (sum, ex) {
      return sum +
          ex.sets.fold(0.0, (setSum, set) {
            if (set.isCompleted && set.weight != null && set.reps != null) {
              return setSum + (set.weight! * set.reps!);
            }
            return setSum;
          });
    });
  }
}

/// SessionExercise entity - exercise in a workout session
@freezed
class SessionExercise with _$SessionExercise {
  const SessionExercise._();

  const factory SessionExercise({
    required String id,
    required String sessionId,
    required String exerciseId,
    @Default(0) int sortOrder,
    String? notes,
    DateTime? startedAt,
    DateTime? completedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDirty,
    @Default(0) int syncVersion,
    String? remoteId,
    // Joined data
    String? exerciseName,
    MuscleGroup? muscleGroup,
    EquipmentType? equipment,
    @Default([]) List<ExerciseSet> sets,
  }) = _SessionExercise;

  /// Check if all sets are completed
  bool get isCompleted => sets.isNotEmpty && sets.every((s) => s.isCompleted);

  /// Get completed sets count
  int get completedSetsCount => sets.where((s) => s.isCompleted).length;

  /// Get total volume for this exercise
  double get totalVolume {
    return sets.fold(0.0, (sum, set) {
      if (set.isCompleted && set.weight != null && set.reps != null) {
        return sum + (set.weight! * set.reps!);
      }
      return sum;
    });
  }

  /// Get best set (highest weight * reps)
  ExerciseSet? get bestSet {
    if (sets.isEmpty) return null;
    return sets.where((s) => s.isCompleted).fold<ExerciseSet?>(null, (
      best,
      set,
    ) {
      if (best == null) return set;
      final bestVolume = (best.weight ?? 0) * (best.reps ?? 0);
      final setVolume = (set.weight ?? 0) * (set.reps ?? 0);
      return setVolume > bestVolume ? set : best;
    });
  }
}

/// ExerciseSet entity - individual set in a session
@freezed
class ExerciseSet with _$ExerciseSet {
  const ExerciseSet._();

  const factory ExerciseSet({
    required String id,
    required String sessionExerciseId,
    required int setNumber,
    int? reps,
    double? weight,
    int? durationSeconds,
    double? distance,
    int? restSeconds,
    @Default(SetType.working) SetType setType,
    double? rpe,
    @Default(false) bool isCompleted,
    String? notes,
    DateTime? completedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDirty,
    @Default(0) int syncVersion,
    String? remoteId,
  }) = _ExerciseSet;

  /// Get volume for this set
  double get volume {
    if (weight == null || reps == null) return 0.0;
    return weight! * reps!;
  }

  /// Get display string (e.g., "60kg x 10")
  String getDisplay({String weightUnit = 'kg'}) {
    final parts = <String>[];
    if (weight != null) {
      parts.add('${weight!.toStringAsFixed(1)} $weightUnit');
    }
    if (reps != null) {
      parts.add('x $reps');
    }
    if (durationSeconds != null) {
      parts.add('${durationSeconds}s');
    }
    if (parts.isEmpty) return '-';
    return parts.join(' ');
  }

  /// Get set type badge color
  String get setTypeBadge {
    switch (setType) {
      case SetType.warmup:
        return 'W';
      case SetType.working:
        return '';
      case SetType.dropset:
        return 'D';
      case SetType.failure:
        return 'F';
      case SetType.restPause:
        return 'RP';
    }
  }

  /// Calculate estimated 1RM using Epley formula
  double? get estimated1RM {
    if (weight == null || reps == null || reps! <= 0) return null;
    if (reps == 1) return weight;
    // Epley formula: 1RM = weight × (1 + reps/30)
    return weight! * (1 + reps! / 30);
  }
}
