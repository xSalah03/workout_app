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

/// Sign up with email use case
class SignUpWithEmail {
  final AuthRepository _repository;

  SignUpWithEmail(this._repository);

  ResultFuture<User> call({
    required String email,
    required String password,
    String? displayName,
  }) => _repository.signUpWithEmail(
    email: email,
    password: password,
    displayName: displayName,
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

/// Update user profile use case
class UpdateUserProfile {
  final AuthRepository _repository;

  UpdateUserProfile(this._repository);

  ResultFuture<User> call({String? displayName, String? email}) =>
      _repository.updateProfile(displayName: displayName, email: email);
}
