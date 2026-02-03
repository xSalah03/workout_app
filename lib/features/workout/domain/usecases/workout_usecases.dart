import '../../../../core/utils/typedefs.dart';
import '../entities/workout_plan.dart';
import '../entities/workout_session.dart';
import '../repositories/workout_repository.dart';

// ============================================================
// WORKOUT PLAN USE CASES
// ============================================================

/// Get all workout plans
class GetWorkoutPlans {
  final WorkoutRepository _repository;

  GetWorkoutPlans(this._repository);

  ResultFuture<List<WorkoutPlan>> call({bool includeInactive = false}) =>
      _repository.getWorkoutPlans(includeInactive: includeInactive);
}

/// Get workout plan by ID
class GetWorkoutPlanById {
  final WorkoutRepository _repository;

  GetWorkoutPlanById(this._repository);

  ResultFuture<WorkoutPlan> call(String id) =>
      _repository.getWorkoutPlanById(id);
}

/// Create workout plan
class CreateWorkoutPlan {
  final WorkoutRepository _repository;

  CreateWorkoutPlan(this._repository);

  ResultFuture<WorkoutPlan> call(WorkoutPlan plan) =>
      _repository.createWorkoutPlan(plan);
}

/// Update workout plan
class UpdateWorkoutPlan {
  final WorkoutRepository _repository;

  UpdateWorkoutPlan(this._repository);

  ResultFuture<WorkoutPlan> call(WorkoutPlan plan) =>
      _repository.updateWorkoutPlan(plan);
}

/// Delete workout plan
class DeleteWorkoutPlan {
  final WorkoutRepository _repository;

  DeleteWorkoutPlan(this._repository);

  ResultVoid call(String id) => _repository.deleteWorkoutPlan(id);
}

// ============================================================
// WORKOUT SESSION USE CASES
// ============================================================

/// Get workout history
class GetWorkoutHistory {
  final WorkoutRepository _repository;

  GetWorkoutHistory(this._repository);

  ResultFuture<List<WorkoutSession>> call({
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    int? offset,
  }) => _repository.getWorkoutSessions(
    startDate: startDate,
    endDate: endDate,
    limit: limit,
    offset: offset,
  );
}

/// Get active workout session
class GetActiveWorkoutSession {
  final WorkoutRepository _repository;

  GetActiveWorkoutSession(this._repository);

  ResultFuture<WorkoutSession?> call() => _repository.getActiveSession();
}

/// Start quick workout (without plan)
class StartQuickWorkout {
  final WorkoutRepository _repository;

  StartQuickWorkout(this._repository);

  ResultFuture<WorkoutSession> call(String name) =>
      _repository.startWorkoutSession(name: name);
}

/// Start workout from plan
class StartWorkoutFromPlan {
  final WorkoutRepository _repository;

  StartWorkoutFromPlan(this._repository);

  ResultFuture<WorkoutSession> call(String planId) =>
      _repository.startWorkoutFromPlan(planId);
}

/// Complete workout
class CompleteWorkout {
  final WorkoutRepository _repository;

  CompleteWorkout(this._repository);

  ResultFuture<WorkoutSession> call(String sessionId) =>
      _repository.completeWorkoutSession(sessionId);
}

/// Cancel workout
class CancelWorkout {
  final WorkoutRepository _repository;

  CancelWorkout(this._repository);

  ResultVoid call(String sessionId) =>
      _repository.cancelWorkoutSession(sessionId);
}

/// Add exercise to active session
class AddExerciseToSession {
  final WorkoutRepository _repository;

  AddExerciseToSession(this._repository);

  ResultFuture<SessionExercise> call({
    required String sessionId,
    required String exerciseId,
    int initialSets = 3,
  }) => _repository.addExerciseToSession(
    sessionId: sessionId,
    exerciseId: exerciseId,
    initialSets: initialSets,
  );
}

// ============================================================
// SET USE CASES
// ============================================================

/// Complete a set (log performance)
class CompleteSet {
  final WorkoutRepository _repository;

  CompleteSet(this._repository);

  ResultFuture<ExerciseSet> call(
    String setId, {
    required int reps,
    required double weight,
    double? rpe,
  }) => _repository.completeSet(setId, reps: reps, weight: weight, rpe: rpe);
}

/// Add new set
class AddSet {
  final WorkoutRepository _repository;

  AddSet(this._repository);

  ResultFuture<ExerciseSet> call({
    required String sessionExerciseId,
    int? reps,
    double? weight,
  }) => _repository.addSet(
    sessionExerciseId: sessionExerciseId,
    reps: reps,
    weight: weight,
  );
}

/// Delete set
class DeleteSet {
  final WorkoutRepository _repository;

  DeleteSet(this._repository);

  ResultVoid call(String setId) => _repository.deleteSet(setId);
}

/// Get last performed set for suggestions
class GetLastPerformedSet {
  final WorkoutRepository _repository;

  GetLastPerformedSet(this._repository);

  ResultFuture<ExerciseSet?> call(String exerciseId) =>
      _repository.getLastPerformedSet(exerciseId);
}
