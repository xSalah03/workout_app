import 'package:equatable/equatable.dart';

/// Base failure class for error handling
/// Following functional programming approach with `Either<Failure, Success>`
abstract class Failure extends Equatable {
  final String message;
  final String? code;
  final dynamic originalError;

  const Failure({required this.message, this.code, this.originalError});

  @override
  List<Object?> get props => [message, code];
}

/// Server/API related failures
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.code,
    super.originalError,
  });

  factory ServerFailure.fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return const ServerFailure(message: 'Bad request', code: '400');
      case 401:
        return const ServerFailure(message: 'Unauthorized', code: '401');
      case 403:
        return const ServerFailure(message: 'Forbidden', code: '403');
      case 404:
        return const ServerFailure(message: 'Not found', code: '404');
      case 409:
        return const ServerFailure(message: 'Conflict', code: '409');
      case 500:
        return const ServerFailure(
          message: 'Internal server error',
          code: '500',
        );
      default:
        return ServerFailure(
          message: 'Server error: $statusCode',
          code: statusCode.toString(),
        );
    }
  }
}

/// Network connectivity failures
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection',
    super.code = 'NETWORK_ERROR',
    super.originalError,
  });
}

/// Local database failures
class DatabaseFailure extends Failure {
  const DatabaseFailure({
    required super.message,
    super.code = 'DATABASE_ERROR',
    super.originalError,
  });
}

/// Cache related failures
class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Cache error occurred',
    super.code = 'CACHE_ERROR',
    super.originalError,
  });
}

/// Authentication failures
class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.code = 'AUTH_ERROR',
    super.originalError,
  });

  factory AuthFailure.invalidCredentials() => const AuthFailure(
    message: 'Invalid email or password',
    code: 'INVALID_CREDENTIALS',
  );

  factory AuthFailure.emailAlreadyInUse() => const AuthFailure(
    message: 'Email is already in use',
    code: 'EMAIL_IN_USE',
  );

  factory AuthFailure.weakPassword() =>
      const AuthFailure(message: 'Password is too weak', code: 'WEAK_PASSWORD');

  factory AuthFailure.userNotFound() =>
      const AuthFailure(message: 'User not found', code: 'USER_NOT_FOUND');

  factory AuthFailure.sessionExpired() => const AuthFailure(
    message: 'Session expired. Please login again',
    code: 'SESSION_EXPIRED',
  );

  factory AuthFailure.emailNotConfirmed() => const AuthFailure(
    message: 'Please verify your email before signing in',
    code: 'EMAIL_NOT_CONFIRMED',
  );

  factory AuthFailure.emailVerificationRequired() => const AuthFailure(
    message: 'Please check your email to verify your account',
    code: 'EMAIL_VERIFICATION_REQUIRED',
  );

  factory AuthFailure.emailRateLimit() => const AuthFailure(
    message: 'Too many requests. Please try again later',
    code: 'EMAIL_RATE_LIMIT',
  );
}

/// Validation failures
class ValidationFailure extends Failure {
  final Map<String, String>? fieldErrors;

  const ValidationFailure({
    required super.message,
    super.code = 'VALIDATION_ERROR',
    this.fieldErrors,
  });
}

/// Sync related failures
class SyncFailure extends Failure {
  const SyncFailure({
    required super.message,
    super.code = 'SYNC_ERROR',
    super.originalError,
  });

  factory SyncFailure.conflict() => const SyncFailure(
    message: 'Sync conflict detected',
    code: 'SYNC_CONFLICT',
  );

  factory SyncFailure.versionMismatch() =>
      const SyncFailure(message: 'Version mismatch', code: 'VERSION_MISMATCH');
}

/// Permission failures
class PermissionFailure extends Failure {
  const PermissionFailure({
    required super.message,
    super.code = 'PERMISSION_ERROR',
  });
}

/// Unknown/unexpected failures
class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = 'An unexpected error occurred',
    super.code = 'UNKNOWN_ERROR',
    super.originalError,
  });
}
