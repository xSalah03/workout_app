import 'package:flutter/material.dart';

/// BuildContext extensions for easy access to common properties
extension ContextExtensions on BuildContext {
  // ============================================================
  // THEME
  // ============================================================

  /// Get current theme
  ThemeData get theme => Theme.of(this);

  /// Get color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Get text theme
  TextTheme get textTheme => theme.textTheme;

  /// Check if dark mode
  bool get isDarkMode => theme.brightness == Brightness.dark;

  // ============================================================
  // MEDIA QUERY
  // ============================================================

  /// Get media query
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get screen size
  Size get screenSize => mediaQuery.size;

  /// Get screen width
  double get screenWidth => screenSize.width;

  /// Get screen height
  double get screenHeight => screenSize.height;

  /// Get safe area padding
  EdgeInsets get padding => mediaQuery.padding;

  /// Get safe area top padding
  double get paddingTop => padding.top;

  /// Get safe area bottom padding
  double get paddingBottom => padding.bottom;

  /// Get view insets (keyboard, etc.)
  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  /// Check if keyboard is visible
  bool get isKeyboardVisible => viewInsets.bottom > 0;

  // ============================================================
  // RESPONSIVE BREAKPOINTS
  // ============================================================

  /// Check if small screen (< 600px)
  bool get isSmallScreen => screenWidth < 600;

  /// Check if medium screen (600-1200px)
  bool get isMediumScreen => screenWidth >= 600 && screenWidth < 1200;

  /// Check if large screen (>= 1200px)
  bool get isLargeScreen => screenWidth >= 1200;

  /// Check if mobile (< 600px)
  bool get isMobile => screenWidth < 600;

  /// Check if tablet (600-900px)
  bool get isTablet => screenWidth >= 600 && screenWidth < 900;

  /// Check if desktop (>= 900px)
  bool get isDesktop => screenWidth >= 900;

  // ============================================================
  // NAVIGATION
  // ============================================================

  /// Navigate to a route
  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => page));
  }

  /// Navigate and replace current route
  Future<T?> pushReplacement<T>(Widget page) {
    return Navigator.of(
      this,
    ).pushReplacement<T, dynamic>(MaterialPageRoute(builder: (_) => page));
  }

  /// Navigate and clear stack
  Future<T?> pushAndRemoveUntil<T>(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  /// Pop current route
  void pop<T>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  /// Check if can pop
  bool get canPop => Navigator.of(this).canPop();

  // ============================================================
  // SNACKBAR
  // ============================================================

  /// Show a snackbar
  void showSnackBar(
    String message, {
    Duration? duration,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? const Duration(seconds: 3),
        action: action,
      ),
    );
  }

  /// Show success snackbar
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Show error snackbar
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  // ============================================================
  // DIALOGS
  // ============================================================

  /// Show an alert dialog
  Future<bool?> showAlertDialog({
    required String title,
    required String content,
    String confirmText = 'OK',
    String? cancelText,
    bool destructive = false,
  }) {
    return showDialog<bool>(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelText),
            ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: destructive
                ? TextButton.styleFrom(foregroundColor: Colors.red)
                : null,
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  /// Show confirmation dialog
  Future<bool> showConfirmDialog({
    required String title,
    required String content,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    bool destructive = false,
  }) async {
    final result = await showAlertDialog(
      title: title,
      content: content,
      confirmText: confirmText,
      cancelText: cancelText,
      destructive: destructive,
    );
    return result ?? false;
  }

  /// Show loading dialog
  void showLoadingDialog({String? message}) {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 16),
            Text(message ?? 'Loading...'),
          ],
        ),
      ),
    );
  }

  /// Hide dialog
  void hideDialog() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }

  // ============================================================
  // BOTTOM SHEET
  // ============================================================

  /// Show modal bottom sheet
  Future<T?> showBottomSheet<T>({
    required Widget child,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: context.viewInsets.bottom),
        child: child,
      ),
    );
  }

  // ============================================================
  // FOCUS
  // ============================================================

  /// Unfocus current focus node (dismiss keyboard)
  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}
