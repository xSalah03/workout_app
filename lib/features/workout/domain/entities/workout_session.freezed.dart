// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkoutSession {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get workoutPlanId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;
  double? get totalVolume => throw _privateConstructorUsedError;
  int? get totalSets => throw _privateConstructorUsedError;
  int? get totalReps => throw _privateConstructorUsedError;
  WorkoutStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;
  int get syncVersion => throw _privateConstructorUsedError;
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;
  String? get remoteId => throw _privateConstructorUsedError;
  List<SessionExercise> get exercises => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutSessionCopyWith<WorkoutSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionCopyWith<$Res> {
  factory $WorkoutSessionCopyWith(
          WorkoutSession value, $Res Function(WorkoutSession) then) =
      _$WorkoutSessionCopyWithImpl<$Res, WorkoutSession>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String? workoutPlanId,
      String name,
      String? notes,
      DateTime startedAt,
      DateTime? completedAt,
      int? durationSeconds,
      double? totalVolume,
      int? totalSets,
      int? totalReps,
      WorkoutStatus status,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      DateTime? lastSyncedAt,
      String? remoteId,
      List<SessionExercise> exercises});
}

/// @nodoc
class _$WorkoutSessionCopyWithImpl<$Res, $Val extends WorkoutSession>
    implements $WorkoutSessionCopyWith<$Res> {
  _$WorkoutSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? workoutPlanId = freezed,
    Object? name = null,
    Object? notes = freezed,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? durationSeconds = freezed,
    Object? totalVolume = freezed,
    Object? totalSets = freezed,
    Object? totalReps = freezed,
    Object? status = null,
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
      workoutPlanId: freezed == workoutPlanId
          ? _value.workoutPlanId
          : workoutPlanId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVolume: freezed == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSets: freezed == totalSets
          ? _value.totalSets
          : totalSets // ignore: cast_nullable_to_non_nullable
              as int?,
      totalReps: freezed == totalReps
          ? _value.totalReps
          : totalReps // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkoutStatus,
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
              as List<SessionExercise>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutSessionImplCopyWith<$Res>
    implements $WorkoutSessionCopyWith<$Res> {
  factory _$$WorkoutSessionImplCopyWith(_$WorkoutSessionImpl value,
          $Res Function(_$WorkoutSessionImpl) then) =
      __$$WorkoutSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String? workoutPlanId,
      String name,
      String? notes,
      DateTime startedAt,
      DateTime? completedAt,
      int? durationSeconds,
      double? totalVolume,
      int? totalSets,
      int? totalReps,
      WorkoutStatus status,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      DateTime? lastSyncedAt,
      String? remoteId,
      List<SessionExercise> exercises});
}

/// @nodoc
class __$$WorkoutSessionImplCopyWithImpl<$Res>
    extends _$WorkoutSessionCopyWithImpl<$Res, _$WorkoutSessionImpl>
    implements _$$WorkoutSessionImplCopyWith<$Res> {
  __$$WorkoutSessionImplCopyWithImpl(
      _$WorkoutSessionImpl _value, $Res Function(_$WorkoutSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? workoutPlanId = freezed,
    Object? name = null,
    Object? notes = freezed,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? durationSeconds = freezed,
    Object? totalVolume = freezed,
    Object? totalSets = freezed,
    Object? totalReps = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? lastSyncedAt = freezed,
    Object? remoteId = freezed,
    Object? exercises = null,
  }) {
    return _then(_$WorkoutSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      workoutPlanId: freezed == workoutPlanId
          ? _value.workoutPlanId
          : workoutPlanId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVolume: freezed == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSets: freezed == totalSets
          ? _value.totalSets
          : totalSets // ignore: cast_nullable_to_non_nullable
              as int?,
      totalReps: freezed == totalReps
          ? _value.totalReps
          : totalReps // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkoutStatus,
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
              as List<SessionExercise>,
    ));
  }
}

/// @nodoc

