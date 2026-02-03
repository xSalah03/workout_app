import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/settings_provider.dart';

/// Settings screen
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider).valueOrNull;
    final themeMode = ref.watch(themeModeProvider);
    final weightUnit = ref.watch(weightUnitProvider);
    final notificationsEnabled = ref.watch(notificationsEnabledProvider);
    final restDayReminder = ref.watch(restDayReminderProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // Account Section
          _SectionHeader(title: 'Account'),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: Icon(
                user?.isAnonymous ?? true ? Icons.person_outline : Icons.person,
                color: AppColors.primary,
              ),
            ),
            title: Text(user?.displayNameOrEmail ?? 'Guest'),
            subtitle: Text(user?.isAnonymous ?? true ? 'Not synced' : 'Synced'),
            trailing: user?.isAnonymous ?? true
                ? TextButton(
                    onPressed: () => _showUpgradeDialog(context, ref),
                    child: const Text('Upgrade'),
                  )
                : null,
          ),
          const Divider(),

          // Appearance Section
          _SectionHeader(title: 'Appearance'),
          ListTile(
            leading: const Icon(Icons.dark_mode_outlined),
            title: const Text('Theme'),
            subtitle: Text(_getThemeName(themeMode)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showThemeDialog(context, ref, themeMode),
          ),
          const Divider(),

          // Units Section
          _SectionHeader(title: 'Units'),
          SwitchListTile(
            secondary: const Icon(Icons.fitness_center),
            title: const Text('Weight Unit'),
            subtitle: Text(weightUnit.displayName),
            value: weightUnit == WeightUnit.lbs,
            onChanged: (value) {
              ref.read(weightUnitProvider.notifier).toggle();
            },
          ),
          const Divider(),

          // Notifications Section
          _SectionHeader(title: 'Notifications'),
          SwitchListTile(
            secondary: const Icon(Icons.notifications_outlined),
            title: const Text('Push Notifications'),
            subtitle: const Text('Workout reminders and updates'),
            value: notificationsEnabled,
            onChanged: (_) {
              ref.read(notificationsEnabledProvider.notifier).toggle();
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.hotel_outlined),
            title: const Text('Rest Day Reminders'),
            subtitle: const Text('Remind me to take rest days'),
            value: restDayReminder,
            onChanged: (_) {
              ref.read(restDayReminderProvider.notifier).toggle();
            },
          ),
          const Divider(),

          // Data Section
          _SectionHeader(title: 'Data'),
          ListTile(
            leading: const Icon(Icons.file_download_outlined),
            title: const Text('Export Data'),
            subtitle: const Text('Download your workout history'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _exportData(context),
          ),
          ListTile(
            leading: const Icon(Icons.sync_outlined),
            title: const Text('Sync Status'),
            subtitle: const Text('Last synced: Never'),
            trailing: TextButton(
              onPressed: () {
                // Trigger manual sync
              },
              child: const Text('Sync Now'),
            ),
          ),
          const Divider(),

          // About Section
          _SectionHeader(title: 'About'),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Version'),
            subtitle: const Text(AppConstants.appVersion),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Open privacy policy
            },
          ),
          ListTile(
            leading: const Icon(Icons.gavel_outlined),
            title: const Text('Terms of Service'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Open terms
            },
          ),
          const Divider(),

          // Danger Zone
          _SectionHeader(title: 'Danger Zone'),
          ListTile(
            leading: Icon(Icons.logout, color: AppColors.error),
            title: Text('Sign Out', style: TextStyle(color: AppColors.error)),
            onTap: () => _signOut(context, ref),
          ),
          ListTile(
            leading: Icon(Icons.delete_forever, color: AppColors.error),
            title: Text(
              'Delete Account',
              style: TextStyle(color: AppColors.error),
            ),
            onTap: () => _deleteAccount(context, ref),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  String _getThemeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }

  void _showThemeDialog(
    BuildContext context,
    WidgetRef ref,
    ThemeMode current,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ThemeMode.values.map((mode) {
            return RadioListTile<ThemeMode>(
              title: Text(_getThemeName(mode)),
              value: mode,
              groupValue: current,
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeModeProvider.notifier).setTheme(value);
                  Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showUpgradeDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const _UpgradeAccountSheet(),
    );
  }

  void _exportData(BuildContext context) async {
    // Show loading
    context.showLoadingDialog(message: 'Exporting data...');

    // TODO: Implement export
    await Future.delayed(const Duration(seconds: 2));

    if (context.mounted) {
      context.hideDialog();
      context.showSuccessSnackBar('Data exported successfully');
    }
  }

  void _signOut(BuildContext context, WidgetRef ref) async {
    final confirm = await context.showConfirmDialog(
      title: 'Sign Out',
      content: 'Are you sure you want to sign out?',
      confirmText: 'Sign Out',
      destructive: true,
    );

    if (confirm) {
      await ref.read(currentUserProvider.notifier).signOut();
    }
  }

  void _deleteAccount(BuildContext context, WidgetRef ref) async {
    final confirm = await context.showConfirmDialog(
      title: 'Delete Account',
      content:
          'This will permanently delete your account and all workout data. This action cannot be undone.',
      confirmText: 'Delete',
      destructive: true,
    );

    if (confirm) {
      // TODO: Delete account
    }
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.primary,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _UpgradeAccountSheet extends ConsumerStatefulWidget {
  const _UpgradeAccountSheet();

  @override
  ConsumerState<_UpgradeAccountSheet> createState() =>
      _UpgradeAccountSheetState();
}

class _UpgradeAccountSheetState extends ConsumerState<_UpgradeAccountSheet> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text('Sync Your Data', style: context.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Create an account to sync your workouts across devices and never lose your data.',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),

            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
              ),
              validator: (value) {
                if (value == null || value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _isLoading ? null : _upgrade,
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  void _upgrade() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await ref
          .read(currentUserProvider.notifier)
          .upgradeAccount(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );
      if (mounted) {
        Navigator.pop(context);
        context.showSuccessSnackBar('Account created and synced!');
      }
    } catch (e) {
      if (mounted) {
        context.showErrorSnackBar(e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
