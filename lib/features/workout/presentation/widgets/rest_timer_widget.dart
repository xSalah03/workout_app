import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/workout_provider.dart';

/// Rest timer widget displayed during workouts
class RestTimerWidget extends ConsumerWidget {
  const RestTimerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(restTimerProvider);
    final progress = timerState.totalSeconds > 0
        ? timerState.remainingSeconds / timerState.totalSeconds
        : 0.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          // Timer circle
          SizedBox(
            width: 56,
            height: 56,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 4,
                  backgroundColor: AppColors.primary.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    timerState.remainingSeconds <= 10
                        ? AppColors.warning
                        : AppColors.primary,
                  ),
                ),
                Text(
                  timerState.remainingSeconds.asDigitalDuration,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Rest label
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rest Time',
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Next set ready soon',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          // Quick adjust buttons
          Row(
            children: [
              _TimerButton(
                label: '-30s',
                onPressed: () {
                  final newTime = timerState.remainingSeconds - 30;
                  if (newTime > 0) {
                    ref.read(restTimerProvider.notifier).addTime(-30);
                  } else {
                    ref.read(restTimerProvider.notifier).stopTimer();
                  }
                },
              ),
              const SizedBox(width: 8),
              _TimerButton(
                label: '+30s',
                onPressed: () {
                  ref.read(restTimerProvider.notifier).addTime(30);
                },
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: () {
                  ref.read(restTimerProvider.notifier).stopTimer();
                },
                tooltip: 'Skip rest',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimerButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _TimerButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        minimumSize: const Size(0, 36),
      ),
      child: Text(label),
    );
  }
}
