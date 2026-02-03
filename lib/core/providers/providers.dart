import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../database/database.dart';
import '../network/network_info.dart';

// ============================================================
// CORE PROVIDERS
// ============================================================

/// Database provider
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// Supabase client provider
final supabaseProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

/// SharedPreferences provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Initialize in main.dart');
});

/// Network info provider
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final networkInfo = NetworkInfoImpl();
  ref.onDispose(() => networkInfo.dispose());
  return networkInfo;
});

/// Connectivity status provider (reactive)
final connectivityProvider = StreamProvider<bool>((ref) {
  final networkInfo = ref.watch(networkInfoProvider);
  return networkInfo.onConnectivityChanged;
});

/// Is connected provider (current state)
final isConnectedProvider = FutureProvider<bool>((ref) async {
  final networkInfo = ref.watch(networkInfoProvider);
  return networkInfo.isConnected;
});
