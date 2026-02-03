import '../constants/app_constants.dart';

/// Input validators for forms
class Validators {
  Validators._();

  /// Validate email format
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  /// Validate password
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < AppConstants.minPasswordLength) {
      return 'Password must be at least ${AppConstants.minPasswordLength} characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  /// Validate password confirmation
  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  /// Validate non-empty required field
  static String? required(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validate username (required, unique, alphanumeric + underscore)
  /// Used for sign up - uniqueness is checked separately via API
  static String? username(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    }
    final trimmed = value.trim();
    if (trimmed.length < AppConstants.minUsernameLength) {
      return 'Username must be at least ${AppConstants.minUsernameLength} characters';
    }
    if (trimmed.length > AppConstants.maxUsernameLength) {
      return 'Username must be less than ${AppConstants.maxUsernameLength} characters';
    }
    // Allow letters, numbers, underscore only
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(trimmed)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null;
  }

  /// Validate name (for workout, exercise, etc.)
  static String? name(String? value, [String fieldName = 'Name']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    if (value.length > AppConstants.maxNameLength) {
      return '$fieldName must be less than ${AppConstants.maxNameLength} characters';
    }
    return null;
  }

  /// Validate weight input
  static String? weight(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Weight can be optional
    }
    final weight = double.tryParse(value);
    if (weight == null) {
      return 'Please enter a valid number';
    }
    if (weight < 0) {
      return 'Weight cannot be negative';
    }
    if (weight > AppConstants.maxWeight) {
      return 'Weight exceeds maximum (${AppConstants.maxWeight} kg)';
    }
    return null;
  }

  /// Validate reps input
  static String? reps(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Reps can be optional
    }
    final reps = int.tryParse(value);
    if (reps == null) {
      return 'Please enter a valid number';
    }
    if (reps < 0) {
      return 'Reps cannot be negative';
    }
    if (reps > AppConstants.maxReps) {
      return 'Reps exceed maximum (${AppConstants.maxReps})';
    }
    return null;
  }

  /// Validate sets count
  static String? sets(String? value) {
    if (value == null || value.isEmpty) {
      return 'Number of sets is required';
    }
    final sets = int.tryParse(value);
    if (sets == null) {
      return 'Please enter a valid number';
    }
    if (sets < 1) {
      return 'Must have at least 1 set';
    }
    if (sets > AppConstants.maxSetsPerExercise) {
      return 'Maximum ${AppConstants.maxSetsPerExercise} sets allowed';
    }
    return null;
  }

  /// Validate duration in seconds
  static String? duration(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final duration = int.tryParse(value);
    if (duration == null) {
      return 'Please enter a valid number';
    }
    if (duration < 0) {
      return 'Duration cannot be negative';
    }
    if (duration > AppConstants.maxDuration) {
      return 'Duration exceeds maximum (24 hours)';
    }
    return null;
  }

  /// Validate RPE (Rate of Perceived Exertion)
  static String? rpe(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final rpe = double.tryParse(value);
    if (rpe == null) {
      return 'Please enter a valid number';
    }
    if (rpe < 1 || rpe > 10) {
      return 'RPE must be between 1 and 10';
    }
    return null;
  }

  /// Validate notes
  static String? notes(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (value.length > AppConstants.maxNotesLength) {
      return 'Notes must be less than ${AppConstants.maxNotesLength} characters';
    }
    return null;
  }
}
