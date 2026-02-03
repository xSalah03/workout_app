import '../../../../core/utils/typedefs.dart';
import '../entities/user.dart';

/// Authentication repository interface
/// Defines the contract for authentication operations
abstract class AuthRepository {
  /// Get current user if logged in
  ResultFuture<User?> getCurrentUser();

  /// Sign in anonymously (local-only until sync)
  ResultFuture<User> signInAnonymously();

  /// Sign in with email and password
  ResultFuture<User> signInWithEmail({
    required String email,
    required String password,
  });

  /// Check if username is available (not taken)
  ResultFuture<bool> isUsernameAvailable(String username);

  /// Sign up with email and password
  /// [username] is required and must be unique
  ResultFuture<User> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    String? avatarUrl,
  });

  /// Upgrade anonymous account to email account
  ResultFuture<User> upgradeAnonymousAccount({
    required String email,
    required String password,
    String? displayName,
  });

  /// Sign out
  ResultVoid signOut();

  /// Send password reset email
  ResultVoid sendPasswordResetEmail(String email);

  /// Resend verification email for unconfirmed sign-ups
  ResultVoid resendVerificationEmail(String email);

  /// Update user profile
  ResultFuture<User> updateProfile({String? displayName, String? email});

  /// Delete account
  ResultVoid deleteAccount();

  /// Check if user is authenticated
  Future<bool> isAuthenticated();

  /// Stream of auth state changes
  Stream<User?> get authStateChanges;
}
