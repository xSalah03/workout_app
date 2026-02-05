import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants/app_constants.dart';
import 'core/providers/providers.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/auth_wrapper.dart';
import 'features/settings/presentation/providers/settings_provider.dart';
// import 'firebase_options.dart'; // Make sure to run 'flutterfire configure'

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load env vars
  await dotenv.load(fileName: '.env');

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // Initialize Firebase (Requires firebase_options.dart for production)
  // For now, we assume it's set up or initialized with default for the platform
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const WorkoutTrackerApp(),
    ),
  );
}

class WorkoutTrackerApp extends ConsumerWidget {
  const WorkoutTrackerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      home: const AuthWrapper(),
    );
  }
}
