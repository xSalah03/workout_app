import '../constants/app_constants.dart';

/// Number extensions for formatting
extension DoubleExtensions on double {
  /// Format weight with unit
  String formatWeight([WeightUnit unit = WeightUnit.kg]) {
    final converted = this * unit.conversionFromKg;
    // Remove decimal if it's a whole number
    if (converted == converted.toInt()) {
      return '${converted.toInt()} ${unit.symbol}';
    }
    return '${converted.toStringAsFixed(1)} ${unit.symbol}';
  }

  /// Format weight without unit (for input fields)
  String formatWeightValue([WeightUnit unit = WeightUnit.kg]) {
    final converted = this * unit.conversionFromKg;
    if (converted == converted.toInt()) {
      return converted.toInt().toString();
    }
    return converted.toStringAsFixed(1);
  }

  /// Format distance with unit
  String formatDistance([DistanceUnit unit = DistanceUnit.km]) {
    final converted = this * unit.conversionFromKm;
    if (converted == converted.toInt()) {
      return '${converted.toInt()} ${unit.symbol}';
    }
    return '${converted.toStringAsFixed(2)} ${unit.symbol}';
  }

  /// Format as percentage
  String get asPercentage => '${(this * 100).toStringAsFixed(1)}%';

  /// Format as compact number (1.2k, 1.5M, etc.)
  String get compact {
    if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}k';
    }
    return toStringAsFixed(0);
  }

  /// Round to decimal places
  double roundTo(int places) {
    final mod = 10.0 * places;
    return (this * mod).round() / mod;
  }
}

/// Int extensions
extension IntExtensions on int {
  /// Format with commas (1,000, 10,000, etc.)
  String get formatted {
    return toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  /// Format as ordinal (1st, 2nd, 3rd, etc.)
  String get ordinal {
    if (this >= 11 && this <= 13) {
      return '${this}th';
    }
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }

  /// Format reps display
  String get repsDisplay => '$this reps';

  /// Format sets display
  String get setsDisplay => '$this sets';

  /// Format as compact number
  String get compact {
    if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}k';
    }
    return toString();
  }
}

/// Nullable number extensions
extension NullableDoubleExtensions on double? {
  /// Format weight or return placeholder
  String formatWeightOrEmpty([
    WeightUnit unit = WeightUnit.kg,
    String placeholder = '-',
  ]) {
    if (this == null) return placeholder;
    return this!.formatWeight(unit);
  }
}

extension NullableIntExtensions on int? {
  /// Format reps or return placeholder
  String formatRepsOrEmpty([String placeholder = '-']) {
    if (this == null) return placeholder;
    return this!.repsDisplay;
  }
}
