import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_theme.dart';

/// Progress tracking screen with charts and stats
class ProgressScreen extends ConsumerStatefulWidget {
  const ProgressScreen({super.key});

  @override
  ConsumerState<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends ConsumerState<ProgressScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Volume'),
            Tab(text: 'PRs'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [_OverviewTab(), _VolumeTab(), _PersonalRecordsTab()],
      ),
    );
  }
}

class _OverviewTab extends StatelessWidget {
  const _OverviewTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Summary Cards
        Row(
          children: [
            Expanded(
              child: _StatCard(
                title: 'This Week',
                value: '4',
                subtitle: 'Workouts',
                icon: Icons.fitness_center,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                title: 'Total Volume',
                value: '12.5k',
                subtitle: 'kg lifted',
                icon: Icons.monitor_weight,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                title: 'Streak',
                value: '7',
                subtitle: 'Days',
                icon: Icons.local_fire_department,
                color: AppColors.warning,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                title: 'New PRs',
                value: '3',
                subtitle: 'This month',
                icon: Icons.emoji_events,
                color: AppColors.error,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Weekly Activity Chart
        Text('Weekly Activity', style: context.textTheme.titleLarge),
        const SizedBox(height: 16),
        const _WeeklyActivityChart(),
        const SizedBox(height: 24),

        // Muscle Volume Distribution
        Text('Volume by Muscle Group', style: context.textTheme.titleLarge),
        const SizedBox(height: 16),
        const _MuscleVolumeChart(),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 18),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeeklyActivityChart extends StatelessWidget {
  const _WeeklyActivityChart();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 5,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          days[value.toInt()],
                          style: context.textTheme.bodySmall,
                        ),
                      );
                    },
                    reservedSize: 30,
                  ),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              barGroups: [
                _makeBarGroup(0, 1),
                _makeBarGroup(1, 2),
                _makeBarGroup(2, 0),
                _makeBarGroup(3, 1),
                _makeBarGroup(4, 1),
                _makeBarGroup(5, 0),
                _makeBarGroup(6, 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData _makeBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: y > 0 ? AppColors.primary : AppColors.primary.withOpacity(0.2),
          width: 24,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
        ),
      ],
    );
  }
}

class _MuscleVolumeChart extends StatelessWidget {
  const _MuscleVolumeChart();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: 30,
                  title: 'Chest',
                  color: AppColors.chest,
                  radius: 60,
                  titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  value: 25,
                  title: 'Back',
                  color: AppColors.back,
                  radius: 60,
                  titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  value: 20,
                  title: 'Legs',
                  color: AppColors.legs,
                  radius: 60,
                  titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  value: 15,
                  title: 'Arms',
                  color: AppColors.arms,
                  radius: 60,
                  titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  value: 10,
                  title: 'Other',
                  color: AppColors.core,
                  radius: 60,
                  titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
              sectionsSpace: 2,
              centerSpaceRadius: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class _VolumeTab extends StatelessWidget {
  const _VolumeTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Period selector
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                _PeriodChip(label: '1W', selected: false),
                _PeriodChip(label: '1M', selected: true),
                _PeriodChip(label: '3M', selected: false),
                _PeriodChip(label: '1Y', selected: false),
                _PeriodChip(label: 'All', selected: false),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Volume trend chart
        Text('Volume Trend', style: context.textTheme.titleLarge),
        const SizedBox(height: 12),
        const _VolumeTrendChart(),
        const SizedBox(height: 24),

        // Volume by exercise
        Text('Volume by Exercise', style: context.textTheme.titleLarge),
        const SizedBox(height: 12),
        ..._buildExerciseVolumeList(context),
      ],
    );
  }

  List<Widget> _buildExerciseVolumeList(BuildContext context) {
    final exercises = [
      ('Bench Press', 3500.0, 12.5),
      ('Squat', 4200.0, 8.2),
      ('Deadlift', 3800.0, -2.1),
      ('Shoulder Press', 1800.0, 15.3),
      ('Barbell Row', 2100.0, 5.7),
    ];

    return exercises.map((e) {
      return Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          title: Text(e.$1),
          subtitle: Text('${e.$2.toStringAsFixed(0)} kg'),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: e.$3 >= 0
                  ? AppColors.secondary.withOpacity(0.1)
                  : AppColors.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${e.$3 >= 0 ? '+' : ''}${e.$3.toStringAsFixed(1)}%',
              style: context.textTheme.bodySmall?.copyWith(
                color: e.$3 >= 0 ? AppColors.secondary : AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}

class _PeriodChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _PeriodChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ChoiceChip(
          label: Text(label),
          selected: selected,
          onSelected: (_) {},
          showCheckmark: false,
        ),
      ),
    );
  }
}

class _VolumeTrendChart extends StatelessWidget {
  const _VolumeTrendChart();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 5000,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: context.colorScheme.outline.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const weeks = ['W1', 'W2', 'W3', 'W4'];
                      if (value.toInt() >= 0 && value.toInt() < weeks.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            weeks[value.toInt()],
                            style: context.textTheme.bodySmall,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                    reservedSize: 30,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '${(value / 1000).toStringAsFixed(0)}k',
                        style: context.textTheme.bodySmall,
                      );
                    },
                    reservedSize: 40,
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 10000),
                    FlSpot(1, 12000),
                    FlSpot(2, 11500),
                    FlSpot(3, 14000),
                  ],
                  isCurved: true,
                  color: AppColors.primary,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 4,
                        color: AppColors.primary,
                        strokeWidth: 2,
                        strokeColor: Colors.white,
                      );
                    },
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppColors.primary.withOpacity(0.1),
                  ),
                ),
              ],
              minX: 0,
              maxX: 3,
              minY: 0,
              maxY: 20000,
            ),
          ),
        ),
      ),
    );
  }
}

class _PersonalRecordsTab extends StatelessWidget {
  const _PersonalRecordsTab();

  @override
  Widget build(BuildContext context) {
    final prs = [
      (
        'Bench Press',
        '100 kg x 5',
        DateTime.now().subtract(const Duration(days: 2)),
      ),
      ('Squat', '140 kg x 3', DateTime.now().subtract(const Duration(days: 5))),
      (
        'Deadlift',
        '180 kg x 1',
        DateTime.now().subtract(const Duration(days: 10)),
      ),
      (
        'Shoulder Press',
        '60 kg x 8',
        DateTime.now().subtract(const Duration(days: 14)),
      ),
      (
        'Barbell Row',
        '80 kg x 10',
        DateTime.now().subtract(const Duration(days: 20)),
      ),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Recent PRs
        Text('Recent Personal Records', style: context.textTheme.titleLarge),
        const SizedBox(height: 12),
        ...prs.map((pr) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.warning.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.emoji_events, color: AppColors.warning),
              ),
              title: Text(pr.$1),
              subtitle: Text(pr.$2),
              trailing: Text(
                _formatDate(pr.$3),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date).inDays;
    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    if (diff < 7) return '$diff days ago';
    return '${(diff / 7).floor()} weeks ago';
  }
}
