import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// User entity representing the domain model
@freezed
class User with _$User {
  const User._();

  const factory User({
    required String id,
    String? email,
    String? displayName,
    String? remoteId,
    int? age,
    double? heightCm,
    double? weightKg,
    @Default(true) bool isAnonymous,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDirty,
    @Default(0) int syncVersion,
    DateTime? lastSyncedAt,
  }) = _User;

  /// Check if user has been synced to remote
  bool get isSynced => remoteId != null && !isDirty;

  /// Check if user can upgrade from anonymous
  bool get canUpgrade => isAnonymous && email == null;

  /// Get display name or email or 'Anonymous'
  String get displayNameOrEmail => displayName ?? email ?? 'Anonymous User';

  /// Check if user has completed physical profile data
  bool get hasPhysicalData =>
      age != null && heightCm != null && weightKg != null;
}
