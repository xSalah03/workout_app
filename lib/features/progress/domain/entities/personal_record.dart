import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/constants/app_constants.dart';

part 'personal_record.freezed.dart';

/// PersonalRecord entity - tracks personal bests
@freezed
class PersonalRecord with _$PersonalRecord {
  const PersonalRecord._();

  const factory PersonalRecord({
    required String id,
    required String userId,
    required String exerciseId,
    required RecordType recordType,
    required double value,
    int? reps, // For weight PRs, the rep count
    String? setId,
    required DateTime achievedAt,
    @Default(true) bool isCurrentRecord,
    required DateTime createdAt,
    @Default(false) bool isDirty,
    @Default(0) int syncVersion,
    String? remoteId,
    // Joined data
    String? exerciseName,
  }) = _PersonalRecord;

  /// Get value display based on record type
  String getValueDisplay({String weightUnit = 'kg'}) {
    switch (recordType) {
      case RecordType.maxWeight:
        return '${value.toStringAsFixed(1)} $weightUnit${reps != null ? ' x $reps' : ''}';
      case RecordType.maxReps:
        return '${value.toInt()} reps';
      case RecordType.maxVolume:
        if (value >= 1000) {
          return '${(value / 1000).toStringAsFixed(1)}k $weightUnit';
        }
        return '${value.toStringAsFixed(0)} $weightUnit';
      case RecordType.maxDuration:
        final minutes = (value / 60).floor();
        final seconds = (value % 60).toInt();
        return minutes > 0 ? '${minutes}m ${seconds}s' : '${seconds}s';
      case RecordType.oneRepMax:
        return '${value.toStringAsFixed(1)} $weightUnit (est.)';
    }
  }

  /// Get record type icon
  String get typeIcon {
    switch (recordType) {
      case RecordType.maxWeight:
        return '🏋️';
      case RecordType.maxReps:
        return '🔄';
      case RecordType.maxVolume:
        return '📊';
      case RecordType.maxDuration:
        return '⏱️';
      case RecordType.oneRepMax:
        return '💪';
    }
  }
}

/// Stats summary for an exercise
@freezed
class ExerciseStats with _$ExerciseStats {
  const factory ExerciseStats({
    required String exerciseId,
    required String exerciseName,
    int? totalSets,
    int? totalReps,
    double? totalVolume,
    double? maxWeight,
    int? maxReps,
    double? estimated1RM,
    int? workoutCount,
    DateTime? lastPerformed,
    List<PersonalRecord>? personalRecords,
  }) = _ExerciseStats;
}

/// Weekly/Monthly stats summary
@freezed
class ProgressStats with _$ProgressStats {
  const ProgressStats._();

  const factory ProgressStats({
    required DateTime periodStart,
    required DateTime periodEnd,
    @Default(0) int workoutCount,
    @Default(0) int totalSets,
    @Default(0) int totalReps,
    @Default(0.0) double totalVolume,
    @Default(0) int totalDurationSeconds,
    @Default({}) Map<String, int> muscleGroupVolume, // MuscleGroup -> volume
    @Default([]) List<PersonalRecord> newPRs,
    double? volumeChange, // Percentage change from previous period
    int? workoutCountChange,
  }) = _ProgressStats;

  /// Get total duration display
  String get durationDisplay {
    final hours = totalDurationSeconds ~/ 3600;
    final minutes = (totalDurationSeconds % 3600) ~/ 60;
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }

  /// Get volume display
  String getVolumeDisplay({String weightUnit = 'kg'}) {
    if (totalVolume >= 1000) {
      return '${(totalVolume / 1000).toStringAsFixed(1)}k $weightUnit';
    }
    return '${totalVolume.toStringAsFixed(0)} $weightUnit';
  }

  /// Get volume change display
  String? get volumeChangeDisplay {
    if (volumeChange == null) return null;
    final sign = volumeChange! >= 0 ? '+' : '';
    return '$sign${volumeChange!.toStringAsFixed(1)}%';
  }

  /// Check if volume increased
  bool get isVolumeUp => volumeChange != null && volumeChange! > 0;
}
