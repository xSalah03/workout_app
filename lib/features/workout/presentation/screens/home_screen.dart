import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../progress/presentation/screens/progress_screen.dart';
import '../../../exercise/presentation/screens/exercises_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import '../providers/workout_provider.dart';
import 'workout_plans_screen.dart';
import 'active_workout_screen.dart';

/// Main home screen with bottom navigation
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  final _screens = const [
    _DashboardTab(),
    WorkoutPlansScreen(),
    ExercisesScreen(),
    ProgressScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final hasActiveWorkout = ref.watch(hasActiveWorkoutProvider);

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'Plans',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center_outlined),
            selectedIcon: Icon(Icons.fitness_center),
            label: 'Exercises',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_outlined),
            selectedIcon: Icon(Icons.insights),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: hasActiveWorkout
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ActiveWorkoutScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('Continue Workout'),
            )
          : FloatingActionButton.extended(
              onPressed: () => _showStartWorkoutDialog(context),
              icon: const Icon(Icons.add),
              label: const Text('Start Workout'),
            ),
    );
  }

  void _showStartWorkoutDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const _StartWorkoutSheet(),
    );
  }
}

/// Dashboard tab with quick stats and recent workouts
class _DashboardTab extends ConsumerWidget {
  const _DashboardTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider).valueOrNull;
    final workoutHistory = ref.watch(workoutHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back,',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              user?.displayNameOrEmail ?? 'Athlete',
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
        actions: [
          if (user?.isAnonymous ?? false)
            TextButton.icon(
              onPressed: () {
                // Navigate to upgrade account
              },
              icon: const Icon(Icons.cloud_upload_outlined, size: 18),
              label: const Text('Sync'),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(workoutHistoryProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Quick Stats Card
            const _QuickStatsCard(),
            const SizedBox(height: 24),

            // This Week Progress
            Text('This Week', style: context.textTheme.titleLarge),
            const SizedBox(height: 12),
            const _WeekProgressCard(),
            const SizedBox(height: 24),

            // Recent Workouts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Workouts', style: context.textTheme.titleLarge),
                TextButton(
                  onPressed: () {
                    // Navigate to full history
                  },
                  child: const Text('See All'),
                ),
              ],
            ),
            const SizedBox(height: 12),

            workoutHistory.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
              data: (sessions) {
                if (sessions.isEmpty) {
                  return const _EmptyWorkoutsCard();
                }
                return Column(
                  children: sessions.take(5).map((session) {
                    return _WorkoutHistoryCard(session: session);
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickStatsCard extends StatelessWidget {
  const _QuickStatsCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: _StatItem(
                label: 'Workouts',
                value: '12',
                icon: Icons.fitness_center,
                color: AppColors.primary,
              ),
            ),
            Expanded(
              child: _StatItem(
                label: 'Volume',
                value: '24.5k',
                icon: Icons.monitor_weight,
                color: AppColors.secondary,
              ),
            ),
            Expanded(
              child: _StatItem(
                label: 'PRs',
                value: '3',
                icon: Icons.emoji_events,
                color: AppColors.warning,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _WeekProgressCard extends StatelessWidget {
  const _WeekProgressCard();

  @override
  Widget build(BuildContext context) {
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final completed = [true, true, false, true, false, false, false];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(7, (index) {
            return Column(
              children: [
                Text(
                  days[index],
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: completed[index]
                        ? AppColors.secondary
                        : context.colorScheme.surfaceContainerHighest,
                    shape: BoxShape.circle,
                  ),
                  child: completed[index]
                      ? const Icon(Icons.check, color: Colors.white, size: 18)
                      : null,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _EmptyWorkoutsCard extends StatelessWidget {
  const _EmptyWorkoutsCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(
              Icons.fitness_center_outlined,
              size: 48,
              color: context.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text('No workouts yet', style: context.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              'Start your first workout to see your progress here',
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

class _WorkoutHistoryCard extends StatelessWidget {
  final dynamic session;

  const _WorkoutHistoryCard({required this.session});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement actual workout card
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.fitness_center, color: AppColors.primary),
        ),
        title: const Text('Workout'),
        subtitle: const Text('Today'),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [Text('45 min'), Text('8 exercises')],
        ),
      ),
    );
  }
}

class _StartWorkoutSheet extends ConsumerWidget {
  const _StartWorkoutSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutPlans = ref.watch(workoutPlansProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onSurfaceVariant.withOpacity(
                      0.4,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Text('Start Workout', style: context.textTheme.headlineSmall),
              const SizedBox(height: 24),

              // Quick Start
              ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.bolt, color: AppColors.primary),
                ),
                title: const Text('Quick Start'),
                subtitle: const Text('Start an empty workout'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ActiveWorkoutScreen(),
                    ),
                  );
                },
              ),
              const Divider(),

              // From Plan
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('From Plan', style: context.textTheme.titleMedium),
              ),

              Expanded(
                child: workoutPlans.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Center(child: Text('Error: $e')),
                  data: (plans) {
                    if (plans.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 48,
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No workout plans yet',
                              style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // Navigate to create plan
                              },
                              child: const Text('Create Plan'),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      controller: scrollController,
                      itemCount: plans.length,
                      itemBuilder: (context, index) {
                        final plan = plans[index];
                        return ListTile(
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.calendar_today,
                              color: AppColors.secondary,
                            ),
                          ),
                          title: Text(plan.name),
                          subtitle: Text('${plan.exerciseCount} exercises'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.pop(context);
                            // Start workout from plan
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
