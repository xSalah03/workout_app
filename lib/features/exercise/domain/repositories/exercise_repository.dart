import '../../../../core/utils/typedefs.dart';
import '../../../../database/database.dart';
import '../entities/exercise.dart';

/// Exercise repository interface
abstract class ExerciseRepository {
  /// Get all exercises for user
  ResultFuture<List<Exercise>> getExercises({
    MuscleGroup? muscleGroup,
    EquipmentType? equipment,
    bool includeInactive = false,
  });

  /// Get exercise by ID
  ResultFuture<Exercise> getExerciseById(String id);

  /// Search exercises by name
  ResultFuture<List<Exercise>> searchExercises(String query);

  /// Create a new exercise
  ResultFuture<Exercise> createExercise(Exercise exercise);

  /// Update an exercise
  ResultFuture<Exercise> updateExercise(Exercise exercise);

  /// Delete an exercise (soft delete - marks as inactive)
  ResultVoid deleteExercise(String id);

  /// Get exercises by muscle group
  ResultFuture<List<Exercise>> getExercisesByMuscleGroup(
    MuscleGroup muscleGroup,
  );

  /// Get default/system exercises
  ResultFuture<List<Exercise>> getDefaultExercises();

  /// Seed default exercises for new user
  ResultVoid seedDefaultExercises(String userId);

  /// Stream of exercises (for reactive updates)
  Stream<List<Exercise>> watchExercises();
}
