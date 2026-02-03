import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/validators.dart';
import '../providers/auth_provider.dart';

/// Authentication screen with Sign In and Sign Up
///
/// SIGN IN: Email, Password - access only if email is confirmed
/// SIGN UP: Email, Password, Password confirmation, Username (required, unique)
/// - Verification email sent on sign up; user must confirm before signing in
/// - Profile/avatar optional - placeholder assigned automatically
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  bool _isLogin = true;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  bool _isCheckingUsername = false;
  bool _showResendVerification = false;
  bool _isResending = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  /// Validate username format and check uniqueness before sign up
  Future<String?> _validateUsername(String? value) async {
    final formatError = Validators.username(value);
    if (formatError != null) return formatError;

    // Check uniqueness via API
    setState(() => _isCheckingUsername = true);
    final result = await ref.read(checkUsernameAvailabilityProvider)(
      _usernameController.text.trim().toLowerCase(),
    );
    setState(() => _isCheckingUsername = false);

    return result.fold(
      (failure) => failure.message,
      (available) => available ? null : 'Username is already taken',
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    if (!_isLogin) {
      // Sign up: validate username uniqueness
      final usernameError = await _validateUsername(_usernameController.text);
      if (usernameError != null && mounted) {
        context.showErrorSnackBar(usernameError);
        return;
      }
    }

    setState(() => _isLoading = true);

    try {
      if (_isLogin) {
        await ref
            .read(currentUserProvider.notifier)
            .signInWithEmail(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            );
      } else {
        await ref
            .read(currentUserProvider.notifier)
            .signUpWithEmail(
              email: _emailController.text.trim(),
              password: _passwordController.text,
              username: _usernameController.text.trim(),
            );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _continueAsGuest() async {
    setState(() => _isLoading = true);
    try {
      await ref.read(currentUserProvider.notifier).signInAnonymously();
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _switchMode() {
    if (_isLoading || _isCheckingUsername) return;
    setState(() {
      _isLogin = !_isLogin;
      _showResendVerification = false;
      _formKey.currentState?.reset();
      _confirmPasswordController.clear();
      _usernameController.clear();
    });
  }

  Future<void> _resendVerificationEmail() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) return;
    setState(() => _isResending = true);
    try {
      final success = await ref
          .read(currentUserProvider.notifier)
          .resendVerificationEmail(email);
      if (mounted) {
        if (success) {
          context.showSuccessSnackBar(
            'Verification email sent. Check your inbox.',
          );
          setState(() => _showResendVerification = false);
        } else {
          context.showErrorSnackBar('Failed to send. Try again later.');
        }
      }
    } finally {
      if (mounted) setState(() => _isResending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Handle auth results: verification required, email not confirmed, or errors
    ref.listen<AsyncValue>(currentUserProvider, (prev, next) {
      if (next is! AsyncError || !mounted) return;
      final error = next.error;
      if (error is AuthFailure) {
        switch (error.code) {
          case 'EMAIL_VERIFICATION_REQUIRED':
            context.showSuccessSnackBar(
              'Check your email to verify your account. You can sign in after verification.',
            );
            break;
          case 'EMAIL_NOT_CONFIRMED':
            setState(() => _showResendVerification = true);
            context.showErrorSnackBar(error.message);
            break;
          case 'EMAIL_RATE_LIMIT':
            context.showErrorSnackBar(
              'Too many requests. Please try again later.',
            );
            break;
          default:
            context.showErrorSnackBar(error.message);
        }
      } else {
        context.showErrorSnackBar(error.toString());
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 48),

                // Logo/Header
                _buildHeader(),

                const SizedBox(height: 48),

                // Email field - required for both Sign In and Sign Up
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'you@example.com',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: Validators.email,
                ),
                const SizedBox(height: 16),

                // Username field - Sign Up only, required
                if (!_isLogin) ...[
                  TextFormField(
                    controller: _usernameController,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: '3-30 characters, letters, numbers, underscore',
                      prefixIcon: const Icon(Icons.person_outline),
                      suffixIcon: _isCheckingUsername
                          ? const Padding(
                              padding: EdgeInsets.all(12),
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : null,
                    ),
                    validator: Validators.username,
                  ),
                  const SizedBox(height: 16),
                ],

                // Password field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  textInputAction: _isLogin
                      ? TextInputAction.done
                      : TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText:
                        'Min ${AppConstants.minPasswordLength} characters',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                  ),
                  validator: Validators.password,
                  onFieldSubmitted: (_) {
                    if (_isLogin) {
                      _submitForm();
                    } else {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
                const SizedBox(height: 16),

                // Password confirmation - Sign Up only
                if (!_isLogin) ...[
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () {
                          setState(
                            () => _obscureConfirmPassword =
                                !_obscureConfirmPassword,
                          );
                        },
                      ),
                    ),
                    validator: (value) => Validators.confirmPassword(
                      value,
                      _passwordController.text,
                    ),
                    onFieldSubmitted: (_) => _submitForm(),
                  ),
                  const SizedBox(height: 24),
                ] else
                  const SizedBox(height: 8),

                // Resend verification banner (shown when email not confirmed)
                if (_showResendVerification) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.errorContainer.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.mark_email_unread_outlined,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Verify your email to sign in',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        TextButton(
                          onPressed: (_isResending || _isLoading)
                              ? null
                              : _resendVerificationEmail,
                          child: _isResending
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('Resend'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Submit button
                ElevatedButton(
                  onPressed: (_isLoading || _isCheckingUsername)
                      ? null
                      : _submitForm,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(_isLogin ? 'Sign In' : 'Sign Up'),
                ),
                const SizedBox(height: 16),

                // Toggle Sign In / Sign Up
                TextButton(
                  onPressed: _switchMode,
                  child: Text(
                    _isLogin
                        ? "Don't have an account? Sign Up"
                        : 'Already have an account? Sign In',
                  ),
                ),

                const SizedBox(height: 32),

                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 32),

                // Continue as guest
                OutlinedButton.icon(
                  onPressed: _isLoading ? null : _continueAsGuest,
                  icon: const Icon(Icons.person_outline),
                  label: const Text('Continue as Guest'),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your data will be saved locally and can be synced later',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.fitness_center,
            size: 40,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          _isLogin ? 'Welcome Back' : 'Create Account',
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          _isLogin
              ? 'Sign in to sync your workouts'
              : 'Start tracking your fitness journey',
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
