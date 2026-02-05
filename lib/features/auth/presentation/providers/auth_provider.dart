import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/providers.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_usecases.dart';

// ============================================================
// DATA SOURCE PROVIDERS
// ============================================================

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return AuthLocalDataSourceImpl(database: database);
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
  );
});

// ============================================================
// REPOSITORY PROVIDER
// ============================================================

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final localDataSource = ref.watch(authLocalDataSourceProvider);
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);

  return AuthRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});

// ============================================================
// USE CASE PROVIDERS
// ============================================================

final getCurrentUserProvider = Provider<GetCurrentUser>((ref) {
  return GetCurrentUser(ref.watch(authRepositoryProvider));
});

final signInAnonymouslyProvider = Provider<SignInAnonymously>((ref) {
  return SignInAnonymously(ref.watch(authRepositoryProvider));
});

final signInWithEmailProvider = Provider<SignInWithEmail>((ref) {
  return SignInWithEmail(ref.watch(authRepositoryProvider));
});

final checkUsernameAvailabilityProvider = Provider<CheckUsernameAvailability>((
  ref,
) {
  return CheckUsernameAvailability(ref.watch(authRepositoryProvider));
});

final signUpWithEmailProvider = Provider<SignUpWithEmail>((ref) {
  return SignUpWithEmail(ref.watch(authRepositoryProvider));
});

final upgradeAnonymousAccountProvider = Provider<UpgradeAnonymousAccount>((
  ref,
) {
  return UpgradeAnonymousAccount(ref.watch(authRepositoryProvider));
});

final signOutProvider = Provider<SignOut>((ref) {
  return SignOut(ref.watch(authRepositoryProvider));
});

final sendPasswordResetEmailProvider = Provider<SendPasswordResetEmail>((ref) {
  return SendPasswordResetEmail(ref.watch(authRepositoryProvider));
});

final resetPasswordProvider = Provider<ResetPassword>((ref) {
  return ResetPassword(ref.watch(authRepositoryProvider));
});

// ============================================================
// STATE PROVIDERS
// ============================================================

/// Current user state
final currentUserProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
      final getCurrentUser = ref.watch(getCurrentUserProvider);
      final signInAnonymously = ref.watch(signInAnonymouslyProvider);
      final signInWithEmail = ref.watch(signInWithEmailProvider);
      final signUpWithEmail = ref.watch(signUpWithEmailProvider);
      final upgradeAccount = ref.watch(upgradeAnonymousAccountProvider);
      final signOut = ref.watch(signOutProvider);
      final authRepository = ref.watch(authRepositoryProvider);

      return AuthNotifier(
        getCurrentUser: getCurrentUser,
        signInAnonymously: signInAnonymously,
        signInWithEmail: signInWithEmail,
        signUpWithEmail: signUpWithEmail,
        upgradeAccount: upgradeAccount,
        signOut: signOut,
        authRepository: authRepository,
      );
    });

/// Auth state notifier
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final GetCurrentUser _getCurrentUser;
  final SignInAnonymously _signInAnonymously;
  final SignInWithEmail _signInWithEmail;
  final SignUpWithEmail _signUpWithEmail;
  final UpgradeAnonymousAccount _upgradeAccount;
  final SignOut _signOut;
  final AuthRepository _authRepository;

  AuthNotifier({
    required GetCurrentUser getCurrentUser,
    required SignInAnonymously signInAnonymously,
    required SignInWithEmail signInWithEmail,
    required SignUpWithEmail signUpWithEmail,
    required UpgradeAnonymousAccount upgradeAccount,
    required SignOut signOut,
    required AuthRepository authRepository,
  }) : _getCurrentUser = getCurrentUser,
       _signInAnonymously = signInAnonymously,
       _signInWithEmail = signInWithEmail,
       _signUpWithEmail = signUpWithEmail,
       _upgradeAccount = upgradeAccount,
       _signOut = signOut,
       _authRepository = authRepository,
       super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    final result = await _getCurrentUser();
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );

    // Listen to auth state changes
    _authRepository.authStateChanges.listen((user) {
      state = AsyncValue.data(user);
    });
  }

  /// Sign in anonymously (for first-time users)
  Future<void> signInAnonymously() async {
    state = const AsyncValue.loading();
    final result = await _signInAnonymously();
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }

  /// Sign in with email
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final result = await _signInWithEmail(email: email, password: password);
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }

  /// Sign up with email
  /// On success, user is auto signed in and redirected
  /// Includes physical data for fitness tracking features
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required int age,
    required double heightCm,
    required double weightKg,
    String? avatarUrl,
  }) async {
    state = const AsyncValue.loading();
    final result = await _signUpWithEmail(
      email: email,
      password: password,
      username: username,
      age: age,
      heightCm: heightCm,
      weightKg: weightKg,
      avatarUrl: avatarUrl,
    );
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }

  /// Upgrade anonymous account
  Future<void> upgradeAccount({
    required String email,
    required String password,
    String? displayName,
  }) async {
    state = const AsyncValue.loading();
    final result = await _upgradeAccount(
      email: email,
      password: password,
      displayName: displayName,
    );
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }

  /// Sign out
  Future<void> signOut() async {
    state = const AsyncValue.loading();
    final result = await _signOut();
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (_) => state = const AsyncValue.data(null),
    );
  }

  /// Resend verification email for unconfirmed sign-ups
  /// Returns true on success, false on failure (caller should show snackbar)
  Future<bool> resendVerificationEmail(String email) async {
    final result = await _authRepository.resendVerificationEmail(email);
    return result.isRight();
  }
}

/// Is user logged in provider
final isLoggedInProvider = Provider<bool>((ref) {
  final userState = ref.watch(currentUserProvider);
  return userState.valueOrNull != null;
});

/// Is user anonymous provider
final isAnonymousProvider = Provider<bool>((ref) {
  final userState = ref.watch(currentUserProvider);
  return userState.valueOrNull?.isAnonymous ?? true;
});
