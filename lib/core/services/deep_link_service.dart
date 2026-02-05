import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/reset_password_screen.dart';

/// Service to handle incoming deep links for email verification and password reset
class DeepLinkService {
  final _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  /// Initialize deep link listening
  void init(BuildContext context) {
    // Handle link when app is already running
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      _handleDeepLink(context, uri);
    });

    // Handle link when app is opened from a terminated state
    _appLinks.getInitialLink().then((uri) {
      if (uri != null) {
        _handleDeepLink(context, uri);
      }
    });
  }

  void _handleDeepLink(BuildContext context, Uri uri) {
    debugPrint('Deep link received: $uri');

    // Firebase Auth links usually look like:
    // https://<project-id>.firebaseapp.com/__/auth/action?mode=<action>&oobCode=<code>

    final mode = uri.queryParameters['mode'];
    final oobCode = uri.queryParameters['oobCode'];

    if (mode == 'resetPassword' && oobCode != null) {
      // Navigate to Reset Password Screen
      // The firebase_auth package handles the oobCode automatically if we use it with
      // confirmPasswordReset, but here we just navigate to the screen which
      // is already set up to handle the reset via the currentUserProvider or similar.
      // Wait, ResetPasswordScreen needs to be able to tell Firebase WHICH reset it's doing.

      // In Firebase, password reset links either:
      // 1. Point to a web page where user resets password.
      // 2. Are handled manually using confirmPasswordReset(code, newPassword).

      // If we want the app to handle it, we need the oobCode.
      // Let's check how AuthRemoteDataSourceImpl.updatePassword is implemented.

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(oobCode: oobCode),
        ),
      );
    } else if (mode == 'verifyEmail' && oobCode != null) {
      // For email verification, we could potentially handle it in-app too
      // but usually Firebase's default link handles it on a web page.
      // If we want to handle it in-app, we'd call applyActionCode(oobCode).
    }
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
