import 'dart:math';

import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/personal_record.dart';

/// Service for calculating and tracking personal records
class PRService {
  /// Check if a set is a new personal record
  static bool isPR({
    required double weight,
    required int reps,
    required List<PersonalRecord> existingRecords,
    required RecordType recordType,
  }) {
    final relevantRecords = existingRecords
        .where((r) => r.recordType == recordType && r.isCurrentRecord)
        .toList();

    if (relevantRecords.isEmpty) return true;

    switch (recordType) {
      case RecordType.maxWeight:
        // PR if weight is higher for the same or fewer reps
        for (final record in relevantRecords) {
          if (record.reps != null &&
              record.reps == reps &&
              weight > record.value) {
            return true;
          }
        }
        return false;

      case RecordType.maxReps:
        final maxReps = relevantRecords.fold<double>(
          0,
          (max, r) => r.value > max ? r.value : max,
        );
        return reps.toDouble() > maxReps;

      case RecordType.maxVolume:
        final volume = weight * reps;
        final maxVolume = relevantRecords.fold<double>(
          0,
          (max, r) => r.value > max ? r.value : max,
        );
        return volume > maxVolume;

      case RecordType.oneRepMax:
        final estimated1RM = calculate1RM(weight, reps);
        final max1RM = relevantRecords.fold<double>(
          0,
          (max, r) => r.value > max ? r.value : max,
        );
        return estimated1RM > max1RM;

      case RecordType.maxDuration:
        // Not applicable for weight exercises
        return false;
    }
  }

  /// Calculate estimated 1RM using Epley formula
  /// 1RM = weight × (1 + reps/30)
  static double calculate1RM(double weight, int reps) {
    if (reps <= 0) return 0;
    if (reps == 1) return weight;
    return weight * (1 + reps / 30);
  }

  /// Calculate estimated weight for target reps based on 1RM
  /// weight = 1RM / (1 + targetReps/30)
  static double calculateWeightForReps(double oneRepMax, int targetReps) {
    if (targetReps <= 0) return 0;
    if (targetReps == 1) return oneRepMax;
    return oneRepMax / (1 + targetReps / 30);
  }

  /// Get all PR types that a set qualifies for
  static List<RecordType> getAllPRTypes({
    required double weight,
    required int reps,
    required List<PersonalRecord> existingRecords,
  }) {
    final prTypes = <RecordType>[];

    for (final type in [
      RecordType.maxWeight,
      RecordType.maxReps,
      RecordType.maxVolume,
      RecordType.oneRepMax,
    ]) {
      if (isPR(
        weight: weight,
        reps: reps,
        existingRecords: existingRecords,
        recordType: type,
      )) {
        prTypes.add(type);
      }
    }

    return prTypes;
  }
}

/// Service for progressive overload suggestions
class ProgressiveOverloadService {
  /// Suggest next weight/reps based on recent performance
  /// Uses simple linear progression with periodization awareness
  static ({double suggestedWeight, int suggestedReps})? getSuggestion({
    required List<({double weight, int reps, DateTime date})> recentSets,
    required int targetReps,
    double incrementKg = 2.5,
  }) {
    if (recentSets.isEmpty) return null;

    // Sort by date descending
    final sorted = List.of(recentSets)
      ..sort((a, b) => b.date.compareTo(a.date));
    final lastSet = sorted.first;

    // Check if we achieved target reps at current weight
    if (lastSet.reps >= targetReps) {
      // Increase weight, reset to lower end of rep range
      return (
        suggestedWeight: lastSet.weight + incrementKg,
        suggestedReps: max(
          targetReps - 2,
          6,
        ), // e.g., if target is 10, suggest 8
      );
    }

    // Didn't hit target reps, keep same weight but aim for more reps
    return (
      suggestedWeight: lastSet.weight,
      suggestedReps: min(lastSet.reps + 1, targetReps),
    );
  }

  /// Detect if user should deload based on recent performance
  /// Signs of needing deload:
  /// - Declining performance over 2+ weeks
  /// - Missed sessions
  /// - RPE consistently high (8+) without progress
  static bool shouldDeload({
    required List<({double volume, DateTime date, double? avgRpe})> weeklyStats,
    int weeksToAnalyze = 4,
  }) {
    if (weeklyStats.length < weeksToAnalyze) return false;

    // Sort by date descending
    final sorted = List.of(weeklyStats)
      ..sort((a, b) => b.date.compareTo(a.date));
    final recent = sorted.take(weeksToAnalyze).toList();

    // Check for declining volume trend
    int declineCount = 0;
    for (int i = 0; i < recent.length - 1; i++) {
      if (recent[i].volume < recent[i + 1].volume * 0.95) {
        // 5% or more decline
        declineCount++;
      }
    }

    // Deload if volume declined 2+ consecutive weeks
    if (declineCount >= 2) return true;

    // Check for high RPE without progress
    final avgRpe = recent
        .where((w) => w.avgRpe != null)
        .map((w) => w.avgRpe!)
        .fold<double>(0, (sum, rpe) => sum + rpe);

    if (recent.isNotEmpty && avgRpe / recent.length > 8.5) {
      // Very high average RPE
      return true;
    }

    return false;
  }

  /// Calculate recommended deload parameters
  static ({double volumeMultiplier, double intensityMultiplier})
  getDeloadParameters({DeloadType type = DeloadType.standard}) {
    switch (type) {
      case DeloadType.light:
        return (volumeMultiplier: 0.7, intensityMultiplier: 0.9);
      case DeloadType.standard:
        return (volumeMultiplier: 0.6, intensityMultiplier: 0.8);
      case DeloadType.heavy:
        return (volumeMultiplier: 0.5, intensityMultiplier: 0.7);
    }
  }
}

enum DeloadType { light, standard, heavy }

/// Service for rest day reminders
class RestDayService {
  /// Check if user should take a rest day
  static bool shouldRest({
    required List<DateTime> recentWorkoutDates,
    int maxConsecutiveDays = 4,
    int minRestDaysPerWeek = 2,
  }) {
    if (recentWorkoutDates.isEmpty) return false;

    // Sort by date descending
    final sorted = List.of(recentWorkoutDates)..sort((a, b) => b.compareTo(a));
    final now = DateTime.now();

    // Check consecutive workout days
    int consecutiveDays = 0;
    DateTime? lastDate;

    for (final date in sorted) {
      if (lastDate == null) {
        // Check if last workout was today or yesterday
        final diff = now.difference(date).inDays;
        if (diff <= 1) {
          consecutiveDays = 1;
          lastDate = date;
        } else {
          break;
        }
      } else {
        final diff = lastDate.difference(date).inDays;
        if (diff == 1) {
          consecutiveDays++;
          lastDate = date;
        } else {
          break;
        }
      }
    }

    if (consecutiveDays >= maxConsecutiveDays) return true;

    // Check rest days in the past week
    final weekAgo = now.subtract(const Duration(days: 7));
    final workoutsThisWeek = sorted.where((d) => d.isAfter(weekAgo)).length;

    final restDaysThisWeek = 7 - workoutsThisWeek;
    if (restDaysThisWeek < minRestDaysPerWeek && consecutiveDays >= 2) {
      return true;
    }

    return false;
  }
}
