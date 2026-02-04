import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/errors/exceptions.dart' as app_exceptions;

/// Generic Auth result to replace Supabase-specific AuthResponse
class AuthResult {
  final firebase_auth.User? user;
  final String? message;

  AuthResult({this.user, this.message});
}

/// Remote data source for authentication (Firebase)
abstract class AuthRemoteDataSource {
  /// Check if username is available
  Future<bool> isUsernameAvailable(String username);

  /// Sign in anonymously
  Future<AuthResult> signInAnonymously();

  /// Sign in with email and password
  Future<AuthResult> signInWithEmail({
    required String email,
    required String password,
  });

  /// Sign up with email and password
  Future<AuthResult> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required int age,
    required double heightCm,
    required double weightKg,
  });

  /// Link anonymous account to email
  Future<AuthResult> linkEmailToAnonymous({
    required String email,
    required String password,
  });

  /// Sign out
  Future<void> signOut();

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email);

  /// Update password for authenticated user
  Future<void> updatePassword(String newPassword);

  /// Confirm password reset with code from email link
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  });

  /// Resend verification email
  Future<void> resendVerificationEmail(String email);

  /// Get current user
  firebase_auth.User? get currentUser;

  /// Stream of auth state changes
  Stream<firebase_auth.User?> get authStateChanges;

  /// Update user profile data
  Future<void> updateProfileData(Map<String, dynamic> data);

  /// Delete user account
  Future<void> deleteAccount();
}

