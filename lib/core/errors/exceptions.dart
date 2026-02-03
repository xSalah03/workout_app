/// Base exception class
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalException;

  const AppException({
    required this.message,
    this.code,
    this.originalException,
  });

  @override
  String toString() => 'AppException: $message (code: $code)';
}

/// Server/API exceptions
class ServerException extends AppException {
  final int? statusCode;

  const ServerException({
    required super.message,
    this.statusCode,
    super.code,
    super.originalException,
  });
}

/// Network exceptions
class NetworkException extends AppException {
  const NetworkException({
    super.message = 'No internet connection',
    super.code = 'NETWORK_ERROR',
    super.originalException,
  });
}

/// Database exceptions
class DatabaseException extends AppException {
  const DatabaseException({
    required super.message,
    super.code = 'DATABASE_ERROR',
    super.originalException,
  });
}

/// Cache exceptions
class CacheException extends AppException {
  const CacheException({
    super.message = 'Cache error occurred',
    super.code = 'CACHE_ERROR',
    super.originalException,
  });
}

/// Authentication exceptions
/// Named AppAuthException to avoid conflict with Supabase's AuthException
class AppAuthException extends AppException {
  const AppAuthException({
    required super.message,
    super.code = 'AUTH_ERROR',
    super.originalException,
  });
}

/// Sync exceptions
class SyncException extends AppException {
  const SyncException({
    required super.message,
    super.code = 'SYNC_ERROR',
    super.originalException,
  });
}

/// Validation exceptions
class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;

  const ValidationException({
    required super.message,
    super.code = 'VALIDATION_ERROR',
    this.fieldErrors,
  });
}
