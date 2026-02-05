import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database/database.dart';
import '../network/network_info.dart';
import '../services/deep_link_service.dart';

// ============================================================
// CORE PROVIDERS
// ============================================================

/// Database provider
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// Firebase Auth provider
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

/// Firestore provider
final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
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

/// Deep Link Service provider
final deepLinkServiceProvider = Provider<DeepLinkService>((ref) {
  final service = DeepLinkService();
  ref.onDispose(() => service.dispose());
  return service;
});
