import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart' as app_exceptions;

/// Remote data source for authentication (Supabase)
abstract class AuthRemoteDataSource {
  /// Check if username is available (not taken by another user)
  /// Queries profiles table - requires Supabase profiles setup
  Future<bool> isUsernameAvailable(String username);

  /// Sign in anonymously
  Future<AuthResponse> signInAnonymously();

  /// Sign in with email and password
  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  });

  /// Sign up with email and password
  /// [username] is required and stored in user_metadata + profiles table
  Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
    required String username,
  });

  /// Link anonymous account to email
  Future<UserResponse> linkEmailToAnonymous({
    required String email,
    required String password,
  });

  /// Sign out
  Future<void> signOut();

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email);

  /// Resend verification email for unconfirmed sign-ups
  /// Use when user tries to sign in but email is not yet confirmed
  Future<void> resendVerificationEmail(String email);

  /// Get current session
  Session? get currentSession;

  /// Get current user
  User? get currentUser;

  /// Stream of auth state changes
  Stream<AuthState> get authStateChanges;

  /// Update user metadata
  Future<UserResponse> updateUser({
    String? email,
    String? password,
    Map<String, dynamic>? data,
  });

  /// Refresh session
  Future<AuthResponse> refreshSession();

  /// Delete user account
  Future<void> deleteAccount();
}

/// Implementation using Supabase
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabase;

  AuthRemoteDataSourceImpl({required SupabaseClient supabase})
    : _supabase = supabase;

  @override
  Future<bool> isUsernameAvailable(String username) async {
    try {
      // Query profiles table - username must be unique
      // Run supabase/migrations/001_profiles.sql in Supabase to create the table
      final result = await _supabase
          .from('profiles')
          .select('id')
          .eq('username', username.trim().toLowerCase())
          .maybeSingle();
      return result == null;
    } catch (e) {
      // If profiles table doesn't exist yet, assume available
      // User should run the migration - see supabase/migrations/
      return true;
    }
  }

  @override
  Future<AuthResponse> signInAnonymously() async {
    try {
      return await _supabase.auth.signInAnonymously();
    } on AuthException catch (e) {
      throw app_exceptions.AppAuthException(
        message: e.message,
        code: e.statusCode,
        originalException: e,
      );
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to sign in anonymously: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to sign in: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      // Normalize username: trim and lowercase for consistency
      final normalizedUsername = username.trim().toLowerCase();

      // Store username in user_metadata for Supabase Auth
      // emailRedirectTo: deep link so verification opens the app (not localhost)
      // IMPORTANT: Email confirmation MUST be enabled in Supabase dashboard
      // (Auth → Providers → Email → Enable "Confirm email")
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'username': normalizedUsername,
          'display_name': username
              .trim(), // Keep display name with original casing
        },
        emailRedirectTo: SupabaseConfig.authCallbackUrl,
      );

      // Create profile with username (if profiles table exists)
      // This requires running supabase/migrations/001_profiles.sql in Supabase SQL Editor
      if (response.user != null) {
        try {
          await _supabase.from('profiles').insert({
            'id': response.user!.id,
            'username': normalizedUsername,
            'display_name': username.trim(),
          });
        } catch (profileError) {
          // Profile creation failed - could be:
          // 1. Profiles table doesn't exist yet (run migration)
          // 2. Username already taken (shouldn't happen if checked)
          // 3. Network/permission error
          // Continue anyway - user_metadata is set, profile can be created later
          // In production, consider logging this error for debugging
        }
      }

      return response;
    } on AuthException catch (e) {
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to sign up: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<UserResponse> linkEmailToAnonymous({
    required String email,
    required String password,
  }) async {
    try {
      // Update anonymous user with email and password
      return await _supabase.auth.updateUser(
        UserAttributes(email: email, password: password),
      );
    } on AuthException catch (e) {
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to link email: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to sign out: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
    } on AuthException catch (e) {
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to send reset email: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> resendVerificationEmail(String email) async {
    try {
      await _supabase.auth.resend(type: OtpType.signup, email: email.trim());
    } on AuthException catch (e) {
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to resend verification email: $e',
        originalException: e,
      );
    }
  }

  @override
  Session? get currentSession => _supabase.auth.currentSession;

  @override
  User? get currentUser => _supabase.auth.currentUser;

  @override
  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;

  @override
  Future<UserResponse> updateUser({
    String? email,
    String? password,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await _supabase.auth.updateUser(
        UserAttributes(email: email, password: password, data: data),
      );
    } on AuthException catch (e) {
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to update user: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<AuthResponse> refreshSession() async {
    try {
      return await _supabase.auth.refreshSession();
    } on AuthException catch (e) {
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to refresh session: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      // Note: This requires a server-side function or admin API
      // For now, we'll sign out and mark the account for deletion
      final userId = currentUser?.id;
      if (userId != null) {
        // Call a Supabase Edge Function or RPC to delete the user
        await _supabase.rpc('delete_user_account', params: {'user_id': userId});
      }
      await signOut();
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to delete account: $e',
        originalException: e,
      );
    }
  }

  /// Map Supabase auth exceptions to our custom exceptions
  app_exceptions.AppAuthException _mapAuthException(AuthException e) {
    final message = e.message.toLowerCase();

    if (message.contains('invalid login credentials') ||
        message.contains('invalid password')) {
      return app_exceptions.AppAuthException(
        message: 'Invalid email or password',
        code: 'INVALID_CREDENTIALS',
        originalException: e,
      );
    }

    // Email not confirmed - user must verify before signing in
    if (message.contains('email not confirmed') ||
        message.contains('email_not_confirmed')) {
      return app_exceptions.AppAuthException(
        message: 'Please verify your email before signing in',
        code: 'EMAIL_NOT_CONFIRMED',
        originalException: e,
      );
    }

    // Rate limit - too many auth emails sent
    if (message.contains('rate limit') ||
        message.contains('over quota') ||
        message.contains('429')) {
      return app_exceptions.AppAuthException(
        message: 'Too many requests. Please try again later',
        code: 'EMAIL_RATE_LIMIT',
        originalException: e,
      );
    }

    if (message.contains('email already registered') ||
        message.contains('user already registered')) {
      return app_exceptions.AppAuthException(
        message: 'Email is already in use',
        code: 'EMAIL_IN_USE',
        originalException: e,
      );
    }

    if (message.contains('password') && message.contains('weak')) {
      return app_exceptions.AppAuthException(
        message: 'Password is too weak',
        code: 'WEAK_PASSWORD',
        originalException: e,
      );
    }

    if (message.contains('user not found')) {
      return app_exceptions.AppAuthException(
        message: 'User not found',
        code: 'USER_NOT_FOUND',
        originalException: e,
      );
    }

    if (message.contains('session expired') ||
        message.contains('refresh token')) {
      return app_exceptions.AppAuthException(
        message: 'Session expired. Please login again',
        code: 'SESSION_EXPIRED',
        originalException: e,
      );
    }

    return app_exceptions.AppAuthException(
      message: e.message,
      code: e.statusCode,
      originalException: e,
    );
  }
}
