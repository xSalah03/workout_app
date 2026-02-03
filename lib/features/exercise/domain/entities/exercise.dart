import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../database/database.dart';

part 'exercise.freezed.dart';

/// Exercise entity representing the domain model
@freezed
class Exercise with _$Exercise {
  const Exercise._();

  const factory Exercise({
    required String id,
    required String userId,
    required String name,
    String? description,
    required MuscleGroup muscleGroup,
    @Default([]) List<MuscleGroup> secondaryMuscles,
    required EquipmentType equipment,
    String? instructions,
    String? imageUrl,
    @Default(true) bool isCustom,
    @Default(true) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDirty,
    @Default(0) int syncVersion,
    DateTime? lastSyncedAt,
    String? remoteId,
  }) = _Exercise;

  /// Get muscle group display name
  String get muscleGroupDisplay => muscleGroup.displayName;

  /// Get equipment display name
  String get equipmentDisplay => equipment.displayName;

  /// Get all targeted muscles (primary + secondary)
  List<MuscleGroup> get allMuscles => [muscleGroup, ...secondaryMuscles];
}

/// Extension to add display names to MuscleGroup enum
extension MuscleGroupExtension on MuscleGroup {
  String get displayName {
    switch (this) {
      case MuscleGroup.chest:
        return 'Chest';
      case MuscleGroup.back:
        return 'Back';
      case MuscleGroup.shoulders:
        return 'Shoulders';
      case MuscleGroup.biceps:
        return 'Biceps';
      case MuscleGroup.triceps:
        return 'Triceps';
      case MuscleGroup.forearms:
        return 'Forearms';
      case MuscleGroup.core:
        return 'Core';
      case MuscleGroup.quadriceps:
        return 'Quadriceps';
      case MuscleGroup.hamstrings:
        return 'Hamstrings';
      case MuscleGroup.glutes:
        return 'Glutes';
      case MuscleGroup.calves:
        return 'Calves';
      case MuscleGroup.fullBody:
        return 'Full Body';
      case MuscleGroup.cardio:
        return 'Cardio';
    }
  }

  String get icon {
    switch (this) {
      case MuscleGroup.chest:
        return '🫁';
      case MuscleGroup.back:
        return '🔙';
      case MuscleGroup.shoulders:
        return '💪';
      case MuscleGroup.biceps:
        return '💪';
      case MuscleGroup.triceps:
        return '💪';
      case MuscleGroup.forearms:
        return '🤜';
      case MuscleGroup.core:
        return '🎯';
      case MuscleGroup.quadriceps:
        return '🦵';
      case MuscleGroup.hamstrings:
        return '🦵';
      case MuscleGroup.glutes:
        return '🍑';
      case MuscleGroup.calves:
        return '🦶';
      case MuscleGroup.fullBody:
        return '🏋️';
      case MuscleGroup.cardio:
        return '❤️';
    }
  }
}

/// Extension to add display names to EquipmentType enum
extension EquipmentTypeExtension on EquipmentType {
  String get displayName {
    switch (this) {
      case EquipmentType.barbell:
        return 'Barbell';
      case EquipmentType.dumbbell:
        return 'Dumbbell';
      case EquipmentType.kettlebell:
        return 'Kettlebell';
      case EquipmentType.machine:
        return 'Machine';
      case EquipmentType.cable:
        return 'Cable';
      case EquipmentType.bodyweight:
        return 'Bodyweight';
      case EquipmentType.resistanceBand:
        return 'Resistance Band';
      case EquipmentType.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case EquipmentType.barbell:
        return '🏋️';
      case EquipmentType.dumbbell:
        return '🏋️‍♂️';
      case EquipmentType.kettlebell:
        return '🔔';
      case EquipmentType.machine:
        return '⚙️';
      case EquipmentType.cable:
        return '🔗';
      case EquipmentType.bodyweight:
        return '🧘';
      case EquipmentType.resistanceBand:
        return '➰';
      case EquipmentType.other:
        return '📦';
    }
  }
}