class _$WorkoutSessionImpl extends _WorkoutSession {
  const _$WorkoutSessionImpl(
      {required this.id,
      required this.userId,
      this.workoutPlanId,
      required this.name,
      this.notes,
      required this.startedAt,
      this.completedAt,
      this.durationSeconds,
      this.totalVolume,
      this.totalSets,
      this.totalReps,
      this.status = WorkoutStatus.inProgress,
      required this.createdAt,
      required this.updatedAt,
      this.isDirty = false,
      this.syncVersion = 0,
      this.lastSyncedAt,
      this.remoteId,
      final List<SessionExercise> exercises = const []})
      : _exercises = exercises,
        super._();

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? workoutPlanId;
  @override
  final String name;
  @override
  final String? notes;
  @override
  final DateTime startedAt;
  @override
  final DateTime? completedAt;
  @override
  final int? durationSeconds;
  @override
  final double? totalVolume;
  @override
  final int? totalSets;
  @override
  final int? totalReps;
  @override
  @JsonKey()
  final WorkoutStatus status;
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
  final List<SessionExercise> _exercises;
  @override
  @JsonKey()
  List<SessionExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WorkoutSession(id: $id, userId: $userId, workoutPlanId: $workoutPlanId, name: $name, notes: $notes, startedAt: $startedAt, completedAt: $completedAt, durationSeconds: $durationSeconds, totalVolume: $totalVolume, totalSets: $totalSets, totalReps: $totalReps, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, isDirty: $isDirty, syncVersion: $syncVersion, lastSyncedAt: $lastSyncedAt, remoteId: $remoteId, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.workoutPlanId, workoutPlanId) ||
                other.workoutPlanId == workoutPlanId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.totalVolume, totalVolume) ||
                other.totalVolume == totalVolume) &&
            (identical(other.totalSets, totalSets) ||
                other.totalSets == totalSets) &&
            (identical(other.totalReps, totalReps) ||
                other.totalReps == totalReps) &&
            (identical(other.status, status) || other.status == status) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        workoutPlanId,
        name,
        notes,
        startedAt,
        completedAt,
        durationSeconds,
        totalVolume,
        totalSets,
        totalReps,
        status,
        createdAt,
        updatedAt,
        isDirty,
        syncVersion,
        lastSyncedAt,
        remoteId,
        const DeepCollectionEquality().hash(_exercises)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionImplCopyWith<_$WorkoutSessionImpl> get copyWith =>
      __$$WorkoutSessionImplCopyWithImpl<_$WorkoutSessionImpl>(
          this, _$identity);
}

abstract class _WorkoutSession extends WorkoutSession {
  const factory _WorkoutSession(
      {required final String id,
      required final String userId,
      final String? workoutPlanId,
      required final String name,
      final String? notes,
      required final DateTime startedAt,
      final DateTime? completedAt,
      final int? durationSeconds,
      final double? totalVolume,
      final int? totalSets,
      final int? totalReps,
      final WorkoutStatus status,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isDirty,
      final int syncVersion,
      final DateTime? lastSyncedAt,
      final String? remoteId,
      final List<SessionExercise> exercises}) = _$WorkoutSessionImpl;
  const _WorkoutSession._() : super._();

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get workoutPlanId;
  @override
  String get name;
  @override
  String? get notes;
  @override
  DateTime get startedAt;
  @override
  DateTime? get completedAt;
  @override
  int? get durationSeconds;
  @override
  double? get totalVolume;
  @override
  int? get totalSets;
  @override
  int? get totalReps;
  @override
  WorkoutStatus get status;
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
  List<SessionExercise> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutSessionImplCopyWith<_$WorkoutSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionExercise {
  String get id => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  String get exerciseId => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;
  int get syncVersion => throw _privateConstructorUsedError;
  String? get remoteId => throw _privateConstructorUsedError; // Joined data
  String? get exerciseName => throw _privateConstructorUsedError;
  MuscleGroup? get muscleGroup => throw _privateConstructorUsedError;
  EquipmentType? get equipment => throw _privateConstructorUsedError;
  List<ExerciseSet> get sets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionExerciseCopyWith<SessionExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionExerciseCopyWith<$Res> {
  factory $SessionExerciseCopyWith(
          SessionExercise value, $Res Function(SessionExercise) then) =
      _$SessionExerciseCopyWithImpl<$Res, SessionExercise>;
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String exerciseId,
      int sortOrder,
      String? notes,
      DateTime? startedAt,
      DateTime? completedAt,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      String? remoteId,
      String? exerciseName,
      MuscleGroup? muscleGroup,
      EquipmentType? equipment,
      List<ExerciseSet> sets});
}

