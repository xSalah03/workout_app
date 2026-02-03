// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkoutPlan {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<MuscleGroup> get targetMuscleGroups =>
      throw _privateConstructorUsedError;
  int? get estimatedDurationMinutes => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;
  int get syncVersion => throw _privateConstructorUsedError;
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;
  String? get remoteId => throw _privateConstructorUsedError;
  List<WorkoutPlanExercise> get exercises => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutPlanCopyWith<WorkoutPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutPlanCopyWith<$Res> {
  factory $WorkoutPlanCopyWith(
          WorkoutPlan value, $Res Function(WorkoutPlan) then) =
      _$WorkoutPlanCopyWithImpl<$Res, WorkoutPlan>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String? description,
      List<MuscleGroup> targetMuscleGroups,
      int? estimatedDurationMinutes,
      int sortOrder,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      DateTime? lastSyncedAt,
      String? remoteId,
      List<WorkoutPlanExercise> exercises});
}

/// @nodoc
class _$WorkoutPlanCopyWithImpl<$Res, $Val extends WorkoutPlan>
    implements $WorkoutPlanCopyWith<$Res> {
  _$WorkoutPlanCopyWithImpl(this._value, this._then);

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
    Object? targetMuscleGroups = null,
    Object? estimatedDurationMinutes = freezed,
    Object? sortOrder = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? lastSyncedAt = freezed,
    Object? remoteId = freezed,
    Object? exercises = null,
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
      targetMuscleGroups: null == targetMuscleGroups
          ? _value.targetMuscleGroups
          : targetMuscleGroups // ignore: cast_nullable_to_non_nullable
              as List<MuscleGroup>,
      estimatedDurationMinutes: freezed == estimatedDurationMinutes
          ? _value.estimatedDurationMinutes
          : estimatedDurationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
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
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WorkoutPlanExercise>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutPlanImplCopyWith<$Res>
    implements $WorkoutPlanCopyWith<$Res> {
  factory _$$WorkoutPlanImplCopyWith(
          _$WorkoutPlanImpl value, $Res Function(_$WorkoutPlanImpl) then) =
      __$$WorkoutPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String? description,
      List<MuscleGroup> targetMuscleGroups,
      int? estimatedDurationMinutes,
      int sortOrder,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      DateTime? lastSyncedAt,
      String? remoteId,
      List<WorkoutPlanExercise> exercises});
}

/// @nodoc
class __$$WorkoutPlanImplCopyWithImpl<$Res>
    extends _$WorkoutPlanCopyWithImpl<$Res, _$WorkoutPlanImpl>
    implements _$$WorkoutPlanImplCopyWith<$Res> {
  __$$WorkoutPlanImplCopyWithImpl(
      _$WorkoutPlanImpl _value, $Res Function(_$WorkoutPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? description = freezed,
    Object? targetMuscleGroups = null,
    Object? estimatedDurationMinutes = freezed,
    Object? sortOrder = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? lastSyncedAt = freezed,
    Object? remoteId = freezed,
    Object? exercises = null,
  }) {
    return _then(_$WorkoutPlanImpl(
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
      targetMuscleGroups: null == targetMuscleGroups
          ? _value._targetMuscleGroups
          : targetMuscleGroups // ignore: cast_nullable_to_non_nullable
              as List<MuscleGroup>,
      estimatedDurationMinutes: freezed == estimatedDurationMinutes
          ? _value.estimatedDurationMinutes
          : estimatedDurationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
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
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WorkoutPlanExercise>,
    ));
  }
}

/// @nodoc

