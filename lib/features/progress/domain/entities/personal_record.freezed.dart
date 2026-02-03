// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PersonalRecord {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get exerciseId => throw _privateConstructorUsedError;
  RecordType get recordType => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  int? get reps =>
      throw _privateConstructorUsedError; // For weight PRs, the rep count
  String? get setId => throw _privateConstructorUsedError;
  DateTime get achievedAt => throw _privateConstructorUsedError;
  bool get isCurrentRecord => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;
  int get syncVersion => throw _privateConstructorUsedError;
  String? get remoteId => throw _privateConstructorUsedError; // Joined data
  String? get exerciseName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonalRecordCopyWith<PersonalRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalRecordCopyWith<$Res> {
  factory $PersonalRecordCopyWith(
          PersonalRecord value, $Res Function(PersonalRecord) then) =
      _$PersonalRecordCopyWithImpl<$Res, PersonalRecord>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String exerciseId,
      RecordType recordType,
      double value,
      int? reps,
      String? setId,
      DateTime achievedAt,
      bool isCurrentRecord,
      DateTime createdAt,
      bool isDirty,
      int syncVersion,
      String? remoteId,
      String? exerciseName});
}

/// @nodoc
class _$PersonalRecordCopyWithImpl<$Res, $Val extends PersonalRecord>
    implements $PersonalRecordCopyWith<$Res> {
  _$PersonalRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? exerciseId = null,
    Object? recordType = null,
    Object? value = null,
    Object? reps = freezed,
    Object? setId = freezed,
    Object? achievedAt = null,
    Object? isCurrentRecord = null,
    Object? createdAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? remoteId = freezed,
    Object? exerciseName = freezed,
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
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      recordType: null == recordType
          ? _value.recordType
          : recordType // ignore: cast_nullable_to_non_nullable
              as RecordType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      reps: freezed == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int?,
      setId: freezed == setId
          ? _value.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String?,
      achievedAt: null == achievedAt
          ? _value.achievedAt
          : achievedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCurrentRecord: null == isCurrentRecord
          ? _value.isCurrentRecord
          : isCurrentRecord // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalRecordImplCopyWith<$Res>
    implements $PersonalRecordCopyWith<$Res> {
  factory _$$PersonalRecordImplCopyWith(_$PersonalRecordImpl value,
          $Res Function(_$PersonalRecordImpl) then) =
      __$$PersonalRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String exerciseId,
      RecordType recordType,
      double value,
      int? reps,
      String? setId,
      DateTime achievedAt,
      bool isCurrentRecord,
      DateTime createdAt,
      bool isDirty,
      int syncVersion,
      String? remoteId,
      String? exerciseName});
}

/// @nodoc
class __$$PersonalRecordImplCopyWithImpl<$Res>
    extends _$PersonalRecordCopyWithImpl<$Res, _$PersonalRecordImpl>
    implements _$$PersonalRecordImplCopyWith<$Res> {
  __$$PersonalRecordImplCopyWithImpl(
      _$PersonalRecordImpl _value, $Res Function(_$PersonalRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? exerciseId = null,
    Object? recordType = null,
    Object? value = null,
    Object? reps = freezed,
    Object? setId = freezed,
    Object? achievedAt = null,
    Object? isCurrentRecord = null,
    Object? createdAt = null,
    Object? isDirty = null,
    Object? syncVersion = null,
    Object? remoteId = freezed,
    Object? exerciseName = freezed,
  }) {
    return _then(_$PersonalRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      recordType: null == recordType
          ? _value.recordType
          : recordType // ignore: cast_nullable_to_non_nullable
              as RecordType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      reps: freezed == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int?,
      setId: freezed == setId
          ? _value.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String?,
      achievedAt: null == achievedAt
          ? _value.achievedAt
          : achievedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCurrentRecord: null == isCurrentRecord
          ? _value.isCurrentRecord
          : isCurrentRecord // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

class _$PersonalRecordImpl extends _PersonalRecord {
  const _$PersonalRecordImpl(
      {required this.id,
      required this.userId,
      required this.exerciseId,
      required this.recordType,
      required this.value,
      this.reps,
      this.setId,
      required this.achievedAt,
      this.isCurrentRecord = true,
      required this.createdAt,
      this.isDirty = false,
      this.syncVersion = 0,
      this.remoteId,
      this.exerciseName})
      : super._();

  @override
  final String id;
  @override
  final String userId;
  @override
  final String exerciseId;
  @override
  final RecordType recordType;
  @override
  final double value;
  @override
  final int? reps;
// For weight PRs, the rep count
  @override
  final String? setId;
  @override
  final DateTime achievedAt;
  @override
  @JsonKey()
  final bool isCurrentRecord;
  @override
  final DateTime createdAt;
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
  String toString() {
    return 'PersonalRecord(id: $id, userId: $userId, exerciseId: $exerciseId, recordType: $recordType, value: $value, reps: $reps, setId: $setId, achievedAt: $achievedAt, isCurrentRecord: $isCurrentRecord, createdAt: $createdAt, isDirty: $isDirty, syncVersion: $syncVersion, remoteId: $remoteId, exerciseName: $exerciseName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.recordType, recordType) ||
                other.recordType == recordType) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.achievedAt, achievedAt) ||
                other.achievedAt == achievedAt) &&
            (identical(other.isCurrentRecord, isCurrentRecord) ||
                other.isCurrentRecord == isCurrentRecord) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty) &&
            (identical(other.syncVersion, syncVersion) ||
                other.syncVersion == syncVersion) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      exerciseId,
      recordType,
      value,
      reps,
      setId,
      achievedAt,
      isCurrentRecord,
      createdAt,
      isDirty,
      syncVersion,
      remoteId,
      exerciseName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalRecordImplCopyWith<_$PersonalRecordImpl> get copyWith =>
      __$$PersonalRecordImplCopyWithImpl<_$PersonalRecordImpl>(
          this, _$identity);
}