/// @nodoc
class _$SessionExerciseCopyWithImpl<$Res, $Val extends SessionExercise>
    implements $SessionExerciseCopyWith<$Res> {
  _$SessionExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? exerciseId = null,
    Object? sortOrder = null,
    Object? notes = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? remoteId = freezed,
    Object? exerciseName = freezed,
    Object? muscleGroup = freezed,
    Object? equipment = freezed,
    Object? sets = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<ExerciseSet>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionExerciseImplCopyWith<$Res>
    implements $SessionExerciseCopyWith<$Res> {
  factory _$$SessionExerciseImplCopyWith(_$SessionExerciseImpl value,
          $Res Function(_$SessionExerciseImpl) then) =
      __$$SessionExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String exerciseId,
      int sortOrder,
      String? notes,
      DateTime? startedAt,
      DateTime? completedAt,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      String? remoteId,
      String? exerciseName,
      MuscleGroup? muscleGroup,
      EquipmentType? equipment,
      List<ExerciseSet> sets});
}

/// @nodoc
class __$$SessionExerciseImplCopyWithImpl<$Res>
    extends _$SessionExerciseCopyWithImpl<$Res, _$SessionExerciseImpl>
    implements _$$SessionExerciseImplCopyWith<$Res> {
  __$$SessionExerciseImplCopyWithImpl(
      _$SessionExerciseImpl _value, $Res Function(_$SessionExerciseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? exerciseId = null,
    Object? sortOrder = null,
    Object? notes = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? remoteId = freezed,
    Object? exerciseName = freezed,
    Object? muscleGroup = freezed,
    Object? equipment = freezed,
    Object? sets = null,
  }) {
    return _then(_$SessionExerciseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<ExerciseSet>,
    ));
  }
}

/// @nodoc

class _$SessionExerciseImpl extends _SessionExercise {
  const _$SessionExerciseImpl(
      {required this.id,
      required this.sessionId,
      required this.exerciseId,
      this.sortOrder = 0,
      this.notes,
      this.startedAt,
      this.completedAt,
      required this.createdAt,
      required this.updatedAt,
      this.isDirty = false,
      this.syncVersion = 0,
      this.remoteId,
      this.exerciseName,
      this.muscleGroup,
      this.equipment,
      final List<ExerciseSet> sets = const []})
      : _sets = sets,
        super._();

