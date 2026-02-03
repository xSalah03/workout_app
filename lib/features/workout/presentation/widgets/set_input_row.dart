import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_theme.dart';

/// Input row for logging a set
class SetInputRow extends StatefulWidget {
  final int setNumber;
  final dynamic set;
  final Function(int reps, double weight, double? rpe) onCompleted;

  const SetInputRow({
    super.key,
    required this.setNumber,
    required this.set,
    required this.onCompleted,
  });

  @override
  State<SetInputRow> createState() => _SetInputRowState();
}

class _SetInputRowState extends State<SetInputRow> {
  late TextEditingController _weightController;
  late TextEditingController _repsController;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _weightController = TextEditingController(
      text: widget.set?.weight?.toString() ?? '',
    );
    _repsController = TextEditingController(
      text: widget.set?.reps?.toString() ?? '',
    );
    _isCompleted = widget.set?.isCompleted ?? false;
  }

  @override
  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }

  void _toggleComplete() {
    final weight = double.tryParse(_weightController.text);
    final reps = int.tryParse(_repsController.text);

    if (weight == null || reps == null) {
      context.showErrorSnackBar('Please enter weight and reps');
      return;
    }

    setState(() => _isCompleted = !_isCompleted);

    if (_isCompleted) {
      widget.onCompleted(reps, weight, null);
      // Haptic feedback
      HapticFeedback.lightImpact();
    }
  }

  @override
  Widget build(BuildContext context) {
    final setType = widget.set?.setType;
    final previousSet = widget.set?.previousSet;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          // Set number with type indicator
          SizedBox(
            width: 40,
            child: Row(
              children: [
                if (setType != null && setType != 'working')
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: _getSetTypeColor(setType).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      _getSetTypeBadge(setType),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: _getSetTypeColor(setType),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else
                  Text(
                    '${widget.setNumber}',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),

          // Previous set info
          Expanded(
            child: Center(
              child: previousSet != null
                  ? Text(
                      '${previousSet.weight}kg x ${previousSet.reps}',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    )
                  : Text(
                      '-',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
            ),
          ),

          // Weight input
          SizedBox(
            width: 80,
            child: TextField(
              controller: _weightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(
                filled: true,
                fillColor: _isCompleted
                    ? AppColors.secondary.withOpacity(0.1)
                    : context.colorScheme.surfaceContainerHighest,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: 'kg',
                hintStyle: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              enabled: !_isCompleted,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Reps input
          SizedBox(
            width: 60,
            child: TextField(
              controller: _repsController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(
                filled: true,
                fillColor: _isCompleted
                    ? AppColors.secondary.withOpacity(0.1)
                    : context.colorScheme.surfaceContainerHighest,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: 'reps',
                hintStyle: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              enabled: !_isCompleted,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          const SizedBox(width: 8),

          // Complete checkbox
          SizedBox(
            width: 40,
            child: IconButton(
              icon: Icon(
                _isCompleted ? Icons.check_circle : Icons.circle_outlined,
                color: _isCompleted
                    ? AppColors.secondary
                    : context.colorScheme.onSurfaceVariant,
              ),
              onPressed: _toggleComplete,
            ),
          ),
        ],
      ),
    );
  }

  Color _getSetTypeColor(String type) {
    switch (type) {
      case 'warmup':
        return AppColors.warning;
      case 'dropset':
        return AppColors.info;
      case 'failure':
        return AppColors.error;
      default:
        return AppColors.primary;
    }
  }

  String _getSetTypeBadge(String type) {
    switch (type) {
      case 'warmup':
        return 'W';
      case 'dropset':
        return 'D';
      case 'failure':
        return 'F';
      case 'rest_pause':
        return 'RP';
      default:
        return '';
    }
  }
}
