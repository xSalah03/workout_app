import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../database/database.dart';
import '../../domain/entities/exercise.dart';

/// Exercise library screen
class ExercisesScreen extends ConsumerStatefulWidget {
  const ExercisesScreen({super.key});

  @override
  ConsumerState<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends ConsumerState<ExercisesScreen> {
  String _searchQuery = '';
  MuscleGroup? _selectedMuscleGroup;
  EquipmentType? _selectedEquipment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _createExercise(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search exercises',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value);
              },
            ),
          ),

          // Filter chips
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _FilterChip(
                  label: 'All Muscles',
                  selected: _selectedMuscleGroup == null,
                  onSelected: (_) {
                    setState(() => _selectedMuscleGroup = null);
                  },
                ),
                const SizedBox(width: 8),
                ...MuscleGroup.values.map((group) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _FilterChip(
                      label: group.displayName,
                      selected: _selectedMuscleGroup == group,
                      onSelected: (_) {
                        setState(() => _selectedMuscleGroup = group);
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Exercise list
          Expanded(
            child: _ExerciseList(
              searchQuery: _searchQuery,
              muscleGroup: _selectedMuscleGroup,
              equipment: _selectedEquipment,
            ),
          ),
        ],
      ),
    );
  }

  void _createExercise(BuildContext context) {
    // Navigate to create exercise screen
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const _CreateExerciseSheet(),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      showCheckmark: false,
    );
  }
}

class _ExerciseList extends StatelessWidget {
  final String searchQuery;
  final MuscleGroup? muscleGroup;
  final EquipmentType? equipment;

  const _ExerciseList({
    required this.searchQuery,
    this.muscleGroup,
    this.equipment,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual data from provider
    final exercises = <Map<String, dynamic>>[
      {
        'name': 'Bench Press',
        'muscle': MuscleGroup.chest,
        'equipment': EquipmentType.barbell,
      },
      {
        'name': 'Incline Dumbbell Press',
        'muscle': MuscleGroup.chest,
        'equipment': EquipmentType.dumbbell,
      },
      {
        'name': 'Cable Fly',
        'muscle': MuscleGroup.chest,
        'equipment': EquipmentType.cable,
      },
      {
        'name': 'Deadlift',
        'muscle': MuscleGroup.back,
        'equipment': EquipmentType.barbell,
      },
      {
        'name': 'Pull-ups',
        'muscle': MuscleGroup.back,
        'equipment': EquipmentType.bodyweight,
      },
      {
        'name': 'Barbell Row',
        'muscle': MuscleGroup.back,
        'equipment': EquipmentType.barbell,
      },
      {
        'name': 'Squat',
        'muscle': MuscleGroup.quadriceps,
        'equipment': EquipmentType.barbell,
      },
      {
        'name': 'Leg Press',
        'muscle': MuscleGroup.quadriceps,
        'equipment': EquipmentType.machine,
      },
      {
        'name': 'Romanian Deadlift',
        'muscle': MuscleGroup.hamstrings,
        'equipment': EquipmentType.barbell,
      },
      {
        'name': 'Shoulder Press',
        'muscle': MuscleGroup.shoulders,
        'equipment': EquipmentType.barbell,
      },
      {
        'name': 'Lateral Raise',
        'muscle': MuscleGroup.shoulders,
        'equipment': EquipmentType.dumbbell,
      },
      {
        'name': 'Bicep Curl',
        'muscle': MuscleGroup.biceps,
        'equipment': EquipmentType.dumbbell,
      },
      {
        'name': 'Tricep Pushdown',
        'muscle': MuscleGroup.triceps,
        'equipment': EquipmentType.cable,
      },
    ];

    // Filter exercises
    var filtered = exercises.where((e) {
      final matchesSearch =
          searchQuery.isEmpty ||
          (e['name'] as String).toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
      final matchesMuscle = muscleGroup == null || e['muscle'] == muscleGroup;
      final matchesEquipment = equipment == null || e['equipment'] == equipment;
      return matchesSearch && matchesMuscle && matchesEquipment;
    }).toList();

    // Group by muscle group
    final grouped = <MuscleGroup, List<Map<String, dynamic>>>{};
    for (final exercise in filtered) {
      final muscle = exercise['muscle'] as MuscleGroup;
      grouped.putIfAbsent(muscle, () => []).add(exercise);
    }

    if (grouped.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: context.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text('No exercises found', style: context.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your filters',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: grouped.length,
      itemBuilder: (context, index) {
        final muscle = grouped.keys.elementAt(index);
        final exercises = grouped[muscle]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                muscle.displayName,
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ...exercises.map((e) => _ExerciseCard(exercise: e)),
          ],
        );
      },
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  final Map<String, dynamic> exercise;

  const _ExerciseCard({required this.exercise});

  @override
  Widget build(BuildContext context) {
    final muscle = exercise['muscle'] as MuscleGroup;
    final equipment = exercise['equipment'] as EquipmentType;

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
          child: Center(
            child: Text(muscle.icon, style: const TextStyle(fontSize: 20)),
          ),
        ),
        title: Text(exercise['name'] as String),
        subtitle: Text(equipment.displayName),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Navigate to exercise detail
        },
      ),
    );
  }
}

class _CreateExerciseSheet extends StatefulWidget {
  const _CreateExerciseSheet();

  @override
  State<_CreateExerciseSheet> createState() => _CreateExerciseSheetState();
}

class _CreateExerciseSheetState extends State<_CreateExerciseSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  MuscleGroup _selectedMuscle = MuscleGroup.chest;
  EquipmentType _selectedEquipment = EquipmentType.barbell;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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

            Text('Create Exercise', style: context.textTheme.headlineSmall),
            const SizedBox(height: 24),

            // Name field
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Exercise Name',
                hintText: 'e.g., Barbell Bench Press',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Muscle group dropdown
            DropdownButtonFormField<MuscleGroup>(
              initialValue: _selectedMuscle,
              decoration: const InputDecoration(labelText: 'Muscle Group'),
              items: MuscleGroup.values.map((muscle) {
                return DropdownMenuItem(
                  value: muscle,
                  child: Text(muscle.displayName),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedMuscle = value);
                }
              },
            ),
            const SizedBox(height: 16),

            // Equipment dropdown
            DropdownButtonFormField<EquipmentType>(
              initialValue: _selectedEquipment,
              decoration: const InputDecoration(labelText: 'Equipment'),
              items: EquipmentType.values.map((equipment) {
                return DropdownMenuItem(
                  value: equipment,
                  child: Text(equipment.displayName),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedEquipment = value);
                }
              },
            ),
            const SizedBox(height: 24),

            // Create button
            ElevatedButton(
              onPressed: _createExercise,
              child: const Text('Create Exercise'),
            ),
          ],
        ),
      ),
    );
  }

  void _createExercise() {
    if (_formKey.currentState!.validate()) {
      // TODO: Create exercise via provider
      Navigator.pop(context);
    }
  }
}
