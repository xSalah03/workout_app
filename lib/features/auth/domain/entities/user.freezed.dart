// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get supabaseId => throw _privateConstructorUsedError;
  bool get isAnonymous => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;
  int get syncVersion => throw _privateConstructorUsedError;
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String? email,
      String? displayName,
      String? supabaseId,
      bool isAnonymous,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      DateTime? lastSyncedAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? supabaseId = freezed,
    Object? isAnonymous = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      supabaseId: freezed == supabaseId
          ? _value.supabaseId
          : supabaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDirty: null == isDirty
          ? _value.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
      syncVersion: null == syncVersion
          ? _value.syncVersion
          : syncVersion // ignore: cast_nullable_to_non_nullable
              as int,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? email,
      String? displayName,
      String? supabaseId,
      bool isAnonymous,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      DateTime? lastSyncedAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? supabaseId = freezed,
    Object? isAnonymous = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      supabaseId: freezed == supabaseId
          ? _value.supabaseId
          : supabaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDirty: null == isDirty
          ? _value.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
      syncVersion: null == syncVersion
          ? _value.syncVersion
          : syncVersion // ignore: cast_nullable_to_non_nullable
              as int,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id,
      this.email,
      this.displayName,
      this.supabaseId,
      this.isAnonymous = true,
      required this.createdAt,
      required this.updatedAt,
      this.isDirty = false,
      this.syncVersion = 0,
      this.lastSyncedAt})
      : super._();

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? supabaseId;
  @override
  @JsonKey()
  final bool isAnonymous;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isDirty;
  @override
  @JsonKey()
  final int syncVersion;
  @override
  final DateTime? lastSyncedAt;

  @override
  String toString() {
    return 'User(id: $id, email: $email, displayName: $displayName, supabaseId: $supabaseId, isAnonymous: $isAnonymous, createdAt: $createdAt, updatedAt: $updatedAt, isDirty: $isDirty, syncVersion: $syncVersion, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.supabaseId, supabaseId) ||
                other.supabaseId == supabaseId) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty) &&
            (identical(other.syncVersion, syncVersion) ||
                other.syncVersion == syncVersion) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      displayName,
      supabaseId,
      isAnonymous,
      createdAt,
      updatedAt,
      isDirty,
      syncVersion,
      lastSyncedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);
}

abstract class _User extends User {
  const factory _User(
      {required final String id,
      final String? email,
      final String? displayName,
      final String? supabaseId,
      final bool isAnonymous,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isDirty,
      final int syncVersion,
      final DateTime? lastSyncedAt}) = _$UserImpl;
  const _User._() : super._();

  @override
  String get id;
  @override
  String? get email;
  @override
  String? get displayName;
  @override
  String? get supabaseId;
  @override
  bool get isAnonymous;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get isDirty;
  @override
  int get syncVersion;
  @override
  DateTime? get lastSyncedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
