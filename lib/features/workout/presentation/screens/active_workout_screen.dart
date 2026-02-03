import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/workout_provider.dart';
import '../widgets/set_input_row.dart';
import '../widgets/rest_timer_widget.dart';

/// Active workout session screen
class ActiveWorkoutScreen extends ConsumerStatefulWidget {
  const ActiveWorkoutScreen({super.key});

  @override
  ConsumerState<ActiveWorkoutScreen> createState() =>
      _ActiveWorkoutScreenState();
}

class _ActiveWorkoutScreenState extends ConsumerState<ActiveWorkoutScreen> {
  final _workoutNameController = TextEditingController(text: 'New Workout');

  @override
  void dispose() {
    _workoutNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeSession = ref.watch(activeSessionProvider);
    final duration = ref.watch(workoutDurationProvider);
    final restTimer = ref.watch(restTimerProvider);

    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmation(context) ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              if (await _showExitConfirmation(context) ?? false) {
                if (mounted) Navigator.of(context).pop();
              }
            },
          ),
          title: GestureDetector(
            onTap: () => _editWorkoutName(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_workoutNameController.text),
                const SizedBox(width: 4),
                Icon(
                  Icons.edit,
                  size: 16,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
          actions: [
            // Duration
            duration.when(
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              data: (d) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Row(
                    children: [
                      const Icon(Icons.timer_outlined, size: 18),
                      const SizedBox(width: 4),
                      Text(d.formatted),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: activeSession.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text('Error: $e')),
          data: (session) {
            if (session == null) {
              return const _EmptyWorkoutView();
            }

            return Column(
              children: [
                // Rest Timer (if active)
                if (restTimer.isRunning) const RestTimerWidget(),

                // Exercise List
                Expanded(
                  child: session.exercises.isEmpty
                      ? const _EmptyWorkoutView()
                      : ReorderableListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: session.exercises.length,
                          onReorder: (oldIndex, newIndex) {
                            // TODO: Implement reorder
                          },
                          itemBuilder: (context, index) {
                            final exercise = session.exercises[index];
                            return _ExerciseCard(
                              key: ValueKey(exercise.id),
                              exercise: exercise,
                              onSetCompleted: (setId, reps, weight, rpe) {
                                ref
                                    .read(activeSessionProvider.notifier)
                                    .completeSet(
                                      setId: setId,
                                      reps: reps,
                                      weight: weight,
                                      rpe: rpe,
                                    );
                                // Start rest timer
                                ref
                                    .read(restTimerProvider.notifier)
                                    .startTimer(90);
                              },
                              onAddSet: () {
                                ref
                                    .read(activeSessionProvider.notifier)
                                    .addSet(exercise.id);
                              },
                              onRemove: () {
                                ref
                                    .read(activeSessionProvider.notifier)
                                    .removeExercise(exercise.id);
                              },
                            );
                          },
                        ),
                ),

                // Bottom Actions
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _showAddExerciseSheet(context),
                            icon: const Icon(Icons.add),
                            label: const Text('Add Exercise'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _finishWorkout(context),
                            icon: const Icon(Icons.check),
                            label: const Text('Finish'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<bool?> _showExitConfirmation(BuildContext context) {
    return context.showConfirmDialog(
      title: 'Discard Workout?',
      content:
          'Are you sure you want to discard this workout? All progress will be lost.',
      confirmText: 'Discard',
      destructive: true,
    );
  }

  void _editWorkoutName(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Workout Name'),
        content: TextField(
          controller: _workoutNameController,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Enter workout name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {});
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showAddExerciseSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return _AddExerciseSheet(scrollController: scrollController);
        },
      ),
    );
  }

  void _finishWorkout(BuildContext context) async {
    final confirm = await context.showConfirmDialog(
      title: 'Finish Workout?',
      content: 'Complete this workout and save your progress.',
      confirmText: 'Finish',
    );

    if (confirm && mounted) {
      await ref.read(activeSessionProvider.notifier).completeWorkout();
      if (mounted) Navigator.of(context).pop();
    }
  }
}

class _EmptyWorkoutView extends StatelessWidget {
  const _EmptyWorkoutView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.fitness_center_outlined,
                size: 40,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text('No exercises yet', style: context.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Add exercises to start tracking your workout',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  final dynamic exercise;
  final Function(String setId, int reps, double weight, double? rpe)
  onSetCompleted;
  final VoidCallback onAddSet;
  final VoidCallback onRemove;

  const _ExerciseCard({
    super.key,
    required this.exercise,
    required this.onSetCompleted,
    required this.onAddSet,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exercise Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise.exerciseName ?? 'Exercise',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (exercise.muscleGroup != null)
                        Text(
                          exercise.muscleGroup.toString(),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () => _showExerciseMenu(context),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Sets Header
            Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    'Set',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Previous',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    'Weight',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    'Reps',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 48), // Checkbox space
              ],
            ),
            const Divider(),

            // Sets List
            ...exercise.sets.asMap().entries.map((entry) {
              final index = entry.key;
              final set = entry.value;
              return SetInputRow(
                setNumber: index + 1,
                set: set,
                onCompleted: (reps, weight, rpe) {
                  onSetCompleted(set.id, reps, weight, rpe);
                },
              );
            }),

            // Add Set Button
            TextButton.icon(
              onPressed: onAddSet,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add Set'),
            ),
          ],
        ),
      ),
    );
  }

  void _showExerciseMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('View History'),
              onTap: () {
                Navigator.pop(context);
                // Show exercise history
              },
            ),
            ListTile(
              leading: const Icon(Icons.notes),
              title: const Text('Add Notes'),
              onTap: () {
                Navigator.pop(context);
                // Add notes
              },
            ),
            ListTile(
              leading: const Icon(Icons.swap_vert),
              title: const Text('Replace Exercise'),
              onTap: () {
                Navigator.pop(context);
                // Replace exercise
              },
            ),
            ListTile(
              leading: Icon(Icons.delete_outline, color: AppColors.error),
              title: Text('Remove', style: TextStyle(color: AppColors.error)),
              onTap: () {
                Navigator.pop(context);
                onRemove();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AddExerciseSheet extends ConsumerWidget {
  final ScrollController scrollController;

  const _AddExerciseSheet({required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.colorScheme.onSurfaceVariant.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Search
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search exercises',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              // TODO: Filter exercises
            },
          ),
          const SizedBox(height: 16),

          // Exercise List
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 20, // TODO: Use actual exercises
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.fitness_center,
                      color: AppColors.primary,
                    ),
                  ),
                  title: Text('Exercise ${index + 1}'),
                  subtitle: const Text('Chest • Barbell'),
                  onTap: () {
                    ref
                        .read(activeSessionProvider.notifier)
                        .addExercise('exercise_$index');
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