/// Implementation using Firebase Auth and Cloud Firestore
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRemoteDataSourceImpl({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  }) : _firebaseAuth = firebaseAuth,
       _firestore = firestore;

  @override
  Future<bool> isUsernameAvailable(String username) async {
    try {
      final normalized = username.trim().toLowerCase();
      // We use a dedicated collection 'usernames' to ensure uniqueness efficiently
      final doc = await _firestore
          .collection('usernames')
          .doc(normalized)
          .get();
      return !doc.exists;
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to check username: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<AuthResult> signInAnonymously() async {
    try {
      final credential = await _firebaseAuth.signInAnonymously();
      return AuthResult(user: credential.user);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to sign in anonymously: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<AuthResult> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Requirement: Email verification required before login
      if (credential.user != null && !credential.user!.emailVerified) {
        // We log them out if not verified to enforce the requirement
        // Alternatively, the repository can handle this check
        // For now, let's keep them logged in but return a message or throw
        throw app_exceptions.AppAuthException(
          message: 'Please verify your email before signing in',
          code: 'EMAIL_NOT_CONFIRMED',
        );
      }

      return AuthResult(user: credential.user);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapAuthException(e);
    } on app_exceptions.AppAuthException {
      rethrow;
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to sign in: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<AuthResult> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required int age,
    required double heightCm,
    required double weightKg,
  }) async {
    final normalizedUsername = username.trim().toLowerCase();

    try {
      // 1. Check if username is taken in a transaction or separate check
      // Transaction is safer for uniqueness
      final usernameAvailable = await isUsernameAvailable(normalizedUsername);
      if (!usernameAvailable) {
        throw app_exceptions.AppAuthException(
          message: 'Username is already taken',
          code: 'USERNAME_TAKEN',
        );
      }

      // 2. Create Auth User
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user != null) {
        // 3. Send verification email immediately
        await user.sendEmailVerification();

        // 4. Create user profile in Firestore
        // We use the UID as the document ID
        final profileData = {
          'uid': user.uid,
          'email': email,
          'username': normalizedUsername,
          'display_name': username.trim(),
          'age': age,
          'height_cm': heightCm,
          'weight_kg': weightKg,
          'created_at': FieldValue.serverTimestamp(),
          'updated_at': FieldValue.serverTimestamp(),
          'is_anonymous': false,
        };

        // Use a batch to create the profile and lock the username
        final batch = _firestore.batch();
        batch.set(_firestore.collection('users').doc(user.uid), profileData);
        batch.set(_firestore.collection('usernames').doc(normalizedUsername), {
          'uid': user.uid,
        });

        await batch.commit();

        // Note: New Firebase users are auto-signed in after creation.
        // But our requirement says they must verify first before login.
        // We'll sign out for now, so they must check email.
        await signOut();
      }

      return AuthResult(user: user);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapAuthException(e);
    } on app_exceptions.AppAuthException {
      rethrow;
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to sign up: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<AuthResult> linkEmailToAnonymous({
    required String email,
    required String password,
  }) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw app_exceptions.AppAuthException(
          message: 'No anonymous user to link',
          code: 'NO_USER',
        );
      }

      final credential = firebase_auth.EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      final result = await user.linkWithCredential(credential);

      // Update firestore profile
      await _firestore.collection('users').doc(user.uid).update({
        'email': email,
        'is_anonymous': false,
        'updated_at': FieldValue.serverTimestamp(),
      });

      return AuthResult(user: result.user);
    } on firebase_auth.FirebaseAuthException catch (e) {
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
      await _firebaseAuth.signOut();
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
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to send reset email: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to update password: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    try {
      await _firebaseAuth.confirmPasswordReset(
        code: code,
        newPassword: newPassword,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to reset password: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> resendVerificationEmail(String email) async {
    try {
      // In Firebase, we need the user to be signed in to resend verification
      // If they are trying to sign in, we might have a user object
      final user = _firebaseAuth.currentUser;
      if (user != null && user.email == email) {
        await user.sendEmailVerification();
      } else {
        // For security, Firebase doesn't allow resending verification
        // without an active session or re-authentication.
        // One way is to sign in temporarily if the user is unverified.
      }
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to resend verification email: $e',
        originalException: e,
      );
    }
  }

  @override
  firebase_auth.User? get currentUser => _firebaseAuth.currentUser;

  @override
  Stream<firebase_auth.User?> get authStateChanges =>
      _firebaseAuth.authStateChanges();

  @override
  Future<void> updateProfileData(Map<String, dynamic> data) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          ...data,
          'updated_at': FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to update profile data: $e',
        originalException: e,
      );
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        final uid = user.uid;

        // Get username to release it
        final userDoc = await _firestore.collection('users').doc(uid).get();
        final username = userDoc.data()?['username'] as String?;

        final batch = _firestore.batch();
        batch.delete(_firestore.collection('users').doc(uid));
        if (username != null) {
          batch.delete(_firestore.collection('usernames').doc(username));
        }

        await batch.commit();
        await user.delete();
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Re-authentication might be required for account deletion
      if (e.code == 'requires-recent-login') {
        throw app_exceptions.AppAuthException(
          message: 'Please login again before deleting your account',
          code: 'REQUIRES_RECENT_LOGIN',
        );
      }
      throw _mapAuthException(e);
    } catch (e) {
      throw app_exceptions.ServerException(
        message: 'Failed to delete account: $e',
        originalException: e,
      );
    }
  }

  /// Map Firebase auth exceptions to our custom exceptions
  app_exceptions.AppAuthException _mapAuthException(
    firebase_auth.FirebaseAuthException e,
  ) {
    final code = e.code;

    // Requirement: Generic error for login failure to prevent user enumeration
    if (code == 'user-not-found' ||
        code == 'wrong-password' ||
        code == 'invalid-credential' ||
        code == 'invalid-email') {
      return app_exceptions.AppAuthException(
        message: 'Invalid email or password',
        code: 'INVALID_CREDENTIALS',
        originalException: e,
      );
    }

    if (code == 'network-request-failed') {
      return const app_exceptions.AppAuthException(
        message: 'Network error. Please check your connection',
        code: 'NETWORK_ERROR',
      );
    }

    if (code == 'email-already-in-use') {
      return app_exceptions.AppAuthException(
        message: 'Email is already in use',
        code: 'EMAIL_IN_USE',
        originalException: e,
      );
    }

    if (code == 'weak-password') {
      return app_exceptions.AppAuthException(
        message: 'Password is too weak',
        code: 'WEAK_PASSWORD',
        originalException: e,
      );
    }

    if (code == 'too-many-requests') {
      return app_exceptions.AppAuthException(
        message: 'Too many requests. Please try again later',
        code: 'RATE_LIMIT',
        originalException: e,
      );
    }

    return app_exceptions.AppAuthException(
      message: e.message ?? 'An authentication error occurred',
      code: e.code,
      originalException: e,
    );
  }
}
