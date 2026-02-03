// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Exercise {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  MuscleGroup get muscleGroup => throw _privateConstructorUsedError;
  List<MuscleGroup> get secondaryMuscles => throw _privateConstructorUsedError;
  EquipmentType get equipment => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isCustom => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;
  int get syncVersion => throw _privateConstructorUsedError;
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;
  String? get remoteId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res, Exercise>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String? description,
      MuscleGroup muscleGroup,
      List<MuscleGroup> secondaryMuscles,
      EquipmentType equipment,
      String? instructions,
      String? imageUrl,
      bool isCustom,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      DateTime? lastSyncedAt,
      String? remoteId});
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res, $Val extends Exercise>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? description = freezed,
    Object? muscleGroup = null,
    Object? secondaryMuscles = null,
    Object? equipment = null,
    Object? instructions = freezed,
    Object? imageUrl = freezed,
    Object? isCustom = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? lastSyncedAt = freezed,
    Object? remoteId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      muscleGroup: null == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as MuscleGroup,
      secondaryMuscles: null == secondaryMuscles
          ? _value.secondaryMuscles
          : secondaryMuscles // ignore: cast_nullable_to_non_nullable
              as List<MuscleGroup>,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentType,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
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
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseImplCopyWith<$Res>
    implements $ExerciseCopyWith<$Res> {
  factory _$$ExerciseImplCopyWith(
          _$ExerciseImpl value, $Res Function(_$ExerciseImpl) then) =
      __$$ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String? description,
      MuscleGroup muscleGroup,
      List<MuscleGroup> secondaryMuscles,
      EquipmentType equipment,
      String? instructions,
      String? imageUrl,
      bool isCustom,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      DateTime? lastSyncedAt,
      String? remoteId});
}

/// @nodoc
class __$$ExerciseImplCopyWithImpl<$Res>
    extends _$ExerciseCopyWithImpl<$Res, _$ExerciseImpl>
    implements _$$ExerciseImplCopyWith<$Res> {
  __$$ExerciseImplCopyWithImpl(
      _$ExerciseImpl _value, $Res Function(_$ExerciseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? description = freezed,
    Object? muscleGroup = null,
    Object? secondaryMuscles = null,
    Object? equipment = null,
    Object? instructions = freezed,
    Object? imageUrl = freezed,
    Object? isCustom = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? lastSyncedAt = freezed,
    Object? remoteId = freezed,
  }) {
    return _then(_$ExerciseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      muscleGroup: null == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as MuscleGroup,
      secondaryMuscles: null == secondaryMuscles
          ? _value._secondaryMuscles
          : secondaryMuscles // ignore: cast_nullable_to_non_nullable
              as List<MuscleGroup>,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentType,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
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
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ExerciseImpl extends _Exercise {
  const _$ExerciseImpl(
      {required this.id,
      required this.userId,
      required this.name,
      this.description,
      required this.muscleGroup,
      final List<MuscleGroup> secondaryMuscles = const [],
      required this.equipment,
      this.instructions,
      this.imageUrl,
      this.isCustom = true,
      this.isActive = true,
      required this.createdAt,
      required this.updatedAt,
      this.isDirty = false,
      this.syncVersion = 0,
      this.lastSyncedAt,
      this.remoteId})
      : _secondaryMuscles = secondaryMuscles,
        super._();

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final MuscleGroup muscleGroup;
  final List<MuscleGroup> _secondaryMuscles;
  @override
  @JsonKey()
  List<MuscleGroup> get secondaryMuscles {
    if (_secondaryMuscles is EqualUnmodifiableListView)
      return _secondaryMuscles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondaryMuscles);
  }

  @override
  final EquipmentType equipment;
  @override
  final String? instructions;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final bool isCustom;
  @override
  @JsonKey()
  final bool isActive;
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
  final String? remoteId;

  @override
  String toString() {
    return 'Exercise(id: $id, userId: $userId, name: $name, description: $description, muscleGroup: $muscleGroup, secondaryMuscles: $secondaryMuscles, equipment: $equipment, instructions: $instructions, imageUrl: $imageUrl, isCustom: $isCustom, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, isDirty: $isDirty, syncVersion: $syncVersion, lastSyncedAt: $lastSyncedAt, remoteId: $remoteId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.muscleGroup, muscleGroup) ||
                other.muscleGroup == muscleGroup) &&
            const DeepCollectionEquality()
                .equals(other._secondaryMuscles, _secondaryMuscles) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty) &&
            (identical(other.syncVersion, syncVersion) ||
                other.syncVersion == syncVersion) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      description,
      muscleGroup,
      const DeepCollectionEquality().hash(_secondaryMuscles),
      equipment,
      instructions,
      imageUrl,
      isCustom,
      isActive,
      createdAt,
      updatedAt,
      isDirty,
      syncVersion,
      lastSyncedAt,
      remoteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      __$$ExerciseImplCopyWithImpl<_$ExerciseImpl>(this, _$identity);
}

abstract class _Exercise extends Exercise {
  const factory _Exercise(
      {required final String id,
      required final String userId,
      required final String name,
      final String? description,
      required final MuscleGroup muscleGroup,
      final List<MuscleGroup> secondaryMuscles,
      required final EquipmentType equipment,
      final String? instructions,
      final String? imageUrl,
      final bool isCustom,
      final bool isActive,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isDirty,
      final int syncVersion,
      final DateTime? lastSyncedAt,
      final String? remoteId}) = _$ExerciseImpl;
  const _Exercise._() : super._();

  @override
  String get id;
  @override
  String get userId;
  @override
  String get name;
  @override
  String? get description;
  @override
  MuscleGroup get muscleGroup;
  @override
  List<MuscleGroup> get secondaryMuscles;
  @override
  EquipmentType get equipment;
  @override
  String? get instructions;
  @override
  String? get imageUrl;
  @override
  bool get isCustom;
  @override
  bool get isActive;
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
  String? get remoteId;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