abstract class _PersonalRecord extends PersonalRecord {
  const factory _PersonalRecord(
      {required final String id,
      required final String userId,
      required final String exerciseId,
      required final RecordType recordType,
      required final double value,
      final int? reps,
      final String? setId,
      required final DateTime achievedAt,
      final bool isCurrentRecord,
      required final DateTime createdAt,
      final bool isDirty,
      final int syncVersion,
      final String? remoteId,
      final String? exerciseName}) = _$PersonalRecordImpl;
  const _PersonalRecord._() : super._();

  @override
  String get id;
  @override
  String get userId;
  @override
  String get exerciseId;
  @override
  RecordType get recordType;
  @override
  double get value;
  @override
  int? get reps;
  @override // For weight PRs, the rep count
  String? get setId;
  @override
  DateTime get achievedAt;
  @override
  bool get isCurrentRecord;
  @override
  DateTime get createdAt;
  @override
  bool get isDirty;
  @override
  int get syncVersion;
  @override
  String? get remoteId;
  @override // Joined data
  String? get exerciseName;
  @override
  @JsonKey(ignore: true)
  _$$PersonalRecordImplCopyWith<_$PersonalRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExerciseStats {
  String get exerciseId => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  int? get totalSets => throw _privateConstructorUsedError;
  int? get totalReps => throw _privateConstructorUsedError;
  double? get totalVolume => throw _privateConstructorUsedError;
  double? get maxWeight => throw _privateConstructorUsedError;
  int? get maxReps => throw _privateConstructorUsedError;
  double? get estimated1RM => throw _privateConstructorUsedError;
  int? get workoutCount => throw _privateConstructorUsedError;
  DateTime? get lastPerformed => throw _privateConstructorUsedError;
  List<PersonalRecord>? get personalRecords =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseStatsCopyWith<ExerciseStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseStatsCopyWith<$Res> {
  factory $ExerciseStatsCopyWith(
          ExerciseStats value, $Res Function(ExerciseStats) then) =
      _$ExerciseStatsCopyWithImpl<$Res, ExerciseStats>;
  @useResult
  $Res call(
      {String exerciseId,
      String exerciseName,
      int? totalSets,
      int? totalReps,
      double? totalVolume,
      double? maxWeight,
      int? maxReps,
      double? estimated1RM,
      int? workoutCount,
      DateTime? lastPerformed,
      List<PersonalRecord>? personalRecords});
}

/// @nodoc
class _$ExerciseStatsCopyWithImpl<$Res, $Val extends ExerciseStats>
    implements $ExerciseStatsCopyWith<$Res> {
  _$ExerciseStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? totalSets = freezed,
    Object? totalReps = freezed,
    Object? totalVolume = freezed,
    Object? maxWeight = freezed,
    Object? maxReps = freezed,
    Object? estimated1RM = freezed,
    Object? workoutCount = freezed,
    Object? lastPerformed = freezed,
    Object? personalRecords = freezed,
  }) {
    return _then(_value.copyWith(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      totalSets: freezed == totalSets
          ? _value.totalSets
          : totalSets // ignore: cast_nullable_to_non_nullable
              as int?,
      totalReps: freezed == totalReps
          ? _value.totalReps
          : totalReps // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVolume: freezed == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as double?,
      maxWeight: freezed == maxWeight
          ? _value.maxWeight
          : maxWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      maxReps: freezed == maxReps
          ? _value.maxReps
          : maxReps // ignore: cast_nullable_to_non_nullable
              as int?,
      estimated1RM: freezed == estimated1RM
          ? _value.estimated1RM
          : estimated1RM // ignore: cast_nullable_to_non_nullable
              as double?,
      workoutCount: freezed == workoutCount
          ? _value.workoutCount
          : workoutCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPerformed: freezed == lastPerformed
          ? _value.lastPerformed
          : lastPerformed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      personalRecords: freezed == personalRecords
          ? _value.personalRecords
          : personalRecords // ignore: cast_nullable_to_non_nullable
              as List<PersonalRecord>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseStatsImplCopyWith<$Res>
    implements $ExerciseStatsCopyWith<$Res> {
  factory _$$ExerciseStatsImplCopyWith(
          _$ExerciseStatsImpl value, $Res Function(_$ExerciseStatsImpl) then) =
      __$$ExerciseStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String exerciseId,
      String exerciseName,
      int? totalSets,
      int? totalReps,
      double? totalVolume,
      double? maxWeight,
      int? maxReps,
      double? estimated1RM,
      int? workoutCount,
      DateTime? lastPerformed,
      List<PersonalRecord>? personalRecords});
}

/// @nodoc
class __$$ExerciseStatsImplCopyWithImpl<$Res>
    extends _$ExerciseStatsCopyWithImpl<$Res, _$ExerciseStatsImpl>
    implements _$$ExerciseStatsImplCopyWith<$Res> {
  __$$ExerciseStatsImplCopyWithImpl(
      _$ExerciseStatsImpl _value, $Res Function(_$ExerciseStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? totalSets = freezed,
    Object? totalReps = freezed,
    Object? totalVolume = freezed,
    Object? maxWeight = freezed,
    Object? maxReps = freezed,
    Object? estimated1RM = freezed,
    Object? workoutCount = freezed,
    Object? lastPerformed = freezed,
    Object? personalRecords = freezed,
  }) {
    return _then(_$ExerciseStatsImpl(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      totalSets: freezed == totalSets
          ? _value.totalSets
          : totalSets // ignore: cast_nullable_to_non_nullable
              as int?,
      totalReps: freezed == totalReps
          ? _value.totalReps
          : totalReps // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVolume: freezed == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as double?,
      maxWeight: freezed == maxWeight
          ? _value.maxWeight
          : maxWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      maxReps: freezed == maxReps
          ? _value.maxReps
          : maxReps // ignore: cast_nullable_to_non_nullable
              as int?,
      estimated1RM: freezed == estimated1RM
          ? _value.estimated1RM
          : estimated1RM // ignore: cast_nullable_to_non_nullable
              as double?,
      workoutCount: freezed == workoutCount
          ? _value.workoutCount
          : workoutCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPerformed: freezed == lastPerformed
          ? _value.lastPerformed
          : lastPerformed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      personalRecords: freezed == personalRecords
          ? _value._personalRecords
          : personalRecords // ignore: cast_nullable_to_non_nullable
              as List<PersonalRecord>?,
    ));
  }
}

/// @nodoc

class _$ExerciseStatsImpl implements _ExerciseStats {
  const _$ExerciseStatsImpl(
      {required this.exerciseId,
      required this.exerciseName,
      this.totalSets,
      this.totalReps,
      this.totalVolume,
      this.maxWeight,
      this.maxReps,
      this.estimated1RM,
      this.workoutCount,
      this.lastPerformed,
      final List<PersonalRecord>? personalRecords})
      : _personalRecords = personalRecords;

  @override
  final String exerciseId;
  @override
  final String exerciseName;
  @override
  final int? totalSets;
  @override
  final int? totalReps;
  @override
  final double? totalVolume;
  @override
  final double? maxWeight;
  @override
  final int? maxReps;
  @override
  final double? estimated1RM;
  @override
  final int? workoutCount;
  @override
  final DateTime? lastPerformed;
  final List<PersonalRecord>? _personalRecords;
  @override
  List<PersonalRecord>? get personalRecords {
    final value = _personalRecords;
    if (value == null) return null;
    if (_personalRecords is EqualUnmodifiableListView) return _personalRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExerciseStats(exerciseId: $exerciseId, exerciseName: $exerciseName, totalSets: $totalSets, totalReps: $totalReps, totalVolume: $totalVolume, maxWeight: $maxWeight, maxReps: $maxReps, estimated1RM: $estimated1RM, workoutCount: $workoutCount, lastPerformed: $lastPerformed, personalRecords: $personalRecords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseStatsImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.totalSets, totalSets) ||
                other.totalSets == totalSets) &&
            (identical(other.totalReps, totalReps) ||
                other.totalReps == totalReps) &&
            (identical(other.totalVolume, totalVolume) ||
                other.totalVolume == totalVolume) &&
            (identical(other.maxWeight, maxWeight) ||
                other.maxWeight == maxWeight) &&
            (identical(other.maxReps, maxReps) || other.maxReps == maxReps) &&
            (identical(other.estimated1RM, estimated1RM) ||
                other.estimated1RM == estimated1RM) &&
            (identical(other.workoutCount, workoutCount) ||
                other.workoutCount == workoutCount) &&
            (identical(other.lastPerformed, lastPerformed) ||
                other.lastPerformed == lastPerformed) &&
            const DeepCollectionEquality()
                .equals(other._personalRecords, _personalRecords));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      exerciseId,
      exerciseName,
      totalSets,
      totalReps,
      totalVolume,
      maxWeight,
      maxReps,
      estimated1RM,
      workoutCount,
      lastPerformed,
      const DeepCollectionEquality().hash(_personalRecords));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseStatsImplCopyWith<_$ExerciseStatsImpl> get copyWith =>
      __$$ExerciseStatsImplCopyWithImpl<_$ExerciseStatsImpl>(this, _$identity);
}

