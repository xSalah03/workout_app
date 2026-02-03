import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../database/database.dart';

part 'workout_plan.freezed.dart';

/// WorkoutPlan entity - reusable workout template
@freezed
class WorkoutPlan with _$WorkoutPlan {
  const WorkoutPlan._();

  const factory WorkoutPlan({
    required String id,
    required String userId,
    required String name,
    String? description,
    @Default([]) List<MuscleGroup> targetMuscleGroups,
    int? estimatedDurationMinutes,
    @Default(0) int sortOrder,
    @Default(true) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDirty,
    @Default(0) int syncVersion,
    DateTime? lastSyncedAt,
    String? remoteId,
    @Default([]) List<WorkoutPlanExercise> exercises,
  }) = _WorkoutPlan;

  /// Get total exercises count
  int get exerciseCount => exercises.length;

  /// Get estimated duration display
  String get durationDisplay {
    if (estimatedDurationMinutes == null) return 'Not set';
    if (estimatedDurationMinutes! < 60) return '${estimatedDurationMinutes}min';
    final hours = estimatedDurationMinutes! ~/ 60;
    final mins = estimatedDurationMinutes! % 60;
    return mins > 0 ? '${hours}h ${mins}min' : '${hours}h';
  }

  /// Get muscle groups display
  String get muscleGroupsDisplay {
    if (targetMuscleGroups.isEmpty) return 'Full Body';
    return targetMuscleGroups.map((m) => m.name).join(', ');
  }
}

/// WorkoutPlanExercise - exercise within a workout plan template
@freezed
class WorkoutPlanExercise with _$WorkoutPlanExercise {
  const WorkoutPlanExercise._();

  const factory WorkoutPlanExercise({
    required String id,
    required String workoutPlanId,
    required String exerciseId,
    @Default(0) int sortOrder,
    @Default(3) int targetSets,
    int? targetReps,
    double? targetWeight,
    @Default(90) int restSeconds,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDirty,
    @Default(0) int syncVersion,
    String? remoteId,
    // Joined data
    String? exerciseName,
    MuscleGroup? muscleGroup,
    EquipmentType? equipment,
  }) = _WorkoutPlanExercise;

  /// Get target display (e.g., "3x10 @ 60kg")
  String getTargetDisplay({String weightUnit = 'kg'}) {
    final parts = <String>[];
    if (targetReps != null) {
      parts.add('${targetSets}x$targetReps');
    } else {
      parts.add('$targetSets sets');
    }
    if (targetWeight != null) {
      parts.add('@ ${targetWeight!.toStringAsFixed(1)} $weightUnit');
    }
    return parts.join(' ');
  }

  /// Get rest time display
  String get restDisplay {
    if (restSeconds < 60) return '${restSeconds}s';
    final mins = restSeconds ~/ 60;
    final secs = restSeconds % 60;
    return secs > 0 ? '${mins}m ${secs}s' : '${mins}m';
  }
}
