import '../../../../core/utils/typedefs.dart';
import '../entities/workout_plan.dart';
import '../entities/workout_session.dart';

/// Workout repository interface
abstract class WorkoutRepository {
  // ============================================================
  // WORKOUT PLANS
  // ============================================================

  /// Get all workout plans
  ResultFuture<List<WorkoutPlan>> getWorkoutPlans({
    bool includeInactive = false,
  });

  /// Get workout plan by ID
  ResultFuture<WorkoutPlan> getWorkoutPlanById(String id);

  /// Create a new workout plan
  ResultFuture<WorkoutPlan> createWorkoutPlan(WorkoutPlan plan);

  /// Update a workout plan
  ResultFuture<WorkoutPlan> updateWorkoutPlan(WorkoutPlan plan);

  /// Delete a workout plan
  ResultVoid deleteWorkoutPlan(String id);

  /// Add exercise to workout plan
  ResultFuture<WorkoutPlanExercise> addExerciseToPlan({
    required String planId,
    required String exerciseId,
    int targetSets = 3,
    int? targetReps,
    double? targetWeight,
    int restSeconds = 90,
    String? notes,
  });

  /// Remove exercise from workout plan
  ResultVoid removeExerciseFromPlan(String planExerciseId);

  /// Update exercise in workout plan
  ResultFuture<WorkoutPlanExercise> updatePlanExercise(
    WorkoutPlanExercise exercise,
  );

  /// Reorder exercises in workout plan
  ResultVoid reorderPlanExercises(String planId, List<String> exerciseIds);

  /// Stream of workout plans
  Stream<List<WorkoutPlan>> watchWorkoutPlans();

  // ============================================================
  // WORKOUT SESSIONS
  // ============================================================

  /// Get workout sessions (history)
  ResultFuture<List<WorkoutSession>> getWorkoutSessions({
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    int? offset,
  });

  /// Get workout session by ID
  ResultFuture<WorkoutSession> getWorkoutSessionById(String id);

  /// Get active (in-progress) workout session
  ResultFuture<WorkoutSession?> getActiveSession();

  /// Start a new workout session
  ResultFuture<WorkoutSession> startWorkoutSession({
    required String name,
    String? workoutPlanId,
  });

  /// Start workout from plan (copies plan exercises to session)
  ResultFuture<WorkoutSession> startWorkoutFromPlan(String planId);

  /// Update workout session
  ResultFuture<WorkoutSession> updateWorkoutSession(WorkoutSession session);

  /// Complete workout session
  ResultFuture<WorkoutSession> completeWorkoutSession(String sessionId);

  /// Cancel workout session
  ResultVoid cancelWorkoutSession(String sessionId);

  /// Add exercise to session
  ResultFuture<SessionExercise> addExerciseToSession({
    required String sessionId,
    required String exerciseId,
    int initialSets = 3,
  });

  /// Remove exercise from session
  ResultVoid removeExerciseFromSession(String sessionExerciseId);

  /// Reorder exercises in session
  ResultVoid reorderSessionExercises(
    String sessionId,
    List<String> exerciseIds,
  );

  /// Stream of active session
  Stream<WorkoutSession?> watchActiveSession();

  // ============================================================
  // SETS
  // ============================================================

  /// Add set to session exercise
  ResultFuture<ExerciseSet> addSet({
    required String sessionExerciseId,
    int? reps,
    double? weight,
    int? durationSeconds,
  });

  /// Update a set
  ResultFuture<ExerciseSet> updateSet(ExerciseSet set);

  /// Complete a set
  ResultFuture<ExerciseSet> completeSet(
    String setId, {
    required int reps,
    required double weight,
    double? rpe,
  });

  /// Delete a set
  ResultVoid deleteSet(String setId);

  /// Copy previous set values
  ResultFuture<ExerciseSet> copyPreviousSet(String sessionExerciseId);

  /// Get last performed set for an exercise (for suggestions)
  ResultFuture<ExerciseSet?> getLastPerformedSet(String exerciseId);
}
