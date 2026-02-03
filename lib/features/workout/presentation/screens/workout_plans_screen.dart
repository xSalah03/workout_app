import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/workout_provider.dart';

/// Screen displaying workout plans
class WorkoutPlansScreen extends ConsumerWidget {
  const WorkoutPlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plansState = ref.watch(workoutPlansProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Plans'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _createPlan(context),
          ),
        ],
      ),
      body: plansState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (plans) {
          if (plans.isEmpty) {
            return _EmptyPlansView(onCreatePlan: () => _createPlan(context));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: plans.length,
            itemBuilder: (context, index) {
              final plan = plans[index];
              return _WorkoutPlanCard(
                plan: plan,
                onTap: () => _viewPlan(context, plan),
                onStart: () => _startPlan(context, ref, plan),
              );
            },
          );
        },
      ),
    );
  }

  void _createPlan(BuildContext context) {
    // Navigate to create plan screen
  }

  void _viewPlan(BuildContext context, dynamic plan) {
    // Navigate to plan detail screen
  }

  void _startPlan(BuildContext context, WidgetRef ref, dynamic plan) {
    ref.read(activeSessionProvider.notifier).startFromPlan(plan.id);
  }
}

class _EmptyPlansView extends StatelessWidget {
  final VoidCallback onCreatePlan;

  const _EmptyPlansView({required this.onCreatePlan});

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
                Icons.calendar_today_outlined,
                size: 40,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'No workout plans yet',
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Create a workout plan to quickly start your favorite routines',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onCreatePlan,
              icon: const Icon(Icons.add),
              label: const Text('Create Plan'),
            ),
          ],
        ),
      ),
    );
  }
}

class _WorkoutPlanCard extends StatelessWidget {
  final dynamic plan;
  final VoidCallback onTap;
  final VoidCallback onStart;

  const _WorkoutPlanCard({
    required this.plan,
    required this.onTap,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plan.name,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${plan.exerciseCount} exercises • ${plan.durationDisplay}',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onStart,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      minimumSize: const Size(0, 40),
                    ),
                    child: const Text('Start'),
                  ),
                ],
              ),
              if (plan.description != null) ...[
                const SizedBox(height: 8),
                Text(
                  plan.description,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