class _$WorkoutPlanImpl extends _WorkoutPlan {
  const _$WorkoutPlanImpl(
      {required this.id,
      required this.userId,
      required this.name,
      this.description,
      final List<MuscleGroup> targetMuscleGroups = const [],
      this.estimatedDurationMinutes,
      this.sortOrder = 0,
      this.isActive = true,
      required this.createdAt,
      required this.updatedAt,
      this.isDirty = false,
      this.syncVersion = 0,
      this.lastSyncedAt,
      this.remoteId,
      final List<WorkoutPlanExercise> exercises = const []})
      : _targetMuscleGroups = targetMuscleGroups,
        _exercises = exercises,
        super._();

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String? description;
  final List<MuscleGroup> _targetMuscleGroups;
  @override
  @JsonKey()
  List<MuscleGroup> get targetMuscleGroups {
    if (_targetMuscleGroups is EqualUnmodifiableListView)
      return _targetMuscleGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetMuscleGroups);
  }

  @override
  final int? estimatedDurationMinutes;
  @override
  @JsonKey()
  final int sortOrder;
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
  final List<WorkoutPlanExercise> _exercises;
  @override
  @JsonKey()
  List<WorkoutPlanExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WorkoutPlan(id: $id, userId: $userId, name: $name, description: $description, targetMuscleGroups: $targetMuscleGroups, estimatedDurationMinutes: $estimatedDurationMinutes, sortOrder: $sortOrder, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, isDirty: $isDirty, syncVersion: $syncVersion, lastSyncedAt: $lastSyncedAt, remoteId: $remoteId, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._targetMuscleGroups, _targetMuscleGroups) &&
            (identical(
                    other.estimatedDurationMinutes, estimatedDurationMinutes) ||
                other.estimatedDurationMinutes == estimatedDurationMinutes) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
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
                other.remoteId == remoteId) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      description,
      const DeepCollectionEquality().hash(_targetMuscleGroups),
      estimatedDurationMinutes,
      sortOrder,
      isActive,
      createdAt,
      updatedAt,
      isDirty,
      syncVersion,
      lastSyncedAt,
      remoteId,
      const DeepCollectionEquality().hash(_exercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutPlanImplCopyWith<_$WorkoutPlanImpl> get copyWith =>
      __$$WorkoutPlanImplCopyWithImpl<_$WorkoutPlanImpl>(this, _$identity);
}

abstract class _WorkoutPlan extends WorkoutPlan {
  const factory _WorkoutPlan(
      {required final String id,
      required final String userId,
      required final String name,
      final String? description,
      final List<MuscleGroup> targetMuscleGroups,
      final int? estimatedDurationMinutes,
      final int sortOrder,
      final bool isActive,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isDirty,
      final int syncVersion,
      final DateTime? lastSyncedAt,
      final String? remoteId,
      final List<WorkoutPlanExercise> exercises}) = _$WorkoutPlanImpl;
  const _WorkoutPlan._() : super._();

