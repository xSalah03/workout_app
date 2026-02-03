import 'package:intl/intl.dart';

/// DateTime extensions for common formatting and calculations
extension DateTimeExtensions on DateTime {
  /// Format as "Mon, Jan 1"
  String get shortDate => DateFormat('E, MMM d').format(this);

  /// Format as "January 1, 2024"
  String get fullDate => DateFormat('MMMM d, y').format(this);

  /// Format as "Jan 1, 2024"
  String get mediumDate => DateFormat('MMM d, y').format(this);

  /// Format as "01/01/2024"
  String get numericDate => DateFormat('MM/dd/yyyy').format(this);

  /// Format as "2024-01-01"
  String get isoDate => DateFormat('yyyy-MM-dd').format(this);

  /// Format as "3:30 PM"
  String get time => DateFormat('h:mm a').format(this);

  /// Format as "15:30"
  String get time24 => DateFormat('HH:mm').format(this);

  /// Format as "Jan 1, 3:30 PM"
  String get dateTime => DateFormat('MMM d, h:mm a').format(this);

  /// Format as "Monday"
  String get dayName => DateFormat('EEEE').format(this);

  /// Format as "Mon"
  String get shortDayName => DateFormat('E').format(this);

  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Check if date is this week
  bool get isThisWeek {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    return isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
        isBefore(endOfWeek.add(const Duration(days: 1)));
  }

  /// Check if date is this month
  bool get isThisMonth {
    final now = DateTime.now();
    return year == now.year && month == now.month;
  }

  /// Get relative date string (Today, Yesterday, or date)
  String get relativeDate {
    if (isToday) return 'Today';
    if (isYesterday) return 'Yesterday';
    if (isThisWeek) return dayName;
    return shortDate;
  }

  /// Get start of day (00:00:00)
  DateTime get startOfDay => DateTime(year, month, day);

  /// Get end of day (23:59:59)
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59);

  /// Get start of week (Monday)
  DateTime get startOfWeek {
    return subtract(Duration(days: weekday - 1)).startOfDay;
  }

  /// Get end of week (Sunday)
  DateTime get endOfWeek {
    return add(Duration(days: 7 - weekday)).endOfDay;
  }

  /// Get start of month
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// Get end of month
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59);

  /// Days since date
  int daysSince(DateTime other) {
    return difference(other).inDays;
  }

  /// Weeks since date
  int weeksSince(DateTime other) {
    return (difference(other).inDays / 7).floor();
  }

  /// Check if same day as another date
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Check if same week as another date
  bool isSameWeek(DateTime other) {
    return startOfWeek.isSameDay(other.startOfWeek);
  }

  /// Check if same month as another date
  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }
}

/// Duration extensions
extension DurationExtensions on Duration {
  /// Format as "1h 30m"
  String get formatted {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }

  /// Format as "01:30:00"
  String get digital {
    final hours = inHours.toString().padLeft(2, '0');
    final minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');

    if (inHours > 0) {
      return '$hours:$minutes:$seconds';
    } else {
      return '$minutes:$seconds';
    }
  }

  /// Format as "1:30" (minutes:seconds) for rest timers
  String get restTimer {
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

/// Int extensions for time
extension IntTimeExtensions on int {
  /// Convert seconds to Duration
  Duration get seconds => Duration(seconds: this);

  /// Convert minutes to Duration
  Duration get minutes => Duration(minutes: this);

  /// Convert hours to Duration
  Duration get hours => Duration(hours: this);

  /// Format seconds as "1h 30m"
  String get asFormattedDuration => Duration(seconds: this).formatted;

  /// Format seconds as "01:30:00"
  String get asDigitalDuration => Duration(seconds: this).digital;
}
