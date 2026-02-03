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

  /// Sign up with email and password
  ResultFuture<User> signUpWithEmail({
    required String email,
    required String password,
    String? displayName,
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

  /// Update user profile
  ResultFuture<User> updateProfile({String? displayName, String? email});

  /// Delete account
  ResultVoid deleteAccount();

  /// Check if user is authenticated
  Future<bool> isAuthenticated();

  /// Stream of auth state changes
  Stream<User?> get authStateChanges;
}