  @override
  String get id;
  @override
  String get userId;
  @override
  String get name;
  @override
  String? get description;
  @override
  List<MuscleGroup> get targetMuscleGroups;
  @override
  int? get estimatedDurationMinutes;
  @override
  int get sortOrder;
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
  List<WorkoutPlanExercise> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutPlanImplCopyWith<_$WorkoutPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WorkoutPlanExercise {
  String get id => throw _privateConstructorUsedError;
  String get workoutPlanId => throw _privateConstructorUsedError;
  String get exerciseId => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  int get targetSets => throw _privateConstructorUsedError;
  int? get targetReps => throw _privateConstructorUsedError;
  double? get targetWeight => throw _privateConstructorUsedError;
  int get restSeconds => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;
  int get syncVersion => throw _privateConstructorUsedError;
  String? get remoteId => throw _privateConstructorUsedError; // Joined data
  String? get exerciseName => throw _privateConstructorUsedError;
  MuscleGroup? get muscleGroup => throw _privateConstructorUsedError;
  EquipmentType? get equipment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutPlanExerciseCopyWith<WorkoutPlanExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutPlanExerciseCopyWith<$Res> {
  factory $WorkoutPlanExerciseCopyWith(
          WorkoutPlanExercise value, $Res Function(WorkoutPlanExercise) then) =
      _$WorkoutPlanExerciseCopyWithImpl<$Res, WorkoutPlanExercise>;
  @useResult
  $Res call(
      {String id,
      String workoutPlanId,
      String exerciseId,
      int sortOrder,
      int targetSets,
      int? targetReps,
      double? targetWeight,
      int restSeconds,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      String? remoteId,
      String? exerciseName,
      MuscleGroup? muscleGroup,
      EquipmentType? equipment});
}

/// @nodoc
class _$WorkoutPlanExerciseCopyWithImpl<$Res, $Val extends WorkoutPlanExercise>
    implements $WorkoutPlanExerciseCopyWith<$Res> {
  _$WorkoutPlanExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workoutPlanId = null,
    Object? exerciseId = null,
    Object? sortOrder = null,
    Object? targetSets = null,
    Object? targetReps = freezed,
    Object? targetWeight = freezed,
    Object? restSeconds = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? remoteId = freezed,
    Object? exerciseName = freezed,
    Object? muscleGroup = freezed,
    Object? equipment = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workoutPlanId: null == workoutPlanId
          ? _value.workoutPlanId
          : workoutPlanId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      targetSets: null == targetSets
          ? _value.targetSets
          : targetSets // ignore: cast_nullable_to_non_nullable
              as int,
      targetReps: freezed == targetReps
          ? _value.targetReps
          : targetReps // ignore: cast_nullable_to_non_nullable
              as int?,
      targetWeight: freezed == targetWeight
          ? _value.targetWeight
          : targetWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      restSeconds: null == restSeconds
          ? _value.restSeconds
          : restSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      exerciseName: freezed == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String?,
      muscleGroup: freezed == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as MuscleGroup?,
      equipment: freezed == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutPlanExerciseImplCopyWith<$Res>
    implements $WorkoutPlanExerciseCopyWith<$Res> {
  factory _$$WorkoutPlanExerciseImplCopyWith(_$WorkoutPlanExerciseImpl value,
          $Res Function(_$WorkoutPlanExerciseImpl) then) =
      __$$WorkoutPlanExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String workoutPlanId,
      String exerciseId,
      int sortOrder,
      int targetSets,
      int? targetReps,
      double? targetWeight,
      int restSeconds,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      String? remoteId,
      String? exerciseName,
      MuscleGroup? muscleGroup,
      EquipmentType? equipment});
}

/// @nodoc
class __$$WorkoutPlanExerciseImplCopyWithImpl<$Res>
    extends _$WorkoutPlanExerciseCopyWithImpl<$Res, _$WorkoutPlanExerciseImpl>
    implements _$$WorkoutPlanExerciseImplCopyWith<$Res> {
  __$$WorkoutPlanExerciseImplCopyWithImpl(_$WorkoutPlanExerciseImpl _value,
      $Res Function(_$WorkoutPlanExerciseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workoutPlanId = null,
    Object? exerciseId = null,
    Object? sortOrder = null,
    Object? targetSets = null,
    Object? targetReps = freezed,
    Object? targetWeight = freezed,
    Object? restSeconds = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? remoteId = freezed,
    Object? exerciseName = freezed,
    Object? muscleGroup = freezed,
    Object? equipment = freezed,
  }) {
    return _then(_$WorkoutPlanExerciseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workoutPlanId: null == workoutPlanId
          ? _value.workoutPlanId
          : workoutPlanId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      targetSets: null == targetSets
          ? _value.targetSets
          : targetSets // ignore: cast_nullable_to_non_nullable
              as int,
      targetReps: freezed == targetReps
          ? _value.targetReps
          : targetReps // ignore: cast_nullable_to_non_nullable
              as int?,
      targetWeight: freezed == targetWeight
          ? _value.targetWeight
          : targetWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      restSeconds: null == restSeconds
          ? _value.restSeconds
          : restSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      exerciseName: freezed == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String?,
      muscleGroup: freezed == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as MuscleGroup?,
      equipment: freezed == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentType?,
    ));
  }
}

/// @nodoc

