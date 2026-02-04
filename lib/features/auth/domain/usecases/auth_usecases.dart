import '../../../../core/utils/typedefs.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Get current user use case
class GetCurrentUser {
  final AuthRepository _repository;

  GetCurrentUser(this._repository);

  ResultFuture<User?> call() => _repository.getCurrentUser();
}

/// Sign in anonymously use case
class SignInAnonymously {
  final AuthRepository _repository;

  SignInAnonymously(this._repository);

  ResultFuture<User> call() => _repository.signInAnonymously();
}

/// Sign in with email use case
class SignInWithEmail {
  final AuthRepository _repository;

  SignInWithEmail(this._repository);

  ResultFuture<User> call({required String email, required String password}) =>
      _repository.signInWithEmail(email: email, password: password);
}

/// Check username availability use case
class CheckUsernameAvailability {
  final AuthRepository _repository;

  CheckUsernameAvailability(this._repository);

  ResultFuture<bool> call(String username) =>
      _repository.isUsernameAvailable(username);
}

/// Sign up with email use case
class SignUpWithEmail {
  final AuthRepository _repository;

  SignUpWithEmail(this._repository);

  ResultFuture<User> call({
    required String email,
    required String password,
    required String username,
    required int age,
    required double heightCm,
    required double weightKg,
    String? avatarUrl,
  }) => _repository.signUpWithEmail(
    email: email,
    password: password,
    username: username,
    age: age,
    heightCm: heightCm,
    weightKg: weightKg,
    avatarUrl: avatarUrl,
  );
}

/// Upgrade anonymous account use case
class UpgradeAnonymousAccount {
  final AuthRepository _repository;

  UpgradeAnonymousAccount(this._repository);

  ResultFuture<User> call({
    required String email,
    required String password,
    String? displayName,
  }) => _repository.upgradeAnonymousAccount(
    email: email,
    password: password,
    displayName: displayName,
  );
}

/// Sign out use case
class SignOut {
  final AuthRepository _repository;

  SignOut(this._repository);

  ResultVoid call() => _repository.signOut();
}

/// Send password reset email use case
class SendPasswordResetEmail {
  final AuthRepository _repository;

  SendPasswordResetEmail(this._repository);

  ResultVoid call(String email) => _repository.sendPasswordResetEmail(email);
}

/// Reset password use case (after user follows reset link)
class ResetPassword {
  final AuthRepository _repository;

  ResetPassword(this._repository);

  ResultVoid call({required String newPassword, String? code}) =>
      _repository.resetPassword(newPassword: newPassword, code: code);
}

/// Update user profile use case
class UpdateUserProfile {
  final AuthRepository _repository;

  UpdateUserProfile(this._repository);

  ResultFuture<User> call({String? displayName, String? email}) =>
      _repository.updateProfile(displayName: displayName, email: email);
}
