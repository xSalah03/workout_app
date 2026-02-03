import 'dart:io';

import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../domain/entities/personal_record.dart';
import '../../../workout/domain/entities/workout_session.dart';

/// Service for exporting workout data to various formats
class ExportService {
  /// Export workout history to CSV
  static Future<String> exportWorkoutsToCSV({
    required List<WorkoutSession> sessions,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    // Filter sessions by date range
    var filtered = sessions;
    if (startDate != null) {
      filtered = filtered.where((s) => s.startedAt.isAfter(startDate)).toList();
    }
    if (endDate != null) {
      filtered = filtered.where((s) => s.startedAt.isBefore(endDate)).toList();
    }

    // Build CSV data
    final List<List<dynamic>> rows = [
      // Header row
      [
        'Date',
        'Workout Name',
        'Duration (min)',
        'Exercise',
        'Set #',
        'Weight (kg)',
        'Reps',
        'Volume',
        'RPE',
        'Set Type',
        'Notes',
      ],
    ];

    // Data rows
    for (final session in filtered) {
      for (final exercise in session.exercises) {
        for (final set in exercise.sets) {
          rows.add([
            DateFormat('yyyy-MM-dd HH:mm').format(session.startedAt),
            session.name,
            (session.durationSeconds ?? 0) ~/ 60,
            exercise.exerciseName ?? 'Unknown',
            set.setNumber,
            set.weight ?? '',
            set.reps ?? '',
            set.volume,
            set.rpe ?? '',
            set.setType.value,
            set.notes ?? '',
          ]);
        }
      }
    }

    // Convert to CSV string
    const converter = ListToCsvConverter();
    final csvString = converter.convert(rows);

    // Save to file
    final directory = await getApplicationDocumentsDirectory();
    final fileName =
        'workout_export_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.csv';
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(csvString);

    return file.path;
  }

  /// Export personal records to CSV
  static Future<String> exportPRsToCSV({
    required List<PersonalRecord> records,
  }) async {
    final List<List<dynamic>> rows = [
      // Header row
      [
        'Exercise',
        'Record Type',
        'Value',
        'Reps',
        'Date Achieved',
        'Is Current',
      ],
    ];

    // Data rows
    for (final record in records) {
      rows.add([
        record.exerciseName ?? 'Unknown',
        record.recordType.displayName,
        record.value,
        record.reps ?? '',
        DateFormat('yyyy-MM-dd').format(record.achievedAt),
        record.isCurrentRecord ? 'Yes' : 'No',
      ]);
    }

    const converter = ListToCsvConverter();
    final csvString = converter.convert(rows);

    final directory = await getApplicationDocumentsDirectory();
    final fileName =
        'pr_export_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.csv';
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(csvString);

    return file.path;
  }

  /// Export full backup (all data) to JSON
  static Future<String> exportFullBackup({
    required Map<String, dynamic> allData,
  }) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName =
        'workout_backup_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.json';
    final file = File('${directory.path}/$fileName');

    // Pretty print JSON
    final jsonString = _prettyJson(allData);
    await file.writeAsString(jsonString);

    return file.path;
  }

  /// Share exported file
  static Future<void> shareFile(String filePath) async {
    await Share.shareXFiles([
      XFile(filePath),
    ], subject: 'Workout Tracker Export');
  }

  /// Generate statistics summary as text
  static String generateStatsSummary({
    required List<WorkoutSession> sessions,
    required List<PersonalRecord> prs,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    final buffer = StringBuffer();
    buffer.writeln('=== Workout Tracker Statistics ===');
    buffer.writeln('');
    buffer.writeln(
      'Period: ${DateFormat('MMM d, yyyy').format(startDate)} - ${DateFormat('MMM d, yyyy').format(endDate)}',
    );
    buffer.writeln('');

    // Workout stats
    final filteredSessions = sessions
        .where(
          (s) =>
              s.startedAt.isAfter(startDate) && s.startedAt.isBefore(endDate),
        )
        .toList();

    buffer.writeln('WORKOUTS');
    buffer.writeln('--------');
    buffer.writeln('Total Workouts: ${filteredSessions.length}');

    final totalDuration = filteredSessions.fold<int>(
      0,
      (sum, s) => sum + (s.durationSeconds ?? 0),
    );
    buffer.writeln('Total Time: ${_formatDuration(totalDuration)}');

    final totalVolume = filteredSessions.fold<double>(
      0,
      (sum, s) => sum + (s.totalVolume ?? 0),
    );
    buffer.writeln('Total Volume: ${totalVolume.toStringAsFixed(0)} kg');

    final totalSets = filteredSessions.fold<int>(
      0,
      (sum, s) => sum + (s.totalSets ?? 0),
    );
    buffer.writeln('Total Sets: $totalSets');

    buffer.writeln('');
    buffer.writeln('PERSONAL RECORDS');
    buffer.writeln('----------------');

    final newPRs = prs
        .where(
          (p) =>
              p.achievedAt.isAfter(startDate) && p.achievedAt.isBefore(endDate),
        )
        .toList();
    buffer.writeln('New PRs: ${newPRs.length}');

    for (final pr in newPRs.take(10)) {
      buffer.writeln('  - ${pr.exerciseName}: ${pr.getValueDisplay()}');
    }

    return buffer.toString();
  }

  static String _formatDuration(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }

  static String _prettyJson(Map<String, dynamic> json) {
    // Simple JSON formatting
    return json.toString();
  }
}
