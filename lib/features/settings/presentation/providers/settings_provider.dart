import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/providers/providers.dart';

// ============================================================
// THEME SETTINGS
// ============================================================

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((
  ref,
) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return ThemeModeNotifier(prefs);
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final SharedPreferences _prefs;

  ThemeModeNotifier(this._prefs) : super(ThemeMode.system) {
    _loadTheme();
  }

  void _loadTheme() {
    final themeName = _prefs.getString(StorageKeys.theme);
    state = ThemeMode.values.firstWhere(
      (e) => e.name == themeName,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = mode;
    await _prefs.setString(StorageKeys.theme, mode.name);
  }

  void toggleTheme() {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    setTheme(newMode);
  }
}

// ============================================================
// WEIGHT UNIT SETTINGS
// ============================================================

final weightUnitProvider =
    StateNotifierProvider<WeightUnitNotifier, WeightUnit>((ref) {
      final prefs = ref.watch(sharedPreferencesProvider);
      return WeightUnitNotifier(prefs);
    });

class WeightUnitNotifier extends StateNotifier<WeightUnit> {
  final SharedPreferences _prefs;

  WeightUnitNotifier(this._prefs) : super(WeightUnit.kg) {
    _loadUnit();
  }

  void _loadUnit() {
    final unitName = _prefs.getString(StorageKeys.weightUnit);
    state = WeightUnit.values.firstWhere(
      (e) => e.name == unitName,
      orElse: () => WeightUnit.kg,
    );
  }

  Future<void> setUnit(WeightUnit unit) async {
    state = unit;
    await _prefs.setString(StorageKeys.weightUnit, unit.name);
  }

  void toggle() {
    final newUnit = state == WeightUnit.kg ? WeightUnit.lbs : WeightUnit.kg;
    setUnit(newUnit);
  }
}

// ============================================================
// NOTIFICATION SETTINGS
// ============================================================

final notificationsEnabledProvider =
    StateNotifierProvider<NotificationsNotifier, bool>((ref) {
      final prefs = ref.watch(sharedPreferencesProvider);
      return NotificationsNotifier(prefs);
    });

class NotificationsNotifier extends StateNotifier<bool> {
  final SharedPreferences _prefs;

  NotificationsNotifier(this._prefs) : super(true) {
    _loadSetting();
  }

  void _loadSetting() {
    state = _prefs.getBool(StorageKeys.notificationsEnabled) ?? true;
  }

  Future<void> toggle() async {
    state = !state;
    await _prefs.setBool(StorageKeys.notificationsEnabled, state);
  }
}

// ============================================================
// REST DAY REMINDER SETTINGS
// ============================================================

final restDayReminderProvider =
    StateNotifierProvider<RestDayReminderNotifier, bool>((ref) {
      final prefs = ref.watch(sharedPreferencesProvider);
      return RestDayReminderNotifier(prefs);
    });

class RestDayReminderNotifier extends StateNotifier<bool> {
  final SharedPreferences _prefs;

  RestDayReminderNotifier(this._prefs) : super(false) {
    _loadSetting();
  }

  void _loadSetting() {
    state = _prefs.getBool(StorageKeys.restDayReminder) ?? false;
  }

  Future<void> toggle() async {
    state = !state;
    await _prefs.setBool(StorageKeys.restDayReminder, state);
  }
}

// ============================================================
// ONBOARDING COMPLETE
// ============================================================

final onboardingCompleteProvider =
    StateNotifierProvider<OnboardingNotifier, bool>((ref) {
      final prefs = ref.watch(sharedPreferencesProvider);
      return OnboardingNotifier(prefs);
    });

class OnboardingNotifier extends StateNotifier<bool> {
  final SharedPreferences _prefs;

  OnboardingNotifier(this._prefs) : super(false) {
    _loadSetting();
  }

  void _loadSetting() {
    state = _prefs.getBool(StorageKeys.onboardingComplete) ?? false;
  }

  Future<void> complete() async {
    state = true;
    await _prefs.setBool(StorageKeys.onboardingComplete, true);
  }

  Future<void> reset() async {
    state = false;
    await _prefs.setBool(StorageKeys.onboardingComplete, false);
  }
}