class _$WorkoutPlanExerciseImpl extends _WorkoutPlanExercise {
  const _$WorkoutPlanExerciseImpl(
      {required this.id,
      required this.workoutPlanId,
      required this.exerciseId,
      this.sortOrder = 0,
      this.targetSets = 3,
      this.targetReps,
      this.targetWeight,
      this.restSeconds = 90,
      this.notes,
      required this.createdAt,
      required this.updatedAt,
      this.isDirty = false,
      this.syncVersion = 0,
      this.remoteId,
      this.exerciseName,
      this.muscleGroup,
      this.equipment})
      : super._();

  @override
  final String id;
  @override
  final String workoutPlanId;
  @override
  final String exerciseId;
  @override
  @JsonKey()
  final int sortOrder;
  @override
  @JsonKey()
  final int targetSets;
  @override
  final int? targetReps;
  @override
  final double? targetWeight;
  @override
  @JsonKey()
  final int restSeconds;
  @override
  final String? notes;
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
  final String? remoteId;
// Joined data
  @override
  final String? exerciseName;
  @override
  final MuscleGroup? muscleGroup;
  @override
  final EquipmentType? equipment;

  @override
  String toString() {
    return 'WorkoutPlanExercise(id: $id, workoutPlanId: $workoutPlanId, exerciseId: $exerciseId, sortOrder: $sortOrder, targetSets: $targetSets, targetReps: $targetReps, targetWeight: $targetWeight, restSeconds: $restSeconds, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, isDirty: $isDirty, syncVersion: $syncVersion, remoteId: $remoteId, exerciseName: $exerciseName, muscleGroup: $muscleGroup, equipment: $equipment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutPlanExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workoutPlanId, workoutPlanId) ||
                other.workoutPlanId == workoutPlanId) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.targetSets, targetSets) ||
                other.targetSets == targetSets) &&
            (identical(other.targetReps, targetReps) ||
                other.targetReps == targetReps) &&
            (identical(other.targetWeight, targetWeight) ||
                other.targetWeight == targetWeight) &&
            (identical(other.restSeconds, restSeconds) ||
                other.restSeconds == restSeconds) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty) &&
            (identical(other.syncVersion, syncVersion) ||
                other.syncVersion == syncVersion) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.muscleGroup, muscleGroup) ||
                other.muscleGroup == muscleGroup) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      workoutPlanId,
      exerciseId,
      sortOrder,
      targetSets,
      targetReps,
      targetWeight,
      restSeconds,
      notes,
      createdAt,
      updatedAt,
      isDirty,
      syncVersion,
      remoteId,
      exerciseName,
      muscleGroup,
      equipment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutPlanExerciseImplCopyWith<_$WorkoutPlanExerciseImpl> get copyWith =>
      __$$WorkoutPlanExerciseImplCopyWithImpl<_$WorkoutPlanExerciseImpl>(
          this, _$identity);
}

abstract class _WorkoutPlanExercise extends WorkoutPlanExercise {
  const factory _WorkoutPlanExercise(
      {required final String id,
      required final String workoutPlanId,
      required final String exerciseId,
      final int sortOrder,
      final int targetSets,
      final int? targetReps,
      final double? targetWeight,
      final int restSeconds,
      final String? notes,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isDirty,
      final int syncVersion,
      final String? remoteId,
      final String? exerciseName,
      final MuscleGroup? muscleGroup,
      final EquipmentType? equipment}) = _$WorkoutPlanExerciseImpl;
  const _WorkoutPlanExercise._() : super._();

  @override
  String get id;
  @override
  String get workoutPlanId;
  @override
  String get exerciseId;
  @override
  int get sortOrder;
  @override
  int get targetSets;
  @override
  int? get targetReps;
  @override
  double? get targetWeight;
  @override
  int get restSeconds;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get isDirty;
  @override
  int get syncVersion;
  @override
  String? get remoteId;
  @override // Joined data
  String? get exerciseName;
  @override
  MuscleGroup? get muscleGroup;
  @override
  EquipmentType? get equipment;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutPlanExerciseImplCopyWith<_$WorkoutPlanExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
