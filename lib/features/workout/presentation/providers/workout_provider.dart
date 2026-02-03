import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/providers.dart';
import '../../domain/entities/workout_plan.dart';
import '../../domain/entities/workout_session.dart';

// ============================================================
// WORKOUT PLANS PROVIDERS
// ============================================================

/// Active workout plans list
final workoutPlansProvider =
    StateNotifierProvider<WorkoutPlansNotifier, AsyncValue<List<WorkoutPlan>>>((
      ref,
    ) {
      final database = ref.watch(databaseProvider);
      return WorkoutPlansNotifier(database);
    });

class WorkoutPlansNotifier
    extends StateNotifier<AsyncValue<List<WorkoutPlan>>> {
  final dynamic _database;

  WorkoutPlansNotifier(this._database) : super(const AsyncValue.loading()) {
    loadPlans();
  }

  Future<void> loadPlans() async {
    state = const AsyncValue.loading();
    try {
      // TODO: Implement actual loading from database
      state = const AsyncValue.data([]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createPlan(WorkoutPlan plan) async {
    // TODO: Implement create
  }

  Future<void> updatePlan(WorkoutPlan plan) async {
    // TODO: Implement update
  }

  Future<void> deletePlan(String id) async {
    // TODO: Implement delete
  }
}

// ============================================================
// ACTIVE WORKOUT SESSION PROVIDERS
// ============================================================

/// Active workout session (in-progress)
final activeSessionProvider =
    StateNotifierProvider<ActiveSessionNotifier, AsyncValue<WorkoutSession?>>((
      ref,
    ) {
      final database = ref.watch(databaseProvider);
      return ActiveSessionNotifier(database);
    });

class ActiveSessionNotifier extends StateNotifier<AsyncValue<WorkoutSession?>> {
  final dynamic _database;

  ActiveSessionNotifier(this._database) : super(const AsyncValue.loading()) {
    _checkActiveSession();
  }

  Future<void> _checkActiveSession() async {
    state = const AsyncValue.loading();
    try {
      // TODO: Check for existing active session
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Start a new workout session
  Future<void> startWorkout({required String name, String? planId}) async {
    // TODO: Implement start workout
  }

  /// Start workout from a plan
  Future<void> startFromPlan(String planId) async {
    // TODO: Implement start from plan
  }

  /// Add exercise to current session
  Future<void> addExercise(String exerciseId) async {
    // TODO: Implement add exercise
  }

  /// Remove exercise from current session
  Future<void> removeExercise(String sessionExerciseId) async {
    // TODO: Implement remove exercise
  }

  /// Complete a set
  Future<void> completeSet({
    required String setId,
    required int reps,
    required double weight,
    double? rpe,
  }) async {
    // TODO: Implement complete set
  }

  /// Add a new set to an exercise
  Future<void> addSet(String sessionExerciseId) async {
    // TODO: Implement add set
  }

  /// Delete a set
  Future<void> deleteSet(String setId) async {
    // TODO: Implement delete set
  }

  /// Complete the workout
  Future<void> completeWorkout() async {
    // TODO: Implement complete workout
  }

  /// Cancel the workout
  Future<void> cancelWorkout() async {
    // TODO: Implement cancel workout
  }
}

// ============================================================
// WORKOUT HISTORY PROVIDERS
// ============================================================

/// Workout history list
final workoutHistoryProvider =
    StateNotifierProvider<
      WorkoutHistoryNotifier,
      AsyncValue<List<WorkoutSession>>
    >((ref) {
      final database = ref.watch(databaseProvider);
      return WorkoutHistoryNotifier(database);
    });

class WorkoutHistoryNotifier
    extends StateNotifier<AsyncValue<List<WorkoutSession>>> {
  final dynamic _database;
  int _currentPage = 0;
  static const int _pageSize = 20;
  bool _hasMore = true;

  WorkoutHistoryNotifier(this._database) : super(const AsyncValue.loading()) {
    loadHistory();
  }

  Future<void> loadHistory({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 0;
      _hasMore = true;
    }

    if (!_hasMore && !refresh) return;

    try {
      // TODO: Load history from database with pagination
      state = const AsyncValue.data([]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loadMore() async {
    if (!_hasMore) return;
    _currentPage++;
    await loadHistory();
  }

  bool get hasMore => _hasMore;
}

// ============================================================
// UTILITY PROVIDERS
// ============================================================

/// Check if there's an active workout
final hasActiveWorkoutProvider = Provider<bool>((ref) {
  final session = ref.watch(activeSessionProvider);
  return session.valueOrNull != null;
});

/// Workout duration timer
final workoutDurationProvider = StreamProvider<Duration>((ref) {
  final session = ref.watch(activeSessionProvider);
  final startedAt = session.valueOrNull?.startedAt;

  if (startedAt == null) {
    return const Stream.empty();
  }

  return Stream.periodic(const Duration(seconds: 1), (_) {
    return DateTime.now().difference(startedAt);
  });
});

/// Rest timer state
class RestTimerState {
  final int totalSeconds;
  final int remainingSeconds;
  final bool isRunning;

  const RestTimerState({
    this.totalSeconds = 0,
    this.remainingSeconds = 0,
    this.isRunning = false,
  });

  RestTimerState copyWith({
    int? totalSeconds,
    int? remainingSeconds,
    bool? isRunning,
  }) {
    return RestTimerState(
      totalSeconds: totalSeconds ?? this.totalSeconds,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}

final restTimerProvider =
    StateNotifierProvider<RestTimerNotifier, RestTimerState>((ref) {
      return RestTimerNotifier();
    });

class RestTimerNotifier extends StateNotifier<RestTimerState> {
  RestTimerNotifier() : super(const RestTimerState());

  void startTimer(int seconds) {
    state = RestTimerState(
      totalSeconds: seconds,
      remainingSeconds: seconds,
      isRunning: true,
    );
    _tick();
  }

  void _tick() async {
    while (state.isRunning && state.remainingSeconds > 0) {
      await Future.delayed(const Duration(seconds: 1));
      if (state.isRunning) {
        state = state.copyWith(remainingSeconds: state.remainingSeconds - 1);
      }
    }
    if (state.remainingSeconds <= 0) {
      state = state.copyWith(isRunning: false);
    }
  }

  void stopTimer() {
    state = state.copyWith(isRunning: false);
  }

  void resetTimer() {
    state = const RestTimerState();
  }

  void addTime(int seconds) {
    state = state.copyWith(
      remainingSeconds: state.remainingSeconds + seconds,
      totalSeconds: state.totalSeconds + seconds,
    );
  }
}