  @override
  final String id;
  @override
  final String sessionId;
  @override
  final String exerciseId;
  @override
  @JsonKey()
  final int sortOrder;
  @override
  final String? notes;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
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
  final List<ExerciseSet> _sets;
  @override
  @JsonKey()
  List<ExerciseSet> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  String toString() {
    return 'SessionExercise(id: $id, sessionId: $sessionId, exerciseId: $exerciseId, sortOrder: $sortOrder, notes: $notes, startedAt: $startedAt, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt, isDirty: $isDirty, syncVersion: $syncVersion, remoteId: $remoteId, exerciseName: $exerciseName, muscleGroup: $muscleGroup, equipment: $equipment, sets: $sets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
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
                other.equipment == equipment) &&
            const DeepCollectionEquality().equals(other._sets, _sets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionId,
      exerciseId,
      sortOrder,
      notes,
      startedAt,
      completedAt,
      createdAt,
      updatedAt,
      isDirty,
      syncVersion,
      remoteId,
      exerciseName,
      muscleGroup,
      equipment,
      const DeepCollectionEquality().hash(_sets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionExerciseImplCopyWith<_$SessionExerciseImpl> get copyWith =>
      __$$SessionExerciseImplCopyWithImpl<_$SessionExerciseImpl>(
          this, _$identity);
}

abstract class _SessionExercise extends SessionExercise {
  const factory _SessionExercise(
      {required final String id,
      required final String sessionId,
      required final String exerciseId,
      final int sortOrder,
      final String? notes,
      final DateTime? startedAt,
      final DateTime? completedAt,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isDirty,
      final int syncVersion,
      final String? remoteId,
      final String? exerciseName,
      final MuscleGroup? muscleGroup,
      final EquipmentType? equipment,
      final List<ExerciseSet> sets}) = _$SessionExerciseImpl;
  const _SessionExercise._() : super._();

  @override
  String get id;
  @override
  String get sessionId;
  @override
  String get exerciseId;
  @override
  int get sortOrder;
  @override
  String? get notes;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
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
  List<ExerciseSet> get sets;
  @override
  @JsonKey(ignore: true)
  _$$SessionExerciseImplCopyWith<_$SessionExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExerciseSet {
  String get id => throw _privateConstructorUsedError;
  String get sessionExerciseId => throw _privateConstructorUsedError;
  int get setNumber => throw _privateConstructorUsedError;
  int? get reps => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  int? get restSeconds => throw _privateConstructorUsedError;
  SetType get setType => throw _privateConstructorUsedError;
  double? get rpe => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;
  int get syncVersion => throw _privateConstructorUsedError;
  String? get remoteId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseSetCopyWith<ExerciseSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseSetCopyWith<$Res> {
  factory $ExerciseSetCopyWith(
          ExerciseSet value, $Res Function(ExerciseSet) then) =
      _$ExerciseSetCopyWithImpl<$Res, ExerciseSet>;
  @useResult
  $Res call(
      {String id,
      String sessionExerciseId,
      int setNumber,
      int? reps,
      double? weight,
      int? durationSeconds,
      double? distance,
      int? restSeconds,
      SetType setType,
      double? rpe,
      bool isCompleted,
      String? notes,
      DateTime? completedAt,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      String? remoteId});
}

/// @nodoc
class _$ExerciseSetCopyWithImpl<$Res, $Val extends ExerciseSet>
    implements $ExerciseSetCopyWith<$Res> {
  _$ExerciseSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionExerciseId = null,
    Object? setNumber = null,
    Object? reps = freezed,
    Object? weight = freezed,
    Object? durationSeconds = freezed,
    Object? distance = freezed,
    Object? restSeconds = freezed,
    Object? setType = null,
    Object? rpe = freezed,
    Object? isCompleted = null,
    Object? notes = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? remoteId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionExerciseId: null == sessionExerciseId
          ? _value.sessionExerciseId
          : sessionExerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      setNumber: null == setNumber
          ? _value.setNumber
          : setNumber // ignore: cast_nullable_to_non_nullable
              as int,
      reps: freezed == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      restSeconds: freezed == restSeconds
          ? _value.restSeconds
          : restSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      setType: null == setType
          ? _value.setType
          : setType // ignore: cast_nullable_to_non_nullable
              as SetType,
      rpe: freezed == rpe
          ? _value.rpe
          : rpe // ignore: cast_nullable_to_non_nullable
              as double?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseSetImplCopyWith<$Res>
    implements $ExerciseSetCopyWith<$Res> {
  factory _$$ExerciseSetImplCopyWith(
          _$ExerciseSetImpl value, $Res Function(_$ExerciseSetImpl) then) =
      __$$ExerciseSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionExerciseId,
      int setNumber,
      int? reps,
      double? weight,
      int? durationSeconds,
      double? distance,
      int? restSeconds,
      SetType setType,
      double? rpe,
      bool isCompleted,
      String? notes,
      DateTime? completedAt,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDirty,
      int syncVersion,
      String? remoteId});
}

/// @nodoc
class __$$ExerciseSetImplCopyWithImpl<$Res>
    extends _$ExerciseSetCopyWithImpl<$Res, _$ExerciseSetImpl>
    implements _$$ExerciseSetImplCopyWith<$Res> {
  __$$ExerciseSetImplCopyWithImpl(
      _$ExerciseSetImpl _value, $Res Function(_$ExerciseSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionExerciseId = null,
    Object? setNumber = null,
    Object? reps = freezed,
    Object? weight = freezed,
    Object? durationSeconds = freezed,
    Object? distance = freezed,
    Object? restSeconds = freezed,
    Object? setType = null,
    Object? rpe = freezed,
    Object? isCompleted = null,
    Object? notes = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? remoteId = freezed,
  }) {
    return _then(_$ExerciseSetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionExerciseId: null == sessionExerciseId
          ? _value.sessionExerciseId
          : sessionExerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      setNumber: null == setNumber
          ? _value.setNumber
          : setNumber // ignore: cast_nullable_to_non_nullable
              as int,
      reps: freezed == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      restSeconds: freezed == restSeconds
          ? _value.restSeconds
          : restSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      setType: null == setType
          ? _value.setType
          : setType // ignore: cast_nullable_to_non_nullable
              as SetType,
      rpe: freezed == rpe
          ? _value.rpe
          : rpe // ignore: cast_nullable_to_non_nullable
              as double?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
    ));
  }
}

/// @nodoc

class _$ExerciseSetImpl extends _ExerciseSet {
  const _$ExerciseSetImpl(
      {required this.id,
      required this.sessionExerciseId,
      required this.setNumber,
      this.reps,
      this.weight,
      this.durationSeconds,
      this.distance,
      this.restSeconds,
      this.setType = SetType.working,
      this.rpe,
      this.isCompleted = false,
      this.notes,
      this.completedAt,
      required this.createdAt,
      required this.updatedAt,
      this.isDirty = false,
      this.syncVersion = 0,
      this.remoteId})
      : super._();

  @override
  final String id;
  @override
  final String sessionExerciseId;
  @override
  final int setNumber;
  @override
  final int? reps;
  @override
  final double? weight;
  @override
  final int? durationSeconds;
  @override
  final double? distance;
  @override
  final int? restSeconds;
  @override
  @JsonKey()
  final SetType setType;
  @override
  final double? rpe;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final String? notes;
  @override
  final DateTime? completedAt;
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

  @override
  String toString() {
    return 'ExerciseSet(id: $id, sessionExerciseId: $sessionExerciseId, setNumber: $setNumber, reps: $reps, weight: $weight, durationSeconds: $durationSeconds, distance: $distance, restSeconds: $restSeconds, setType: $setType, rpe: $rpe, isCompleted: $isCompleted, notes: $notes, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt, isDirty: $isDirty, syncVersion: $syncVersion, remoteId: $remoteId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseSetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionExerciseId, sessionExerciseId) ||
                other.sessionExerciseId == sessionExerciseId) &&
            (identical(other.setNumber, setNumber) ||
                other.setNumber == setNumber) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.restSeconds, restSeconds) ||
                other.restSeconds == restSeconds) &&
            (identical(other.setType, setType) || other.setType == setType) &&
            (identical(other.rpe, rpe) || other.rpe == rpe) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty) &&
            (identical(other.syncVersion, syncVersion) ||
                other.syncVersion == syncVersion) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionExerciseId,
      setNumber,
      reps,
      weight,
      durationSeconds,
      distance,
      restSeconds,
      setType,
      rpe,
      isCompleted,
      notes,
      completedAt,
      createdAt,
      updatedAt,
      isDirty,
      syncVersion,
      remoteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseSetImplCopyWith<_$ExerciseSetImpl> get copyWith =>
      __$$ExerciseSetImplCopyWithImpl<_$ExerciseSetImpl>(this, _$identity);
}

abstract class _ExerciseSet extends ExerciseSet {
  const factory _ExerciseSet(
      {required final String id,
      required final String sessionExerciseId,
      required final int setNumber,
      final int? reps,
      final double? weight,
      final int? durationSeconds,
      final double? distance,
      final int? restSeconds,
      final SetType setType,
      final double? rpe,
      final bool isCompleted,
      final String? notes,
      final DateTime? completedAt,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isDirty,
      final int syncVersion,
      final String? remoteId}) = _$ExerciseSetImpl;
  const _ExerciseSet._() : super._();

  @override
  String get id;
  @override
  String get sessionExerciseId;
  @override
  int get setNumber;
  @override
  int? get reps;
  @override
  double? get weight;
  @override
  int? get durationSeconds;
  @override
  double? get distance;
  @override
  int? get restSeconds;
  @override
  SetType get setType;
  @override
  double? get rpe;
  @override
  bool get isCompleted;
  @override
  String? get notes;
  @override
  DateTime? get completedAt;
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
  @override
  @JsonKey(ignore: true)
  _$$ExerciseSetImplCopyWith<_$ExerciseSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