abstract class _ExerciseStats implements ExerciseStats {
  const factory _ExerciseStats(
      {required final String exerciseId,
      required final String exerciseName,
      final int? totalSets,
      final int? totalReps,
      final double? totalVolume,
      final double? maxWeight,
      final int? maxReps,
      final double? estimated1RM,
      final int? workoutCount,
      final DateTime? lastPerformed,
      final List<PersonalRecord>? personalRecords}) = _$ExerciseStatsImpl;

  @override
  String get exerciseId;
  @override
  String get exerciseName;
  @override
  int? get totalSets;
  @override
  int? get totalReps;
  @override
  double? get totalVolume;
  @override
  double? get maxWeight;
  @override
  int? get maxReps;
  @override
  double? get estimated1RM;
  @override
  int? get workoutCount;
  @override
  DateTime? get lastPerformed;
  @override
  List<PersonalRecord>? get personalRecords;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseStatsImplCopyWith<_$ExerciseStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProgressStats {
  DateTime get periodStart => throw _privateConstructorUsedError;
  DateTime get periodEnd => throw _privateConstructorUsedError;
  int get workoutCount => throw _privateConstructorUsedError;
  int get totalSets => throw _privateConstructorUsedError;
  int get totalReps => throw _privateConstructorUsedError;
  double get totalVolume => throw _privateConstructorUsedError;
  int get totalDurationSeconds => throw _privateConstructorUsedError;
  Map<String, int> get muscleGroupVolume =>
      throw _privateConstructorUsedError; // MuscleGroup -> volume
  List<PersonalRecord> get newPRs => throw _privateConstructorUsedError;
  double? get volumeChange =>
      throw _privateConstructorUsedError; // Percentage change from previous period
  int? get workoutCountChange => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgressStatsCopyWith<ProgressStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressStatsCopyWith<$Res> {
  factory $ProgressStatsCopyWith(
          ProgressStats value, $Res Function(ProgressStats) then) =
      _$ProgressStatsCopyWithImpl<$Res, ProgressStats>;
  @useResult
  $Res call(
      {DateTime periodStart,
      DateTime periodEnd,
      int workoutCount,
      int totalSets,
      int totalReps,
      double totalVolume,
      int totalDurationSeconds,
      Map<String, int> muscleGroupVolume,
      List<PersonalRecord> newPRs,
      double? volumeChange,
      int? workoutCountChange});
}

/// @nodoc
class _$ProgressStatsCopyWithImpl<$Res, $Val extends ProgressStats>
    implements $ProgressStatsCopyWith<$Res> {
  _$ProgressStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? workoutCount = null,
    Object? totalSets = null,
    Object? totalReps = null,
    Object? totalVolume = null,
    Object? totalDurationSeconds = null,
    Object? muscleGroupVolume = null,
    Object? newPRs = null,
    Object? volumeChange = freezed,
    Object? workoutCountChange = freezed,
  }) {
    return _then(_value.copyWith(
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workoutCount: null == workoutCount
          ? _value.workoutCount
          : workoutCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSets: null == totalSets
          ? _value.totalSets
          : totalSets // ignore: cast_nullable_to_non_nullable
              as int,
      totalReps: null == totalReps
          ? _value.totalReps
          : totalReps // ignore: cast_nullable_to_non_nullable
              as int,
      totalVolume: null == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as double,
      totalDurationSeconds: null == totalDurationSeconds
          ? _value.totalDurationSeconds
          : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      muscleGroupVolume: null == muscleGroupVolume
          ? _value.muscleGroupVolume
          : muscleGroupVolume // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      newPRs: null == newPRs
          ? _value.newPRs
          : newPRs // ignore: cast_nullable_to_non_nullable
              as List<PersonalRecord>,
      volumeChange: freezed == volumeChange
          ? _value.volumeChange
          : volumeChange // ignore: cast_nullable_to_non_nullable
              as double?,
      workoutCountChange: freezed == workoutCountChange
          ? _value.workoutCountChange
          : workoutCountChange // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressStatsImplCopyWith<$Res>
    implements $ProgressStatsCopyWith<$Res> {
  factory _$$ProgressStatsImplCopyWith(
          _$ProgressStatsImpl value, $Res Function(_$ProgressStatsImpl) then) =
      __$$ProgressStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime periodStart,
      DateTime periodEnd,
      int workoutCount,
      int totalSets,
      int totalReps,
      double totalVolume,
      int totalDurationSeconds,
      Map<String, int> muscleGroupVolume,
      List<PersonalRecord> newPRs,
      double? volumeChange,
      int? workoutCountChange});
}

/// @nodoc
class __$$ProgressStatsImplCopyWithImpl<$Res>
    extends _$ProgressStatsCopyWithImpl<$Res, _$ProgressStatsImpl>
    implements _$$ProgressStatsImplCopyWith<$Res> {
  __$$ProgressStatsImplCopyWithImpl(
      _$ProgressStatsImpl _value, $Res Function(_$ProgressStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? workoutCount = null,
    Object? totalSets = null,
    Object? totalReps = null,
    Object? totalVolume = null,
    Object? totalDurationSeconds = null,
    Object? muscleGroupVolume = null,
    Object? newPRs = null,
    Object? volumeChange = freezed,
    Object? workoutCountChange = freezed,
  }) {
    return _then(_$ProgressStatsImpl(
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workoutCount: null == workoutCount
          ? _value.workoutCount
          : workoutCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSets: null == totalSets
          ? _value.totalSets
          : totalSets // ignore: cast_nullable_to_non_nullable
              as int,
      totalReps: null == totalReps
          ? _value.totalReps
          : totalReps // ignore: cast_nullable_to_non_nullable
              as int,
      totalVolume: null == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as double,
      totalDurationSeconds: null == totalDurationSeconds
          ? _value.totalDurationSeconds
          : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      muscleGroupVolume: null == muscleGroupVolume
          ? _value._muscleGroupVolume
          : muscleGroupVolume // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      newPRs: null == newPRs
          ? _value._newPRs
          : newPRs // ignore: cast_nullable_to_non_nullable
              as List<PersonalRecord>,
      volumeChange: freezed == volumeChange
          ? _value.volumeChange
          : volumeChange // ignore: cast_nullable_to_non_nullable
              as double?,
      workoutCountChange: freezed == workoutCountChange
          ? _value.workoutCountChange
          : workoutCountChange // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ProgressStatsImpl extends _ProgressStats {
  const _$ProgressStatsImpl(
      {required this.periodStart,
      required this.periodEnd,
      this.workoutCount = 0,
      this.totalSets = 0,
      this.totalReps = 0,
      this.totalVolume = 0.0,
      this.totalDurationSeconds = 0,
      final Map<String, int> muscleGroupVolume = const {},
      final List<PersonalRecord> newPRs = const [],
      this.volumeChange,
      this.workoutCountChange})
      : _muscleGroupVolume = muscleGroupVolume,
        _newPRs = newPRs,
        super._();

  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;
  @override
  @JsonKey()
  final int workoutCount;
  @override
  @JsonKey()
  final int totalSets;
  @override
  @JsonKey()
  final int totalReps;
  @override
  @JsonKey()
  final double totalVolume;
  @override
  @JsonKey()
  final int totalDurationSeconds;
  final Map<String, int> _muscleGroupVolume;
  @override
  @JsonKey()
  Map<String, int> get muscleGroupVolume {
    if (_muscleGroupVolume is EqualUnmodifiableMapView)
      return _muscleGroupVolume;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_muscleGroupVolume);
  }

// MuscleGroup -> volume
  final List<PersonalRecord> _newPRs;
// MuscleGroup -> volume
  @override
  @JsonKey()
  List<PersonalRecord> get newPRs {
    if (_newPRs is EqualUnmodifiableListView) return _newPRs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newPRs);
  }

  @override
  final double? volumeChange;
// Percentage change from previous period
  @override
  final int? workoutCountChange;

  @override
  String toString() {
    return 'ProgressStats(periodStart: $periodStart, periodEnd: $periodEnd, workoutCount: $workoutCount, totalSets: $totalSets, totalReps: $totalReps, totalVolume: $totalVolume, totalDurationSeconds: $totalDurationSeconds, muscleGroupVolume: $muscleGroupVolume, newPRs: $newPRs, volumeChange: $volumeChange, workoutCountChange: $workoutCountChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressStatsImpl &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.workoutCount, workoutCount) ||
                other.workoutCount == workoutCount) &&
            (identical(other.totalSets, totalSets) ||
                other.totalSets == totalSets) &&
            (identical(other.totalReps, totalReps) ||
                other.totalReps == totalReps) &&
            (identical(other.totalVolume, totalVolume) ||
                other.totalVolume == totalVolume) &&
            (identical(other.totalDurationSeconds, totalDurationSeconds) ||
                other.totalDurationSeconds == totalDurationSeconds) &&
            const DeepCollectionEquality()
                .equals(other._muscleGroupVolume, _muscleGroupVolume) &&
            const DeepCollectionEquality().equals(other._newPRs, _newPRs) &&
            (identical(other.volumeChange, volumeChange) ||
                other.volumeChange == volumeChange) &&
            (identical(other.workoutCountChange, workoutCountChange) ||
                other.workoutCountChange == workoutCountChange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      periodStart,
      periodEnd,
      workoutCount,
      totalSets,
      totalReps,
      totalVolume,
      totalDurationSeconds,
      const DeepCollectionEquality().hash(_muscleGroupVolume),
      const DeepCollectionEquality().hash(_newPRs),
      volumeChange,
      workoutCountChange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressStatsImplCopyWith<_$ProgressStatsImpl> get copyWith =>
      __$$ProgressStatsImplCopyWithImpl<_$ProgressStatsImpl>(this, _$identity);
}

abstract class _ProgressStats extends ProgressStats {
  const factory _ProgressStats(
      {required final DateTime periodStart,
      required final DateTime periodEnd,
      final int workoutCount,
      final int totalSets,
      final int totalReps,
      final double totalVolume,
      final int totalDurationSeconds,
      final Map<String, int> muscleGroupVolume,
      final List<PersonalRecord> newPRs,
      final double? volumeChange,
      final int? workoutCountChange}) = _$ProgressStatsImpl;
  const _ProgressStats._() : super._();

  @override
  DateTime get periodStart;
  @override
  DateTime get periodEnd;
  @override
  int get workoutCount;
  @override
  int get totalSets;
  @override
  int get totalReps;
  @override
  double get totalVolume;
  @override
  int get totalDurationSeconds;
  @override
  Map<String, int> get muscleGroupVolume;
  @override // MuscleGroup -> volume
  List<PersonalRecord> get newPRs;
  @override
  double? get volumeChange;
  @override // Percentage change from previous period
  int? get workoutCountChange;
  @override
  @JsonKey(ignore: true)
  _$$ProgressStatsImplCopyWith<_$ProgressStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
