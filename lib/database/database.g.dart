// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, UserEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _supabaseIdMeta =
      const VerificationMeta('supabaseId');
  @override
  late final GeneratedColumn<String> supabaseId = GeneratedColumn<String>(
      'supabase_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isAnonymousMeta =
      const VerificationMeta('isAnonymous');
  @override
  late final GeneratedColumn<bool> isAnonymous = GeneratedColumn<bool>(
      'is_anonymous', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_anonymous" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncVersionMeta =
      const VerificationMeta('syncVersion');
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
      'sync_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        email,
        displayName,
        supabaseId,
        isAnonymous,
        createdAt,
        updatedAt,
        isDirty,
        syncVersion,
        lastSyncedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    }
    if (data.containsKey('supabase_id')) {
      context.handle(
          _supabaseIdMeta,
          supabaseId.isAcceptableOrUnknown(
              data['supabase_id']!, _supabaseIdMeta));
    }
    if (data.containsKey('is_anonymous')) {
      context.handle(
          _isAnonymousMeta,
          isAnonymous.isAcceptableOrUnknown(
              data['is_anonymous']!, _isAnonymousMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('sync_version')) {
      context.handle(
          _syncVersionMeta,
          syncVersion.isAcceptableOrUnknown(
              data['sync_version']!, _syncVersionMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name']),
      supabaseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supabase_id']),
      isAnonymous: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_anonymous'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      syncVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_version'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserEntity extends DataClass implements Insertable<UserEntity> {
  final String id;
  final String? email;
  final String? displayName;
  final String? supabaseId;
  final bool isAnonymous;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDirty;
  final int syncVersion;
  final DateTime? lastSyncedAt;
  const UserEntity(
      {required this.id,
      this.email,
      this.displayName,
      this.supabaseId,
      required this.isAnonymous,
      required this.createdAt,
      required this.updatedAt,
      required this.isDirty,
      required this.syncVersion,
      this.lastSyncedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || supabaseId != null) {
      map['supabase_id'] = Variable<String>(supabaseId);
    }
    map['is_anonymous'] = Variable<bool>(isAnonymous);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['sync_version'] = Variable<int>(syncVersion);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      supabaseId: supabaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(supabaseId),
      isAnonymous: Value(isAnonymous),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDirty: Value(isDirty),
      syncVersion: Value(syncVersion),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntity(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String?>(json['email']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      supabaseId: serializer.fromJson<String?>(json['supabaseId']),
      isAnonymous: serializer.fromJson<bool>(json['isAnonymous']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String?>(email),
      'displayName': serializer.toJson<String?>(displayName),
      'supabaseId': serializer.toJson<String?>(supabaseId),
      'isAnonymous': serializer.toJson<bool>(isAnonymous),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDirty': serializer.toJson<bool>(isDirty),
      'syncVersion': serializer.toJson<int>(syncVersion),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
    };
  }

  UserEntity copyWith(
          {String? id,
          Value<String?> email = const Value.absent(),
          Value<String?> displayName = const Value.absent(),
          Value<String?> supabaseId = const Value.absent(),
          bool? isAnonymous,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDirty,
          int? syncVersion,
          Value<DateTime?> lastSyncedAt = const Value.absent()}) =>
      UserEntity(
        id: id ?? this.id,
        email: email.present ? email.value : this.email,
        displayName: displayName.present ? displayName.value : this.displayName,
        supabaseId: supabaseId.present ? supabaseId.value : this.supabaseId,
        isAnonymous: isAnonymous ?? this.isAnonymous,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDirty: isDirty ?? this.isDirty,
        syncVersion: syncVersion ?? this.syncVersion,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
      );
  UserEntity copyWithCompanion(UsersCompanion data) {
    return UserEntity(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      supabaseId:
          data.supabaseId.present ? data.supabaseId.value : this.supabaseId,
      isAnonymous:
          data.isAnonymous.present ? data.isAnonymous.value : this.isAnonymous,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      syncVersion:
          data.syncVersion.present ? data.syncVersion.value : this.syncVersion,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEntity(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('supabaseId: $supabaseId, ')
          ..write('isAnonymous: $isAnonymous, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, displayName, supabaseId,
      isAnonymous, createdAt, updatedAt, isDirty, syncVersion, lastSyncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          other.id == this.id &&
          other.email == this.email &&
          other.displayName == this.displayName &&
          other.supabaseId == this.supabaseId &&
          other.isAnonymous == this.isAnonymous &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDirty == this.isDirty &&
          other.syncVersion == this.syncVersion &&
          other.lastSyncedAt == this.lastSyncedAt);
}

class UsersCompanion extends UpdateCompanion<UserEntity> {
  final Value<String> id;
  final Value<String?> email;
  final Value<String?> displayName;
  final Value<String?> supabaseId;
  final Value<bool> isAnonymous;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDirty;
  final Value<int> syncVersion;
  final Value<DateTime?> lastSyncedAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.supabaseId = const Value.absent(),
    this.isAnonymous = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.supabaseId = const Value.absent(),
    this.isAnonymous = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<UserEntity> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<String>? displayName,
    Expression<String>? supabaseId,
    Expression<bool>? isAnonymous,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDirty,
    Expression<int>? syncVersion,
    Expression<DateTime>? lastSyncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (displayName != null) 'display_name': displayName,
      if (supabaseId != null) 'supabase_id': supabaseId,
      if (isAnonymous != null) 'is_anonymous': isAnonymous,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDirty != null) 'is_dirty': isDirty,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String?>? email,
      Value<String?>? displayName,
      Value<String?>? supabaseId,
      Value<bool>? isAnonymous,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDirty,
      Value<int>? syncVersion,
      Value<DateTime?>? lastSyncedAt,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      supabaseId: supabaseId ?? this.supabaseId,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDirty: isDirty ?? this.isDirty,
      syncVersion: syncVersion ?? this.syncVersion,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (supabaseId.present) {
      map['supabase_id'] = Variable<String>(supabaseId.value);
    }
    if (isAnonymous.present) {
      map['is_anonymous'] = Variable<bool>(isAnonymous.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('supabaseId: $supabaseId, ')
          ..write('isAnonymous: $isAnonymous, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, ExerciseEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _muscleGroupMeta =
      const VerificationMeta('muscleGroup');
  @override
  late final GeneratedColumn<String> muscleGroup = GeneratedColumn<String>(
      'muscle_group', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _secondaryMusclesMeta =
      const VerificationMeta('secondaryMuscles');
  @override
  late final GeneratedColumn<String> secondaryMuscles = GeneratedColumn<String>(
      'secondary_muscles', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _equipmentMeta =
      const VerificationMeta('equipment');
  @override
  late final GeneratedColumn<String> equipment = GeneratedColumn<String>(
      'equipment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instructionsMeta =
      const VerificationMeta('instructions');
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
      'instructions', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isCustomMeta =
      const VerificationMeta('isCustom');
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
      'is_custom', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_custom" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncVersionMeta =
      const VerificationMeta('syncVersion');
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
      'sync_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        name,
        description,
        muscleGroup,
        secondaryMuscles,
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
        remoteId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('muscle_group')) {
      context.handle(
          _muscleGroupMeta,
          muscleGroup.isAcceptableOrUnknown(
              data['muscle_group']!, _muscleGroupMeta));
    } else if (isInserting) {
      context.missing(_muscleGroupMeta);
    }
    if (data.containsKey('secondary_muscles')) {
      context.handle(
          _secondaryMusclesMeta,
          secondaryMuscles.isAcceptableOrUnknown(
              data['secondary_muscles']!, _secondaryMusclesMeta));
    }
    if (data.containsKey('equipment')) {
      context.handle(_equipmentMeta,
          equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta));
    } else if (isInserting) {
      context.missing(_equipmentMeta);
    }
    if (data.containsKey('instructions')) {
      context.handle(
          _instructionsMeta,
          instructions.isAcceptableOrUnknown(
              data['instructions']!, _instructionsMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('is_custom')) {
      context.handle(_isCustomMeta,
          isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('sync_version')) {
      context.handle(
          _syncVersionMeta,
          syncVersion.isAcceptableOrUnknown(
              data['sync_version']!, _syncVersionMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      muscleGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}muscle_group'])!,
      secondaryMuscles: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}secondary_muscles']),
      equipment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}equipment'])!,
      instructions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}instructions']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      isCustom: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_custom'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      syncVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_version'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class ExerciseEntity extends DataClass implements Insertable<ExerciseEntity> {
  final String id;
  final String userId;
  final String name;
  final String? description;
  final String muscleGroup;
  final String? secondaryMuscles;
  final String equipment;
  final String? instructions;
  final String? imageUrl;
  final bool isCustom;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDirty;
  final int syncVersion;
  final DateTime? lastSyncedAt;
  final String? remoteId;
  const ExerciseEntity(
      {required this.id,
      required this.userId,
      required this.name,
      this.description,
      required this.muscleGroup,
      this.secondaryMuscles,
      required this.equipment,
      this.instructions,
      this.imageUrl,
      required this.isCustom,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      required this.isDirty,
      required this.syncVersion,
      this.lastSyncedAt,
      this.remoteId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['muscle_group'] = Variable<String>(muscleGroup);
    if (!nullToAbsent || secondaryMuscles != null) {
      map['secondary_muscles'] = Variable<String>(secondaryMuscles);
    }
    map['equipment'] = Variable<String>(equipment);
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['is_custom'] = Variable<bool>(isCustom);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['sync_version'] = Variable<int>(syncVersion);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      muscleGroup: Value(muscleGroup),
      secondaryMuscles: secondaryMuscles == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryMuscles),
      equipment: Value(equipment),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      isCustom: Value(isCustom),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDirty: Value(isDirty),
      syncVersion: Value(syncVersion),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
    );
  }

  factory ExerciseEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      muscleGroup: serializer.fromJson<String>(json['muscleGroup']),
      secondaryMuscles: serializer.fromJson<String?>(json['secondaryMuscles']),
      equipment: serializer.fromJson<String>(json['equipment']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'muscleGroup': serializer.toJson<String>(muscleGroup),
      'secondaryMuscles': serializer.toJson<String?>(secondaryMuscles),
      'equipment': serializer.toJson<String>(equipment),
      'instructions': serializer.toJson<String?>(instructions),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'isCustom': serializer.toJson<bool>(isCustom),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDirty': serializer.toJson<bool>(isDirty),
      'syncVersion': serializer.toJson<int>(syncVersion),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  ExerciseEntity copyWith(
          {String? id,
          String? userId,
          String? name,
          Value<String?> description = const Value.absent(),
          String? muscleGroup,
          Value<String?> secondaryMuscles = const Value.absent(),
          String? equipment,
          Value<String?> instructions = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          bool? isCustom,
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDirty,
          int? syncVersion,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent()}) =>
      ExerciseEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        muscleGroup: muscleGroup ?? this.muscleGroup,
        secondaryMuscles: secondaryMuscles.present
            ? secondaryMuscles.value
            : this.secondaryMuscles,
        equipment: equipment ?? this.equipment,
        instructions:
            instructions.present ? instructions.value : this.instructions,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        isCustom: isCustom ?? this.isCustom,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDirty: isDirty ?? this.isDirty,
        syncVersion: syncVersion ?? this.syncVersion,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
      );
  ExerciseEntity copyWithCompanion(ExercisesCompanion data) {
    return ExerciseEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      muscleGroup:
          data.muscleGroup.present ? data.muscleGroup.value : this.muscleGroup,
      secondaryMuscles: data.secondaryMuscles.present
          ? data.secondaryMuscles.value
          : this.secondaryMuscles,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      syncVersion:
          data.syncVersion.present ? data.syncVersion.value : this.syncVersion,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('muscleGroup: $muscleGroup, ')
          ..write('secondaryMuscles: $secondaryMuscles, ')
          ..write('equipment: $equipment, ')
          ..write('instructions: $instructions, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isCustom: $isCustom, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      name,
      description,
      muscleGroup,
      secondaryMuscles,
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.description == this.description &&
          other.muscleGroup == this.muscleGroup &&
          other.secondaryMuscles == this.secondaryMuscles &&
          other.equipment == this.equipment &&
          other.instructions == this.instructions &&
          other.imageUrl == this.imageUrl &&
          other.isCustom == this.isCustom &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDirty == this.isDirty &&
          other.syncVersion == this.syncVersion &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId);
}

class ExercisesCompanion extends UpdateCompanion<ExerciseEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> muscleGroup;
  final Value<String?> secondaryMuscles;
  final Value<String> equipment;
  final Value<String?> instructions;
  final Value<String?> imageUrl;
  final Value<bool> isCustom;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDirty;
  final Value<int> syncVersion;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.muscleGroup = const Value.absent(),
    this.secondaryMuscles = const Value.absent(),
    this.equipment = const Value.absent(),
    this.instructions = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    required String id,
    required String userId,
    required String name,
    this.description = const Value.absent(),
    required String muscleGroup,
    this.secondaryMuscles = const Value.absent(),
    required String equipment,
    this.instructions = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        name = Value(name),
        muscleGroup = Value(muscleGroup),
        equipment = Value(equipment);
  static Insertable<ExerciseEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? muscleGroup,
    Expression<String>? secondaryMuscles,
    Expression<String>? equipment,
    Expression<String>? instructions,
    Expression<String>? imageUrl,
    Expression<bool>? isCustom,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDirty,
    Expression<int>? syncVersion,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (muscleGroup != null) 'muscle_group': muscleGroup,
      if (secondaryMuscles != null) 'secondary_muscles': secondaryMuscles,
      if (equipment != null) 'equipment': equipment,
      if (instructions != null) 'instructions': instructions,
      if (imageUrl != null) 'image_url': imageUrl,
      if (isCustom != null) 'is_custom': isCustom,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDirty != null) 'is_dirty': isDirty,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? name,
      Value<String?>? description,
      Value<String>? muscleGroup,
      Value<String?>? secondaryMuscles,
      Value<String>? equipment,
      Value<String?>? instructions,
      Value<String?>? imageUrl,
      Value<bool>? isCustom,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDirty,
      Value<int>? syncVersion,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? rowid}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description ?? this.description,
      muscleGroup: muscleGroup ?? this.muscleGroup,
      secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
      equipment: equipment ?? this.equipment,
      instructions: instructions ?? this.instructions,
      imageUrl: imageUrl ?? this.imageUrl,
      isCustom: isCustom ?? this.isCustom,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDirty: isDirty ?? this.isDirty,
      syncVersion: syncVersion ?? this.syncVersion,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (muscleGroup.present) {
      map['muscle_group'] = Variable<String>(muscleGroup.value);
    }
    if (secondaryMuscles.present) {
      map['secondary_muscles'] = Variable<String>(secondaryMuscles.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(equipment.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('muscleGroup: $muscleGroup, ')
          ..write('secondaryMuscles: $secondaryMuscles, ')
          ..write('equipment: $equipment, ')
          ..write('instructions: $instructions, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isCustom: $isCustom, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutPlansTable extends WorkoutPlans
    with TableInfo<$WorkoutPlansTable, WorkoutPlanEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _targetMuscleGroupsMeta =
      const VerificationMeta('targetMuscleGroups');
  @override
  late final GeneratedColumn<String> targetMuscleGroups =
      GeneratedColumn<String>('target_muscle_groups', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _estimatedDurationMinutesMeta =
      const VerificationMeta('estimatedDurationMinutes');
  @override
  late final GeneratedColumn<int> estimatedDurationMinutes =
      GeneratedColumn<int>('estimated_duration_minutes', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncVersionMeta =
      const VerificationMeta('syncVersion');
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
      'sync_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        name,
        description,
        targetMuscleGroups,
        estimatedDurationMinutes,
        sortOrder,
        isActive,
        createdAt,
        updatedAt,
        isDirty,
        syncVersion,
        lastSyncedAt,
        remoteId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_plans';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutPlanEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('target_muscle_groups')) {
      context.handle(
          _targetMuscleGroupsMeta,
          targetMuscleGroups.isAcceptableOrUnknown(
              data['target_muscle_groups']!, _targetMuscleGroupsMeta));
    }
    if (data.containsKey('estimated_duration_minutes')) {
      context.handle(
          _estimatedDurationMinutesMeta,
          estimatedDurationMinutes.isAcceptableOrUnknown(
              data['estimated_duration_minutes']!,
              _estimatedDurationMinutesMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('sync_version')) {
      context.handle(
          _syncVersionMeta,
          syncVersion.isAcceptableOrUnknown(
              data['sync_version']!, _syncVersionMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutPlanEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutPlanEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      targetMuscleGroups: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_muscle_groups']),
      estimatedDurationMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}estimated_duration_minutes']),
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      syncVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_version'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
    );
  }

  @override
  $WorkoutPlansTable createAlias(String alias) {
    return $WorkoutPlansTable(attachedDatabase, alias);
  }
}

class WorkoutPlanEntity extends DataClass
    implements Insertable<WorkoutPlanEntity> {
  final String id;
  final String userId;
  final String name;
  final String? description;
  final String? targetMuscleGroups;
  final int? estimatedDurationMinutes;
  final int sortOrder;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDirty;
  final int syncVersion;
  final DateTime? lastSyncedAt;
  final String? remoteId;
  const WorkoutPlanEntity(
      {required this.id,
      required this.userId,
      required this.name,
      this.description,
      this.targetMuscleGroups,
      this.estimatedDurationMinutes,
      required this.sortOrder,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      required this.isDirty,
      required this.syncVersion,
      this.lastSyncedAt,
      this.remoteId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || targetMuscleGroups != null) {
      map['target_muscle_groups'] = Variable<String>(targetMuscleGroups);
    }
    if (!nullToAbsent || estimatedDurationMinutes != null) {
      map['estimated_duration_minutes'] =
          Variable<int>(estimatedDurationMinutes);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['sync_version'] = Variable<int>(syncVersion);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  WorkoutPlansCompanion toCompanion(bool nullToAbsent) {
    return WorkoutPlansCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      targetMuscleGroups: targetMuscleGroups == null && nullToAbsent
          ? const Value.absent()
          : Value(targetMuscleGroups),
      estimatedDurationMinutes: estimatedDurationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedDurationMinutes),
      sortOrder: Value(sortOrder),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDirty: Value(isDirty),
      syncVersion: Value(syncVersion),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
    );
  }

  factory WorkoutPlanEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutPlanEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      targetMuscleGroups:
          serializer.fromJson<String?>(json['targetMuscleGroups']),
      estimatedDurationMinutes:
          serializer.fromJson<int?>(json['estimatedDurationMinutes']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'targetMuscleGroups': serializer.toJson<String?>(targetMuscleGroups),
      'estimatedDurationMinutes':
          serializer.toJson<int?>(estimatedDurationMinutes),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDirty': serializer.toJson<bool>(isDirty),
      'syncVersion': serializer.toJson<int>(syncVersion),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  WorkoutPlanEntity copyWith(
          {String? id,
          String? userId,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> targetMuscleGroups = const Value.absent(),
          Value<int?> estimatedDurationMinutes = const Value.absent(),
          int? sortOrder,
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDirty,
          int? syncVersion,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent()}) =>
      WorkoutPlanEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        targetMuscleGroups: targetMuscleGroups.present
            ? targetMuscleGroups.value
            : this.targetMuscleGroups,
        estimatedDurationMinutes: estimatedDurationMinutes.present
            ? estimatedDurationMinutes.value
            : this.estimatedDurationMinutes,
        sortOrder: sortOrder ?? this.sortOrder,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDirty: isDirty ?? this.isDirty,
        syncVersion: syncVersion ?? this.syncVersion,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
      );
  WorkoutPlanEntity copyWithCompanion(WorkoutPlansCompanion data) {
    return WorkoutPlanEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      targetMuscleGroups: data.targetMuscleGroups.present
          ? data.targetMuscleGroups.value
          : this.targetMuscleGroups,
      estimatedDurationMinutes: data.estimatedDurationMinutes.present
          ? data.estimatedDurationMinutes.value
          : this.estimatedDurationMinutes,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      syncVersion:
          data.syncVersion.present ? data.syncVersion.value : this.syncVersion,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlanEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('targetMuscleGroups: $targetMuscleGroups, ')
          ..write('estimatedDurationMinutes: $estimatedDurationMinutes, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      name,
      description,
      targetMuscleGroups,
      estimatedDurationMinutes,
      sortOrder,
      isActive,
      createdAt,
      updatedAt,
      isDirty,
      syncVersion,
      lastSyncedAt,
      remoteId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutPlanEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.description == this.description &&
          other.targetMuscleGroups == this.targetMuscleGroups &&
          other.estimatedDurationMinutes == this.estimatedDurationMinutes &&
          other.sortOrder == this.sortOrder &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDirty == this.isDirty &&
          other.syncVersion == this.syncVersion &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId);
}

class WorkoutPlansCompanion extends UpdateCompanion<WorkoutPlanEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> targetMuscleGroups;
  final Value<int?> estimatedDurationMinutes;
  final Value<int> sortOrder;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDirty;
  final Value<int> syncVersion;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> rowid;
  const WorkoutPlansCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.targetMuscleGroups = const Value.absent(),
    this.estimatedDurationMinutes = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutPlansCompanion.insert({
    required String id,
    required String userId,
    required String name,
    this.description = const Value.absent(),
    this.targetMuscleGroups = const Value.absent(),
    this.estimatedDurationMinutes = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        name = Value(name);
  static Insertable<WorkoutPlanEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? targetMuscleGroups,
    Expression<int>? estimatedDurationMinutes,
    Expression<int>? sortOrder,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDirty,
    Expression<int>? syncVersion,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (targetMuscleGroups != null)
        'target_muscle_groups': targetMuscleGroups,
      if (estimatedDurationMinutes != null)
        'estimated_duration_minutes': estimatedDurationMinutes,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDirty != null) 'is_dirty': isDirty,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutPlansCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? targetMuscleGroups,
      Value<int?>? estimatedDurationMinutes,
      Value<int>? sortOrder,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDirty,
      Value<int>? syncVersion,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? rowid}) {
    return WorkoutPlansCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description ?? this.description,
      targetMuscleGroups: targetMuscleGroups ?? this.targetMuscleGroups,
      estimatedDurationMinutes:
          estimatedDurationMinutes ?? this.estimatedDurationMinutes,
      sortOrder: sortOrder ?? this.sortOrder,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDirty: isDirty ?? this.isDirty,
      syncVersion: syncVersion ?? this.syncVersion,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (targetMuscleGroups.present) {
      map['target_muscle_groups'] = Variable<String>(targetMuscleGroups.value);
    }
    if (estimatedDurationMinutes.present) {
      map['estimated_duration_minutes'] =
          Variable<int>(estimatedDurationMinutes.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlansCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('targetMuscleGroups: $targetMuscleGroups, ')
          ..write('estimatedDurationMinutes: $estimatedDurationMinutes, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutPlanExercisesTable extends WorkoutPlanExercises
    with TableInfo<$WorkoutPlanExercisesTable, WorkoutPlanExerciseEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutPlanExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workoutPlanIdMeta =
      const VerificationMeta('workoutPlanId');
  @override
  late final GeneratedColumn<String> workoutPlanId = GeneratedColumn<String>(
      'workout_plan_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workout_plans (id)'));
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercises (id)'));
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _targetSetsMeta =
      const VerificationMeta('targetSets');
  @override
  late final GeneratedColumn<int> targetSets = GeneratedColumn<int>(
      'target_sets', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(3));
  static const VerificationMeta _targetRepsMeta =
      const VerificationMeta('targetReps');
  @override
  late final GeneratedColumn<int> targetReps = GeneratedColumn<int>(
      'target_reps', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _targetWeightMeta =
      const VerificationMeta('targetWeight');
  @override
  late final GeneratedColumn<double> targetWeight = GeneratedColumn<double>(
      'target_weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _restSecondsMeta =
      const VerificationMeta('restSeconds');
  @override
  late final GeneratedColumn<int> restSeconds = GeneratedColumn<int>(
      'rest_seconds', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(90));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncVersionMeta =
      const VerificationMeta('syncVersion');
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
      'sync_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
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
        remoteId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_plan_exercises';
  @override
  VerificationContext validateIntegrity(
      Insertable<WorkoutPlanExerciseEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('workout_plan_id')) {
      context.handle(
          _workoutPlanIdMeta,
          workoutPlanId.isAcceptableOrUnknown(
              data['workout_plan_id']!, _workoutPlanIdMeta));
    } else if (isInserting) {
      context.missing(_workoutPlanIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    if (data.containsKey('target_sets')) {
      context.handle(
          _targetSetsMeta,
          targetSets.isAcceptableOrUnknown(
              data['target_sets']!, _targetSetsMeta));
    }
    if (data.containsKey('target_reps')) {
      context.handle(
          _targetRepsMeta,
          targetReps.isAcceptableOrUnknown(
              data['target_reps']!, _targetRepsMeta));
    }
    if (data.containsKey('target_weight')) {
      context.handle(
          _targetWeightMeta,
          targetWeight.isAcceptableOrUnknown(
              data['target_weight']!, _targetWeightMeta));
    }
    if (data.containsKey('rest_seconds')) {
      context.handle(
          _restSecondsMeta,
          restSeconds.isAcceptableOrUnknown(
              data['rest_seconds']!, _restSecondsMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('sync_version')) {
      context.handle(
          _syncVersionMeta,
          syncVersion.isAcceptableOrUnknown(
              data['sync_version']!, _syncVersionMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutPlanExerciseEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutPlanExerciseEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workoutPlanId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}workout_plan_id'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_id'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      targetSets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_sets'])!,
      targetReps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_reps']),
      targetWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}target_weight']),
      restSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rest_seconds'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      syncVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_version'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
    );
  }

  @override
  $WorkoutPlanExercisesTable createAlias(String alias) {
    return $WorkoutPlanExercisesTable(attachedDatabase, alias);
  }
}

class WorkoutPlanExerciseEntity extends DataClass
    implements Insertable<WorkoutPlanExerciseEntity> {
  final String id;
  final String workoutPlanId;
  final String exerciseId;
  final int sortOrder;
  final int targetSets;
  final int? targetReps;
  final double? targetWeight;
  final int restSeconds;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDirty;
  final int syncVersion;
  final String? remoteId;
  const WorkoutPlanExerciseEntity(
      {required this.id,
      required this.workoutPlanId,
      required this.exerciseId,
      required this.sortOrder,
      required this.targetSets,
      this.targetReps,
      this.targetWeight,
      required this.restSeconds,
      this.notes,
      required this.createdAt,
      required this.updatedAt,
      required this.isDirty,
      required this.syncVersion,
      this.remoteId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['workout_plan_id'] = Variable<String>(workoutPlanId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['sort_order'] = Variable<int>(sortOrder);
    map['target_sets'] = Variable<int>(targetSets);
    if (!nullToAbsent || targetReps != null) {
      map['target_reps'] = Variable<int>(targetReps);
    }
    if (!nullToAbsent || targetWeight != null) {
      map['target_weight'] = Variable<double>(targetWeight);
    }
    map['rest_seconds'] = Variable<int>(restSeconds);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['sync_version'] = Variable<int>(syncVersion);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  WorkoutPlanExercisesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutPlanExercisesCompanion(
      id: Value(id),
      workoutPlanId: Value(workoutPlanId),
      exerciseId: Value(exerciseId),
      sortOrder: Value(sortOrder),
      targetSets: Value(targetSets),
      targetReps: targetReps == null && nullToAbsent
          ? const Value.absent()
          : Value(targetReps),
      targetWeight: targetWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(targetWeight),
      restSeconds: Value(restSeconds),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDirty: Value(isDirty),
      syncVersion: Value(syncVersion),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
    );
  }

  factory WorkoutPlanExerciseEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutPlanExerciseEntity(
      id: serializer.fromJson<String>(json['id']),
      workoutPlanId: serializer.fromJson<String>(json['workoutPlanId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      targetSets: serializer.fromJson<int>(json['targetSets']),
      targetReps: serializer.fromJson<int?>(json['targetReps']),
      targetWeight: serializer.fromJson<double?>(json['targetWeight']),
      restSeconds: serializer.fromJson<int>(json['restSeconds']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workoutPlanId': serializer.toJson<String>(workoutPlanId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'targetSets': serializer.toJson<int>(targetSets),
      'targetReps': serializer.toJson<int?>(targetReps),
      'targetWeight': serializer.toJson<double?>(targetWeight),
      'restSeconds': serializer.toJson<int>(restSeconds),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDirty': serializer.toJson<bool>(isDirty),
      'syncVersion': serializer.toJson<int>(syncVersion),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  WorkoutPlanExerciseEntity copyWith(
          {String? id,
          String? workoutPlanId,
          String? exerciseId,
          int? sortOrder,
          int? targetSets,
          Value<int?> targetReps = const Value.absent(),
          Value<double?> targetWeight = const Value.absent(),
          int? restSeconds,
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDirty,
          int? syncVersion,
          Value<String?> remoteId = const Value.absent()}) =>
      WorkoutPlanExerciseEntity(
        id: id ?? this.id,
        workoutPlanId: workoutPlanId ?? this.workoutPlanId,
        exerciseId: exerciseId ?? this.exerciseId,
        sortOrder: sortOrder ?? this.sortOrder,
        targetSets: targetSets ?? this.targetSets,
        targetReps: targetReps.present ? targetReps.value : this.targetReps,
        targetWeight:
            targetWeight.present ? targetWeight.value : this.targetWeight,
        restSeconds: restSeconds ?? this.restSeconds,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDirty: isDirty ?? this.isDirty,
        syncVersion: syncVersion ?? this.syncVersion,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
      );
  WorkoutPlanExerciseEntity copyWithCompanion(
      WorkoutPlanExercisesCompanion data) {
    return WorkoutPlanExerciseEntity(
      id: data.id.present ? data.id.value : this.id,
      workoutPlanId: data.workoutPlanId.present
          ? data.workoutPlanId.value
          : this.workoutPlanId,
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      targetSets:
          data.targetSets.present ? data.targetSets.value : this.targetSets,
      targetReps:
          data.targetReps.present ? data.targetReps.value : this.targetReps,
      targetWeight: data.targetWeight.present
          ? data.targetWeight.value
          : this.targetWeight,
      restSeconds:
          data.restSeconds.present ? data.restSeconds.value : this.restSeconds,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      syncVersion:
          data.syncVersion.present ? data.syncVersion.value : this.syncVersion,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlanExerciseEntity(')
          ..write('id: $id, ')
          ..write('workoutPlanId: $workoutPlanId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('targetSets: $targetSets, ')
          ..write('targetReps: $targetReps, ')
          ..write('targetWeight: $targetWeight, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      remoteId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutPlanExerciseEntity &&
          other.id == this.id &&
          other.workoutPlanId == this.workoutPlanId &&
          other.exerciseId == this.exerciseId &&
          other.sortOrder == this.sortOrder &&
          other.targetSets == this.targetSets &&
          other.targetReps == this.targetReps &&
          other.targetWeight == this.targetWeight &&
          other.restSeconds == this.restSeconds &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDirty == this.isDirty &&
          other.syncVersion == this.syncVersion &&
          other.remoteId == this.remoteId);
}

class WorkoutPlanExercisesCompanion
    extends UpdateCompanion<WorkoutPlanExerciseEntity> {
  final Value<String> id;
  final Value<String> workoutPlanId;
  final Value<String> exerciseId;
  final Value<int> sortOrder;
  final Value<int> targetSets;
  final Value<int?> targetReps;
  final Value<double?> targetWeight;
  final Value<int> restSeconds;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDirty;
  final Value<int> syncVersion;
  final Value<String?> remoteId;
  final Value<int> rowid;
  const WorkoutPlanExercisesCompanion({
    this.id = const Value.absent(),
    this.workoutPlanId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.targetSets = const Value.absent(),
    this.targetReps = const Value.absent(),
    this.targetWeight = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutPlanExercisesCompanion.insert({
    required String id,
    required String workoutPlanId,
    required String exerciseId,
    this.sortOrder = const Value.absent(),
    this.targetSets = const Value.absent(),
    this.targetReps = const Value.absent(),
    this.targetWeight = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        workoutPlanId = Value(workoutPlanId),
        exerciseId = Value(exerciseId);
  static Insertable<WorkoutPlanExerciseEntity> custom({
    Expression<String>? id,
    Expression<String>? workoutPlanId,
    Expression<String>? exerciseId,
    Expression<int>? sortOrder,
    Expression<int>? targetSets,
    Expression<int>? targetReps,
    Expression<double>? targetWeight,
    Expression<int>? restSeconds,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDirty,
    Expression<int>? syncVersion,
    Expression<String>? remoteId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutPlanId != null) 'workout_plan_id': workoutPlanId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (targetSets != null) 'target_sets': targetSets,
      if (targetReps != null) 'target_reps': targetReps,
      if (targetWeight != null) 'target_weight': targetWeight,
      if (restSeconds != null) 'rest_seconds': restSeconds,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDirty != null) 'is_dirty': isDirty,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (remoteId != null) 'remote_id': remoteId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutPlanExercisesCompanion copyWith(
      {Value<String>? id,
      Value<String>? workoutPlanId,
      Value<String>? exerciseId,
      Value<int>? sortOrder,
      Value<int>? targetSets,
      Value<int?>? targetReps,
      Value<double?>? targetWeight,
      Value<int>? restSeconds,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDirty,
      Value<int>? syncVersion,
      Value<String?>? remoteId,
      Value<int>? rowid}) {
    return WorkoutPlanExercisesCompanion(
      id: id ?? this.id,
      workoutPlanId: workoutPlanId ?? this.workoutPlanId,
      exerciseId: exerciseId ?? this.exerciseId,
      sortOrder: sortOrder ?? this.sortOrder,
      targetSets: targetSets ?? this.targetSets,
      targetReps: targetReps ?? this.targetReps,
      targetWeight: targetWeight ?? this.targetWeight,
      restSeconds: restSeconds ?? this.restSeconds,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDirty: isDirty ?? this.isDirty,
      syncVersion: syncVersion ?? this.syncVersion,
      remoteId: remoteId ?? this.remoteId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workoutPlanId.present) {
      map['workout_plan_id'] = Variable<String>(workoutPlanId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (targetSets.present) {
      map['target_sets'] = Variable<int>(targetSets.value);
    }
    if (targetReps.present) {
      map['target_reps'] = Variable<int>(targetReps.value);
    }
    if (targetWeight.present) {
      map['target_weight'] = Variable<double>(targetWeight.value);
    }
    if (restSeconds.present) {
      map['rest_seconds'] = Variable<int>(restSeconds.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlanExercisesCompanion(')
          ..write('id: $id, ')
          ..write('workoutPlanId: $workoutPlanId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('targetSets: $targetSets, ')
          ..write('targetReps: $targetReps, ')
          ..write('targetWeight: $targetWeight, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('remoteId: $remoteId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSessionsTable extends WorkoutSessions
    with TableInfo<$WorkoutSessionsTable, WorkoutSessionEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _workoutPlanIdMeta =
      const VerificationMeta('workoutPlanId');
  @override
  late final GeneratedColumn<String> workoutPlanId = GeneratedColumn<String>(
      'workout_plan_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workout_plans (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _durationSecondsMeta =
      const VerificationMeta('durationSeconds');
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
      'duration_seconds', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _totalVolumeMeta =
      const VerificationMeta('totalVolume');
  @override
  late final GeneratedColumn<double> totalVolume = GeneratedColumn<double>(
      'total_volume', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _totalSetsMeta =
      const VerificationMeta('totalSets');
  @override
  late final GeneratedColumn<int> totalSets = GeneratedColumn<int>(
      'total_sets', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _totalRepsMeta =
      const VerificationMeta('totalReps');
  @override
  late final GeneratedColumn<int> totalReps = GeneratedColumn<int>(
      'total_reps', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('in_progress'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncVersionMeta =
      const VerificationMeta('syncVersion');
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
      'sync_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
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
        remoteId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_sessions';
  @override
  VerificationContext validateIntegrity(
      Insertable<WorkoutSessionEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('workout_plan_id')) {
      context.handle(
          _workoutPlanIdMeta,
          workoutPlanId.isAcceptableOrUnknown(
              data['workout_plan_id']!, _workoutPlanIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
          _durationSecondsMeta,
          durationSeconds.isAcceptableOrUnknown(
              data['duration_seconds']!, _durationSecondsMeta));
    }
    if (data.containsKey('total_volume')) {
      context.handle(
          _totalVolumeMeta,
          totalVolume.isAcceptableOrUnknown(
              data['total_volume']!, _totalVolumeMeta));
    }
    if (data.containsKey('total_sets')) {
      context.handle(_totalSetsMeta,
          totalSets.isAcceptableOrUnknown(data['total_sets']!, _totalSetsMeta));
    }
    if (data.containsKey('total_reps')) {
      context.handle(_totalRepsMeta,
          totalReps.isAcceptableOrUnknown(data['total_reps']!, _totalRepsMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('sync_version')) {
      context.handle(
          _syncVersionMeta,
          syncVersion.isAcceptableOrUnknown(
              data['sync_version']!, _syncVersionMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSessionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSessionEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      workoutPlanId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_plan_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      durationSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_seconds']),
      totalVolume: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_volume']),
      totalSets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_sets']),
      totalReps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_reps']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      syncVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_version'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
    );
  }

  @override
  $WorkoutSessionsTable createAlias(String alias) {
    return $WorkoutSessionsTable(attachedDatabase, alias);
  }
}

class WorkoutSessionEntity extends DataClass
    implements Insertable<WorkoutSessionEntity> {
  final String id;
  final String userId;
  final String? workoutPlanId;
  final String name;
  final String? notes;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int? durationSeconds;
  final double? totalVolume;
  final int? totalSets;
  final int? totalReps;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDirty;
  final int syncVersion;
  final DateTime? lastSyncedAt;
  final String? remoteId;
  const WorkoutSessionEntity(
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
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      required this.isDirty,
      required this.syncVersion,
      this.lastSyncedAt,
      this.remoteId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || workoutPlanId != null) {
      map['workout_plan_id'] = Variable<String>(workoutPlanId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || totalVolume != null) {
      map['total_volume'] = Variable<double>(totalVolume);
    }
    if (!nullToAbsent || totalSets != null) {
      map['total_sets'] = Variable<int>(totalSets);
    }
    if (!nullToAbsent || totalReps != null) {
      map['total_reps'] = Variable<int>(totalReps);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['sync_version'] = Variable<int>(syncVersion);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  WorkoutSessionsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSessionsCompanion(
      id: Value(id),
      userId: Value(userId),
      workoutPlanId: workoutPlanId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutPlanId),
      name: Value(name),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      totalVolume: totalVolume == null && nullToAbsent
          ? const Value.absent()
          : Value(totalVolume),
      totalSets: totalSets == null && nullToAbsent
          ? const Value.absent()
          : Value(totalSets),
      totalReps: totalReps == null && nullToAbsent
          ? const Value.absent()
          : Value(totalReps),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDirty: Value(isDirty),
      syncVersion: Value(syncVersion),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
    );
  }

  factory WorkoutSessionEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSessionEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      workoutPlanId: serializer.fromJson<String?>(json['workoutPlanId']),
      name: serializer.fromJson<String>(json['name']),
      notes: serializer.fromJson<String?>(json['notes']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      totalVolume: serializer.fromJson<double?>(json['totalVolume']),
      totalSets: serializer.fromJson<int?>(json['totalSets']),
      totalReps: serializer.fromJson<int?>(json['totalReps']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'workoutPlanId': serializer.toJson<String?>(workoutPlanId),
      'name': serializer.toJson<String>(name),
      'notes': serializer.toJson<String?>(notes),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'totalVolume': serializer.toJson<double?>(totalVolume),
      'totalSets': serializer.toJson<int?>(totalSets),
      'totalReps': serializer.toJson<int?>(totalReps),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDirty': serializer.toJson<bool>(isDirty),
      'syncVersion': serializer.toJson<int>(syncVersion),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  WorkoutSessionEntity copyWith(
          {String? id,
          String? userId,
          Value<String?> workoutPlanId = const Value.absent(),
          String? name,
          Value<String?> notes = const Value.absent(),
          DateTime? startedAt,
          Value<DateTime?> completedAt = const Value.absent(),
          Value<int?> durationSeconds = const Value.absent(),
          Value<double?> totalVolume = const Value.absent(),
          Value<int?> totalSets = const Value.absent(),
          Value<int?> totalReps = const Value.absent(),
          String? status,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDirty,
          int? syncVersion,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent()}) =>
      WorkoutSessionEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        workoutPlanId:
            workoutPlanId.present ? workoutPlanId.value : this.workoutPlanId,
        name: name ?? this.name,
        notes: notes.present ? notes.value : this.notes,
        startedAt: startedAt ?? this.startedAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        durationSeconds: durationSeconds.present
            ? durationSeconds.value
            : this.durationSeconds,
        totalVolume: totalVolume.present ? totalVolume.value : this.totalVolume,
        totalSets: totalSets.present ? totalSets.value : this.totalSets,
        totalReps: totalReps.present ? totalReps.value : this.totalReps,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDirty: isDirty ?? this.isDirty,
        syncVersion: syncVersion ?? this.syncVersion,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
      );
  WorkoutSessionEntity copyWithCompanion(WorkoutSessionsCompanion data) {
    return WorkoutSessionEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      workoutPlanId: data.workoutPlanId.present
          ? data.workoutPlanId.value
          : this.workoutPlanId,
      name: data.name.present ? data.name.value : this.name,
      notes: data.notes.present ? data.notes.value : this.notes,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      totalVolume:
          data.totalVolume.present ? data.totalVolume.value : this.totalVolume,
      totalSets: data.totalSets.present ? data.totalSets.value : this.totalSets,
      totalReps: data.totalReps.present ? data.totalReps.value : this.totalReps,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      syncVersion:
          data.syncVersion.present ? data.syncVersion.value : this.syncVersion,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('workoutPlanId: $workoutPlanId, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('totalVolume: $totalVolume, ')
          ..write('totalSets: $totalSets, ')
          ..write('totalReps: $totalReps, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      remoteId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSessionEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.workoutPlanId == this.workoutPlanId &&
          other.name == this.name &&
          other.notes == this.notes &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.durationSeconds == this.durationSeconds &&
          other.totalVolume == this.totalVolume &&
          other.totalSets == this.totalSets &&
          other.totalReps == this.totalReps &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDirty == this.isDirty &&
          other.syncVersion == this.syncVersion &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId);
}

class WorkoutSessionsCompanion extends UpdateCompanion<WorkoutSessionEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String?> workoutPlanId;
  final Value<String> name;
  final Value<String?> notes;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<int?> durationSeconds;
  final Value<double?> totalVolume;
  final Value<int?> totalSets;
  final Value<int?> totalReps;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDirty;
  final Value<int> syncVersion;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> rowid;
  const WorkoutSessionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.workoutPlanId = const Value.absent(),
    this.name = const Value.absent(),
    this.notes = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.totalVolume = const Value.absent(),
    this.totalSets = const Value.absent(),
    this.totalReps = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutSessionsCompanion.insert({
    required String id,
    required String userId,
    this.workoutPlanId = const Value.absent(),
    required String name,
    this.notes = const Value.absent(),
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.totalVolume = const Value.absent(),
    this.totalSets = const Value.absent(),
    this.totalReps = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        name = Value(name),
        startedAt = Value(startedAt);
  static Insertable<WorkoutSessionEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? workoutPlanId,
    Expression<String>? name,
    Expression<String>? notes,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? durationSeconds,
    Expression<double>? totalVolume,
    Expression<int>? totalSets,
    Expression<int>? totalReps,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDirty,
    Expression<int>? syncVersion,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (workoutPlanId != null) 'workout_plan_id': workoutPlanId,
      if (name != null) 'name': name,
      if (notes != null) 'notes': notes,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (totalVolume != null) 'total_volume': totalVolume,
      if (totalSets != null) 'total_sets': totalSets,
      if (totalReps != null) 'total_reps': totalReps,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDirty != null) 'is_dirty': isDirty,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutSessionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String?>? workoutPlanId,
      Value<String>? name,
      Value<String?>? notes,
      Value<DateTime>? startedAt,
      Value<DateTime?>? completedAt,
      Value<int?>? durationSeconds,
      Value<double?>? totalVolume,
      Value<int?>? totalSets,
      Value<int?>? totalReps,
      Value<String>? status,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDirty,
      Value<int>? syncVersion,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? rowid}) {
    return WorkoutSessionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      workoutPlanId: workoutPlanId ?? this.workoutPlanId,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      totalVolume: totalVolume ?? this.totalVolume,
      totalSets: totalSets ?? this.totalSets,
      totalReps: totalReps ?? this.totalReps,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDirty: isDirty ?? this.isDirty,
      syncVersion: syncVersion ?? this.syncVersion,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (workoutPlanId.present) {
      map['workout_plan_id'] = Variable<String>(workoutPlanId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (totalVolume.present) {
      map['total_volume'] = Variable<double>(totalVolume.value);
    }
    if (totalSets.present) {
      map['total_sets'] = Variable<int>(totalSets.value);
    }
    if (totalReps.present) {
      map['total_reps'] = Variable<int>(totalReps.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('workoutPlanId: $workoutPlanId, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('totalVolume: $totalVolume, ')
          ..write('totalSets: $totalSets, ')
          ..write('totalReps: $totalReps, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionExercisesTable extends SessionExercises
    with TableInfo<$SessionExercisesTable, SessionExerciseEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workout_sessions (id)'));
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercises (id)'));
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncVersionMeta =
      const VerificationMeta('syncVersion');
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
      'sync_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
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
        remoteId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_exercises';
  @override
  VerificationContext validateIntegrity(
      Insertable<SessionExerciseEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('sync_version')) {
      context.handle(
          _syncVersionMeta,
          syncVersion.isAcceptableOrUnknown(
              data['sync_version']!, _syncVersionMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionExerciseEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionExerciseEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_id'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      syncVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_version'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
    );
  }

  @override
  $SessionExercisesTable createAlias(String alias) {
    return $SessionExercisesTable(attachedDatabase, alias);
  }
}

class SessionExerciseEntity extends DataClass
    implements Insertable<SessionExerciseEntity> {
  final String id;
  final String sessionId;
  final String exerciseId;
  final int sortOrder;
  final String? notes;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDirty;
  final int syncVersion;
  final String? remoteId;
  const SessionExerciseEntity(
      {required this.id,
      required this.sessionId,
      required this.exerciseId,
      required this.sortOrder,
      this.notes,
      this.startedAt,
      this.completedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.isDirty,
      required this.syncVersion,
      this.remoteId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['sync_version'] = Variable<int>(syncVersion);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  SessionExercisesCompanion toCompanion(bool nullToAbsent) {
    return SessionExercisesCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      exerciseId: Value(exerciseId),
      sortOrder: Value(sortOrder),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDirty: Value(isDirty),
      syncVersion: Value(syncVersion),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
    );
  }

  factory SessionExerciseEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionExerciseEntity(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      notes: serializer.fromJson<String?>(json['notes']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'notes': serializer.toJson<String?>(notes),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDirty': serializer.toJson<bool>(isDirty),
      'syncVersion': serializer.toJson<int>(syncVersion),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  SessionExerciseEntity copyWith(
          {String? id,
          String? sessionId,
          String? exerciseId,
          int? sortOrder,
          Value<String?> notes = const Value.absent(),
          Value<DateTime?> startedAt = const Value.absent(),
          Value<DateTime?> completedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDirty,
          int? syncVersion,
          Value<String?> remoteId = const Value.absent()}) =>
      SessionExerciseEntity(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        exerciseId: exerciseId ?? this.exerciseId,
        sortOrder: sortOrder ?? this.sortOrder,
        notes: notes.present ? notes.value : this.notes,
        startedAt: startedAt.present ? startedAt.value : this.startedAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDirty: isDirty ?? this.isDirty,
        syncVersion: syncVersion ?? this.syncVersion,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
      );
  SessionExerciseEntity copyWithCompanion(SessionExercisesCompanion data) {
    return SessionExerciseEntity(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      notes: data.notes.present ? data.notes.value : this.notes,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      syncVersion:
          data.syncVersion.present ? data.syncVersion.value : this.syncVersion,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionExerciseEntity(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('notes: $notes, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      remoteId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionExerciseEntity &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.exerciseId == this.exerciseId &&
          other.sortOrder == this.sortOrder &&
          other.notes == this.notes &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDirty == this.isDirty &&
          other.syncVersion == this.syncVersion &&
          other.remoteId == this.remoteId);
}

class SessionExercisesCompanion extends UpdateCompanion<SessionExerciseEntity> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String> exerciseId;
  final Value<int> sortOrder;
  final Value<String?> notes;
  final Value<DateTime?> startedAt;
  final Value<DateTime?> completedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDirty;
  final Value<int> syncVersion;
  final Value<String?> remoteId;
  final Value<int> rowid;
  const SessionExercisesCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.notes = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionExercisesCompanion.insert({
    required String id,
    required String sessionId,
    required String exerciseId,
    this.sortOrder = const Value.absent(),
    this.notes = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sessionId = Value(sessionId),
        exerciseId = Value(exerciseId);
  static Insertable<SessionExerciseEntity> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? exerciseId,
    Expression<int>? sortOrder,
    Expression<String>? notes,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDirty,
    Expression<int>? syncVersion,
    Expression<String>? remoteId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (notes != null) 'notes': notes,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDirty != null) 'is_dirty': isDirty,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (remoteId != null) 'remote_id': remoteId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionExercisesCompanion copyWith(
      {Value<String>? id,
      Value<String>? sessionId,
      Value<String>? exerciseId,
      Value<int>? sortOrder,
      Value<String?>? notes,
      Value<DateTime?>? startedAt,
      Value<DateTime?>? completedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDirty,
      Value<int>? syncVersion,
      Value<String?>? remoteId,
      Value<int>? rowid}) {
    return SessionExercisesCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      exerciseId: exerciseId ?? this.exerciseId,
      sortOrder: sortOrder ?? this.sortOrder,
      notes: notes ?? this.notes,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDirty: isDirty ?? this.isDirty,
      syncVersion: syncVersion ?? this.syncVersion,
      remoteId: remoteId ?? this.remoteId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionExercisesCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('notes: $notes, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('remoteId: $remoteId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSetsTable extends WorkoutSets
    with TableInfo<$WorkoutSetsTable, WorkoutSetEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionExerciseIdMeta =
      const VerificationMeta('sessionExerciseId');
  @override
  late final GeneratedColumn<String> sessionExerciseId =
      GeneratedColumn<String>('session_exercise_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES session_exercises (id)'));
  static const VerificationMeta _setNumberMeta =
      const VerificationMeta('setNumber');
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
      'set_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _durationSecondsMeta =
      const VerificationMeta('durationSeconds');
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
      'duration_seconds', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _distanceMeta =
      const VerificationMeta('distance');
  @override
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
      'distance', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _restSecondsMeta =
      const VerificationMeta('restSeconds');
  @override
  late final GeneratedColumn<int> restSeconds = GeneratedColumn<int>(
      'rest_seconds', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _setTypeMeta =
      const VerificationMeta('setType');
  @override
  late final GeneratedColumn<String> setType = GeneratedColumn<String>(
      'set_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('working'));
  static const VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedColumn<double> rpe = GeneratedColumn<double>(
      'rpe', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncVersionMeta =
      const VerificationMeta('syncVersion');
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
      'sync_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
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
        remoteId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_sets';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutSetEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_exercise_id')) {
      context.handle(
          _sessionExerciseIdMeta,
          sessionExerciseId.isAcceptableOrUnknown(
              data['session_exercise_id']!, _sessionExerciseIdMeta));
    } else if (isInserting) {
      context.missing(_sessionExerciseIdMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(_setNumberMeta,
          setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta));
    } else if (isInserting) {
      context.missing(_setNumberMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps']!, _repsMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
          _durationSecondsMeta,
          durationSeconds.isAcceptableOrUnknown(
              data['duration_seconds']!, _durationSecondsMeta));
    }
    if (data.containsKey('distance')) {
      context.handle(_distanceMeta,
          distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta));
    }
    if (data.containsKey('rest_seconds')) {
      context.handle(
          _restSecondsMeta,
          restSeconds.isAcceptableOrUnknown(
              data['rest_seconds']!, _restSecondsMeta));
    }
    if (data.containsKey('set_type')) {
      context.handle(_setTypeMeta,
          setType.isAcceptableOrUnknown(data['set_type']!, _setTypeMeta));
    }
    if (data.containsKey('rpe')) {
      context.handle(
          _rpeMeta, rpe.isAcceptableOrUnknown(data['rpe']!, _rpeMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('sync_version')) {
      context.handle(
          _syncVersionMeta,
          syncVersion.isAcceptableOrUnknown(
              data['sync_version']!, _syncVersionMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSetEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSetEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sessionExerciseId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}session_exercise_id'])!,
      setNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set_number'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight']),
      durationSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_seconds']),
      distance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}distance']),
      restSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rest_seconds']),
      setType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}set_type'])!,
      rpe: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rpe']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      syncVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_version'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
    );
  }

  @override
  $WorkoutSetsTable createAlias(String alias) {
    return $WorkoutSetsTable(attachedDatabase, alias);
  }
}

class WorkoutSetEntity extends DataClass
    implements Insertable<WorkoutSetEntity> {
  final String id;
  final String sessionExerciseId;
  final int setNumber;
  final int? reps;
  final double? weight;
  final int? durationSeconds;
  final double? distance;
  final int? restSeconds;
  final String setType;
  final double? rpe;
  final bool isCompleted;
  final String? notes;
  final DateTime? completedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDirty;
  final int syncVersion;
  final String? remoteId;
  const WorkoutSetEntity(
      {required this.id,
      required this.sessionExerciseId,
      required this.setNumber,
      this.reps,
      this.weight,
      this.durationSeconds,
      this.distance,
      this.restSeconds,
      required this.setType,
      this.rpe,
      required this.isCompleted,
      this.notes,
      this.completedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.isDirty,
      required this.syncVersion,
      this.remoteId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_exercise_id'] = Variable<String>(sessionExerciseId);
    map['set_number'] = Variable<int>(setNumber);
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || distance != null) {
      map['distance'] = Variable<double>(distance);
    }
    if (!nullToAbsent || restSeconds != null) {
      map['rest_seconds'] = Variable<int>(restSeconds);
    }
    map['set_type'] = Variable<String>(setType);
    if (!nullToAbsent || rpe != null) {
      map['rpe'] = Variable<double>(rpe);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['sync_version'] = Variable<int>(syncVersion);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  WorkoutSetsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSetsCompanion(
      id: Value(id),
      sessionExerciseId: Value(sessionExerciseId),
      setNumber: Value(setNumber),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      distance: distance == null && nullToAbsent
          ? const Value.absent()
          : Value(distance),
      restSeconds: restSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(restSeconds),
      setType: Value(setType),
      rpe: rpe == null && nullToAbsent ? const Value.absent() : Value(rpe),
      isCompleted: Value(isCompleted),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDirty: Value(isDirty),
      syncVersion: Value(syncVersion),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
    );
  }

  factory WorkoutSetEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSetEntity(
      id: serializer.fromJson<String>(json['id']),
      sessionExerciseId: serializer.fromJson<String>(json['sessionExerciseId']),
      setNumber: serializer.fromJson<int>(json['setNumber']),
      reps: serializer.fromJson<int?>(json['reps']),
      weight: serializer.fromJson<double?>(json['weight']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      distance: serializer.fromJson<double?>(json['distance']),
      restSeconds: serializer.fromJson<int?>(json['restSeconds']),
      setType: serializer.fromJson<String>(json['setType']),
      rpe: serializer.fromJson<double?>(json['rpe']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      notes: serializer.fromJson<String?>(json['notes']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionExerciseId': serializer.toJson<String>(sessionExerciseId),
      'setNumber': serializer.toJson<int>(setNumber),
      'reps': serializer.toJson<int?>(reps),
      'weight': serializer.toJson<double?>(weight),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'distance': serializer.toJson<double?>(distance),
      'restSeconds': serializer.toJson<int?>(restSeconds),
      'setType': serializer.toJson<String>(setType),
      'rpe': serializer.toJson<double?>(rpe),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'notes': serializer.toJson<String?>(notes),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDirty': serializer.toJson<bool>(isDirty),
      'syncVersion': serializer.toJson<int>(syncVersion),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  WorkoutSetEntity copyWith(
          {String? id,
          String? sessionExerciseId,
          int? setNumber,
          Value<int?> reps = const Value.absent(),
          Value<double?> weight = const Value.absent(),
          Value<int?> durationSeconds = const Value.absent(),
          Value<double?> distance = const Value.absent(),
          Value<int?> restSeconds = const Value.absent(),
          String? setType,
          Value<double?> rpe = const Value.absent(),
          bool? isCompleted,
          Value<String?> notes = const Value.absent(),
          Value<DateTime?> completedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDirty,
          int? syncVersion,
          Value<String?> remoteId = const Value.absent()}) =>
      WorkoutSetEntity(
        id: id ?? this.id,
        sessionExerciseId: sessionExerciseId ?? this.sessionExerciseId,
        setNumber: setNumber ?? this.setNumber,
        reps: reps.present ? reps.value : this.reps,
        weight: weight.present ? weight.value : this.weight,
        durationSeconds: durationSeconds.present
            ? durationSeconds.value
            : this.durationSeconds,
        distance: distance.present ? distance.value : this.distance,
        restSeconds: restSeconds.present ? restSeconds.value : this.restSeconds,
        setType: setType ?? this.setType,
        rpe: rpe.present ? rpe.value : this.rpe,
        isCompleted: isCompleted ?? this.isCompleted,
        notes: notes.present ? notes.value : this.notes,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDirty: isDirty ?? this.isDirty,
        syncVersion: syncVersion ?? this.syncVersion,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
      );
  WorkoutSetEntity copyWithCompanion(WorkoutSetsCompanion data) {
    return WorkoutSetEntity(
      id: data.id.present ? data.id.value : this.id,
      sessionExerciseId: data.sessionExerciseId.present
          ? data.sessionExerciseId.value
          : this.sessionExerciseId,
      setNumber: data.setNumber.present ? data.setNumber.value : this.setNumber,
      reps: data.reps.present ? data.reps.value : this.reps,
      weight: data.weight.present ? data.weight.value : this.weight,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      distance: data.distance.present ? data.distance.value : this.distance,
      restSeconds:
          data.restSeconds.present ? data.restSeconds.value : this.restSeconds,
      setType: data.setType.present ? data.setType.value : this.setType,
      rpe: data.rpe.present ? data.rpe.value : this.rpe,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      notes: data.notes.present ? data.notes.value : this.notes,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      syncVersion:
          data.syncVersion.present ? data.syncVersion.value : this.syncVersion,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSetEntity(')
          ..write('id: $id, ')
          ..write('sessionExerciseId: $sessionExerciseId, ')
          ..write('setNumber: $setNumber, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('distance: $distance, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('setType: $setType, ')
          ..write('rpe: $rpe, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('notes: $notes, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSetEntity &&
          other.id == this.id &&
          other.sessionExerciseId == this.sessionExerciseId &&
          other.setNumber == this.setNumber &&
          other.reps == this.reps &&
          other.weight == this.weight &&
          other.durationSeconds == this.durationSeconds &&
          other.distance == this.distance &&
          other.restSeconds == this.restSeconds &&
          other.setType == this.setType &&
          other.rpe == this.rpe &&
          other.isCompleted == this.isCompleted &&
          other.notes == this.notes &&
          other.completedAt == this.completedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDirty == this.isDirty &&
          other.syncVersion == this.syncVersion &&
          other.remoteId == this.remoteId);
}

class WorkoutSetsCompanion extends UpdateCompanion<WorkoutSetEntity> {
  final Value<String> id;
  final Value<String> sessionExerciseId;
  final Value<int> setNumber;
  final Value<int?> reps;
  final Value<double?> weight;
  final Value<int?> durationSeconds;
  final Value<double?> distance;
  final Value<int?> restSeconds;
  final Value<String> setType;
  final Value<double?> rpe;
  final Value<bool> isCompleted;
  final Value<String?> notes;
  final Value<DateTime?> completedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDirty;
  final Value<int> syncVersion;
  final Value<String?> remoteId;
  final Value<int> rowid;
  const WorkoutSetsCompanion({
    this.id = const Value.absent(),
    this.sessionExerciseId = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.distance = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.setType = const Value.absent(),
    this.rpe = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.notes = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutSetsCompanion.insert({
    required String id,
    required String sessionExerciseId,
    required int setNumber,
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.distance = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.setType = const Value.absent(),
    this.rpe = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.notes = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sessionExerciseId = Value(sessionExerciseId),
        setNumber = Value(setNumber);
  static Insertable<WorkoutSetEntity> custom({
    Expression<String>? id,
    Expression<String>? sessionExerciseId,
    Expression<int>? setNumber,
    Expression<int>? reps,
    Expression<double>? weight,
    Expression<int>? durationSeconds,
    Expression<double>? distance,
    Expression<int>? restSeconds,
    Expression<String>? setType,
    Expression<double>? rpe,
    Expression<bool>? isCompleted,
    Expression<String>? notes,
    Expression<DateTime>? completedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDirty,
    Expression<int>? syncVersion,
    Expression<String>? remoteId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionExerciseId != null) 'session_exercise_id': sessionExerciseId,
      if (setNumber != null) 'set_number': setNumber,
      if (reps != null) 'reps': reps,
      if (weight != null) 'weight': weight,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (distance != null) 'distance': distance,
      if (restSeconds != null) 'rest_seconds': restSeconds,
      if (setType != null) 'set_type': setType,
      if (rpe != null) 'rpe': rpe,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (notes != null) 'notes': notes,
      if (completedAt != null) 'completed_at': completedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDirty != null) 'is_dirty': isDirty,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (remoteId != null) 'remote_id': remoteId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutSetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? sessionExerciseId,
      Value<int>? setNumber,
      Value<int?>? reps,
      Value<double?>? weight,
      Value<int?>? durationSeconds,
      Value<double?>? distance,
      Value<int?>? restSeconds,
      Value<String>? setType,
      Value<double?>? rpe,
      Value<bool>? isCompleted,
      Value<String?>? notes,
      Value<DateTime?>? completedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDirty,
      Value<int>? syncVersion,
      Value<String?>? remoteId,
      Value<int>? rowid}) {
    return WorkoutSetsCompanion(
      id: id ?? this.id,
      sessionExerciseId: sessionExerciseId ?? this.sessionExerciseId,
      setNumber: setNumber ?? this.setNumber,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      distance: distance ?? this.distance,
      restSeconds: restSeconds ?? this.restSeconds,
      setType: setType ?? this.setType,
      rpe: rpe ?? this.rpe,
      isCompleted: isCompleted ?? this.isCompleted,
      notes: notes ?? this.notes,
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDirty: isDirty ?? this.isDirty,
      syncVersion: syncVersion ?? this.syncVersion,
      remoteId: remoteId ?? this.remoteId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionExerciseId.present) {
      map['session_exercise_id'] = Variable<String>(sessionExerciseId.value);
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (restSeconds.present) {
      map['rest_seconds'] = Variable<int>(restSeconds.value);
    }
    if (setType.present) {
      map['set_type'] = Variable<String>(setType.value);
    }
    if (rpe.present) {
      map['rpe'] = Variable<double>(rpe.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSetsCompanion(')
          ..write('id: $id, ')
          ..write('sessionExerciseId: $sessionExerciseId, ')
          ..write('setNumber: $setNumber, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('distance: $distance, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('setType: $setType, ')
          ..write('rpe: $rpe, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('notes: $notes, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('remoteId: $remoteId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonalRecordsTable extends PersonalRecords
    with TableInfo<$PersonalRecordsTable, PersonalRecordEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonalRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercises (id)'));
  static const VerificationMeta _recordTypeMeta =
      const VerificationMeta('recordType');
  @override
  late final GeneratedColumn<String> recordType = GeneratedColumn<String>(
      'record_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _setIdMeta = const VerificationMeta('setId');
  @override
  late final GeneratedColumn<String> setId = GeneratedColumn<String>(
      'set_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workout_sets (id)'));
  static const VerificationMeta _achievedAtMeta =
      const VerificationMeta('achievedAt');
  @override
  late final GeneratedColumn<DateTime> achievedAt = GeneratedColumn<DateTime>(
      'achieved_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isCurrentRecordMeta =
      const VerificationMeta('isCurrentRecord');
  @override
  late final GeneratedColumn<bool> isCurrentRecord = GeneratedColumn<bool>(
      'is_current_record', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_current_record" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncVersionMeta =
      const VerificationMeta('syncVersion');
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
      'sync_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
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
        remoteId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'personal_records';
  @override
  VerificationContext validateIntegrity(
      Insertable<PersonalRecordEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('record_type')) {
      context.handle(
          _recordTypeMeta,
          recordType.isAcceptableOrUnknown(
              data['record_type']!, _recordTypeMeta));
    } else if (isInserting) {
      context.missing(_recordTypeMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps']!, _repsMeta));
    }
    if (data.containsKey('set_id')) {
      context.handle(
          _setIdMeta, setId.isAcceptableOrUnknown(data['set_id']!, _setIdMeta));
    }
    if (data.containsKey('achieved_at')) {
      context.handle(
          _achievedAtMeta,
          achievedAt.isAcceptableOrUnknown(
              data['achieved_at']!, _achievedAtMeta));
    } else if (isInserting) {
      context.missing(_achievedAtMeta);
    }
    if (data.containsKey('is_current_record')) {
      context.handle(
          _isCurrentRecordMeta,
          isCurrentRecord.isAcceptableOrUnknown(
              data['is_current_record']!, _isCurrentRecordMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('sync_version')) {
      context.handle(
          _syncVersionMeta,
          syncVersion.isAcceptableOrUnknown(
              data['sync_version']!, _syncVersionMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonalRecordEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonalRecordEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_id'])!,
      recordType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_type'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps']),
      setId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}set_id']),
      achievedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}achieved_at'])!,
      isCurrentRecord: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_current_record'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      syncVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_version'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
    );
  }

  @override
  $PersonalRecordsTable createAlias(String alias) {
    return $PersonalRecordsTable(attachedDatabase, alias);
  }
}

class PersonalRecordEntity extends DataClass
    implements Insertable<PersonalRecordEntity> {
  final String id;
  final String userId;
  final String exerciseId;
  final String recordType;
  final double value;
  final int? reps;
  final String? setId;
  final DateTime achievedAt;
  final bool isCurrentRecord;
  final DateTime createdAt;
  final bool isDirty;
  final int syncVersion;
  final String? remoteId;
  const PersonalRecordEntity(
      {required this.id,
      required this.userId,
      required this.exerciseId,
      required this.recordType,
      required this.value,
      this.reps,
      this.setId,
      required this.achievedAt,
      required this.isCurrentRecord,
      required this.createdAt,
      required this.isDirty,
      required this.syncVersion,
      this.remoteId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['record_type'] = Variable<String>(recordType);
    map['value'] = Variable<double>(value);
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    if (!nullToAbsent || setId != null) {
      map['set_id'] = Variable<String>(setId);
    }
    map['achieved_at'] = Variable<DateTime>(achievedAt);
    map['is_current_record'] = Variable<bool>(isCurrentRecord);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_dirty'] = Variable<bool>(isDirty);
    map['sync_version'] = Variable<int>(syncVersion);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  PersonalRecordsCompanion toCompanion(bool nullToAbsent) {
    return PersonalRecordsCompanion(
      id: Value(id),
      userId: Value(userId),
      exerciseId: Value(exerciseId),
      recordType: Value(recordType),
      value: Value(value),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      setId:
          setId == null && nullToAbsent ? const Value.absent() : Value(setId),
      achievedAt: Value(achievedAt),
      isCurrentRecord: Value(isCurrentRecord),
      createdAt: Value(createdAt),
      isDirty: Value(isDirty),
      syncVersion: Value(syncVersion),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
    );
  }

  factory PersonalRecordEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonalRecordEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      recordType: serializer.fromJson<String>(json['recordType']),
      value: serializer.fromJson<double>(json['value']),
      reps: serializer.fromJson<int?>(json['reps']),
      setId: serializer.fromJson<String?>(json['setId']),
      achievedAt: serializer.fromJson<DateTime>(json['achievedAt']),
      isCurrentRecord: serializer.fromJson<bool>(json['isCurrentRecord']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'recordType': serializer.toJson<String>(recordType),
      'value': serializer.toJson<double>(value),
      'reps': serializer.toJson<int?>(reps),
      'setId': serializer.toJson<String?>(setId),
      'achievedAt': serializer.toJson<DateTime>(achievedAt),
      'isCurrentRecord': serializer.toJson<bool>(isCurrentRecord),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isDirty': serializer.toJson<bool>(isDirty),
      'syncVersion': serializer.toJson<int>(syncVersion),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  PersonalRecordEntity copyWith(
          {String? id,
          String? userId,
          String? exerciseId,
          String? recordType,
          double? value,
          Value<int?> reps = const Value.absent(),
          Value<String?> setId = const Value.absent(),
          DateTime? achievedAt,
          bool? isCurrentRecord,
          DateTime? createdAt,
          bool? isDirty,
          int? syncVersion,
          Value<String?> remoteId = const Value.absent()}) =>
      PersonalRecordEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        exerciseId: exerciseId ?? this.exerciseId,
        recordType: recordType ?? this.recordType,
        value: value ?? this.value,
        reps: reps.present ? reps.value : this.reps,
        setId: setId.present ? setId.value : this.setId,
        achievedAt: achievedAt ?? this.achievedAt,
        isCurrentRecord: isCurrentRecord ?? this.isCurrentRecord,
        createdAt: createdAt ?? this.createdAt,
        isDirty: isDirty ?? this.isDirty,
        syncVersion: syncVersion ?? this.syncVersion,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
      );
  PersonalRecordEntity copyWithCompanion(PersonalRecordsCompanion data) {
    return PersonalRecordEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
      recordType:
          data.recordType.present ? data.recordType.value : this.recordType,
      value: data.value.present ? data.value.value : this.value,
      reps: data.reps.present ? data.reps.value : this.reps,
      setId: data.setId.present ? data.setId.value : this.setId,
      achievedAt:
          data.achievedAt.present ? data.achievedAt.value : this.achievedAt,
      isCurrentRecord: data.isCurrentRecord.present
          ? data.isCurrentRecord.value
          : this.isCurrentRecord,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      syncVersion:
          data.syncVersion.present ? data.syncVersion.value : this.syncVersion,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonalRecordEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('recordType: $recordType, ')
          ..write('value: $value, ')
          ..write('reps: $reps, ')
          ..write('setId: $setId, ')
          ..write('achievedAt: $achievedAt, ')
          ..write('isCurrentRecord: $isCurrentRecord, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      remoteId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonalRecordEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.exerciseId == this.exerciseId &&
          other.recordType == this.recordType &&
          other.value == this.value &&
          other.reps == this.reps &&
          other.setId == this.setId &&
          other.achievedAt == this.achievedAt &&
          other.isCurrentRecord == this.isCurrentRecord &&
          other.createdAt == this.createdAt &&
          other.isDirty == this.isDirty &&
          other.syncVersion == this.syncVersion &&
          other.remoteId == this.remoteId);
}

class PersonalRecordsCompanion extends UpdateCompanion<PersonalRecordEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> exerciseId;
  final Value<String> recordType;
  final Value<double> value;
  final Value<int?> reps;
  final Value<String?> setId;
  final Value<DateTime> achievedAt;
  final Value<bool> isCurrentRecord;
  final Value<DateTime> createdAt;
  final Value<bool> isDirty;
  final Value<int> syncVersion;
  final Value<String?> remoteId;
  final Value<int> rowid;
  const PersonalRecordsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.recordType = const Value.absent(),
    this.value = const Value.absent(),
    this.reps = const Value.absent(),
    this.setId = const Value.absent(),
    this.achievedAt = const Value.absent(),
    this.isCurrentRecord = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonalRecordsCompanion.insert({
    required String id,
    required String userId,
    required String exerciseId,
    required String recordType,
    required double value,
    this.reps = const Value.absent(),
    this.setId = const Value.absent(),
    required DateTime achievedAt,
    this.isCurrentRecord = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        exerciseId = Value(exerciseId),
        recordType = Value(recordType),
        value = Value(value),
        achievedAt = Value(achievedAt);
  static Insertable<PersonalRecordEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? exerciseId,
    Expression<String>? recordType,
    Expression<double>? value,
    Expression<int>? reps,
    Expression<String>? setId,
    Expression<DateTime>? achievedAt,
    Expression<bool>? isCurrentRecord,
    Expression<DateTime>? createdAt,
    Expression<bool>? isDirty,
    Expression<int>? syncVersion,
    Expression<String>? remoteId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (recordType != null) 'record_type': recordType,
      if (value != null) 'value': value,
      if (reps != null) 'reps': reps,
      if (setId != null) 'set_id': setId,
      if (achievedAt != null) 'achieved_at': achievedAt,
      if (isCurrentRecord != null) 'is_current_record': isCurrentRecord,
      if (createdAt != null) 'created_at': createdAt,
      if (isDirty != null) 'is_dirty': isDirty,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (remoteId != null) 'remote_id': remoteId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonalRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? exerciseId,
      Value<String>? recordType,
      Value<double>? value,
      Value<int?>? reps,
      Value<String?>? setId,
      Value<DateTime>? achievedAt,
      Value<bool>? isCurrentRecord,
      Value<DateTime>? createdAt,
      Value<bool>? isDirty,
      Value<int>? syncVersion,
      Value<String?>? remoteId,
      Value<int>? rowid}) {
    return PersonalRecordsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      exerciseId: exerciseId ?? this.exerciseId,
      recordType: recordType ?? this.recordType,
      value: value ?? this.value,
      reps: reps ?? this.reps,
      setId: setId ?? this.setId,
      achievedAt: achievedAt ?? this.achievedAt,
      isCurrentRecord: isCurrentRecord ?? this.isCurrentRecord,
      createdAt: createdAt ?? this.createdAt,
      isDirty: isDirty ?? this.isDirty,
      syncVersion: syncVersion ?? this.syncVersion,
      remoteId: remoteId ?? this.remoteId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (recordType.present) {
      map['record_type'] = Variable<String>(recordType.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (setId.present) {
      map['set_id'] = Variable<String>(setId.value);
    }
    if (achievedAt.present) {
      map['achieved_at'] = Variable<DateTime>(achievedAt.value);
    }
    if (isCurrentRecord.present) {
      map['is_current_record'] = Variable<bool>(isCurrentRecord.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonalRecordsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('recordType: $recordType, ')
          ..write('value: $value, ')
          ..write('reps: $reps, ')
          ..write('setId: $setId, ')
          ..write('achievedAt: $achievedAt, ')
          ..write('isCurrentRecord: $isCurrentRecord, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDirty: $isDirty, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('remoteId: $remoteId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _targetTableMeta =
      const VerificationMeta('targetTable');
  @override
  late final GeneratedColumn<String> targetTable = GeneratedColumn<String>(
      'target_table', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recordIdMeta =
      const VerificationMeta('recordId');
  @override
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
      'record_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastAttemptAtMeta =
      const VerificationMeta('lastAttemptAt');
  @override
  late final GeneratedColumn<DateTime> lastAttemptAt =
      GeneratedColumn<DateTime>('last_attempt_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _errorMessageMeta =
      const VerificationMeta('errorMessage');
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
      'error_message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        targetTable,
        recordId,
        operation,
        retryCount,
        createdAt,
        lastAttemptAt,
        errorMessage
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('target_table')) {
      context.handle(
          _targetTableMeta,
          targetTable.isAcceptableOrUnknown(
              data['target_table']!, _targetTableMeta));
    } else if (isInserting) {
      context.missing(_targetTableMeta);
    }
    if (data.containsKey('record_id')) {
      context.handle(_recordIdMeta,
          recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta));
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
          _lastAttemptAtMeta,
          lastAttemptAt.isAcceptableOrUnknown(
              data['last_attempt_at']!, _lastAttemptAtMeta));
    }
    if (data.containsKey('error_message')) {
      context.handle(
          _errorMessageMeta,
          errorMessage.isAcceptableOrUnknown(
              data['error_message']!, _errorMessageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      targetTable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target_table'])!,
      recordId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_id'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastAttemptAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_attempt_at']),
      errorMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error_message']),
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueEntity extends DataClass implements Insertable<SyncQueueEntity> {
  final int id;
  final String targetTable;
  final String recordId;
  final String operation;
  final int retryCount;
  final DateTime createdAt;
  final DateTime? lastAttemptAt;
  final String? errorMessage;
  const SyncQueueEntity(
      {required this.id,
      required this.targetTable,
      required this.recordId,
      required this.operation,
      required this.retryCount,
      required this.createdAt,
      this.lastAttemptAt,
      this.errorMessage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['target_table'] = Variable<String>(targetTable);
    map['record_id'] = Variable<String>(recordId);
    map['operation'] = Variable<String>(operation);
    map['retry_count'] = Variable<int>(retryCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt);
    }
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      targetTable: Value(targetTable),
      recordId: Value(recordId),
      operation: Value(operation),
      retryCount: Value(retryCount),
      createdAt: Value(createdAt),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
    );
  }

  factory SyncQueueEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueEntity(
      id: serializer.fromJson<int>(json['id']),
      targetTable: serializer.fromJson<String>(json['targetTable']),
      recordId: serializer.fromJson<String>(json['recordId']),
      operation: serializer.fromJson<String>(json['operation']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastAttemptAt: serializer.fromJson<DateTime?>(json['lastAttemptAt']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'targetTable': serializer.toJson<String>(targetTable),
      'recordId': serializer.toJson<String>(recordId),
      'operation': serializer.toJson<String>(operation),
      'retryCount': serializer.toJson<int>(retryCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastAttemptAt': serializer.toJson<DateTime?>(lastAttemptAt),
      'errorMessage': serializer.toJson<String?>(errorMessage),
    };
  }

  SyncQueueEntity copyWith(
          {int? id,
          String? targetTable,
          String? recordId,
          String? operation,
          int? retryCount,
          DateTime? createdAt,
          Value<DateTime?> lastAttemptAt = const Value.absent(),
          Value<String?> errorMessage = const Value.absent()}) =>
      SyncQueueEntity(
        id: id ?? this.id,
        targetTable: targetTable ?? this.targetTable,
        recordId: recordId ?? this.recordId,
        operation: operation ?? this.operation,
        retryCount: retryCount ?? this.retryCount,
        createdAt: createdAt ?? this.createdAt,
        lastAttemptAt:
            lastAttemptAt.present ? lastAttemptAt.value : this.lastAttemptAt,
        errorMessage:
            errorMessage.present ? errorMessage.value : this.errorMessage,
      );
  SyncQueueEntity copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueEntity(
      id: data.id.present ? data.id.value : this.id,
      targetTable:
          data.targetTable.present ? data.targetTable.value : this.targetTable,
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      operation: data.operation.present ? data.operation.value : this.operation,
      retryCount:
          data.retryCount.present ? data.retryCount.value : this.retryCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueEntity(')
          ..write('id: $id, ')
          ..write('targetTable: $targetTable, ')
          ..write('recordId: $recordId, ')
          ..write('operation: $operation, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt, ')
          ..write('errorMessage: $errorMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, targetTable, recordId, operation,
      retryCount, createdAt, lastAttemptAt, errorMessage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueEntity &&
          other.id == this.id &&
          other.targetTable == this.targetTable &&
          other.recordId == this.recordId &&
          other.operation == this.operation &&
          other.retryCount == this.retryCount &&
          other.createdAt == this.createdAt &&
          other.lastAttemptAt == this.lastAttemptAt &&
          other.errorMessage == this.errorMessage);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueEntity> {
  final Value<int> id;
  final Value<String> targetTable;
  final Value<String> recordId;
  final Value<String> operation;
  final Value<int> retryCount;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastAttemptAt;
  final Value<String?> errorMessage;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.targetTable = const Value.absent(),
    this.recordId = const Value.absent(),
    this.operation = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
    this.errorMessage = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String targetTable,
    required String recordId,
    required String operation,
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
    this.errorMessage = const Value.absent(),
  })  : targetTable = Value(targetTable),
        recordId = Value(recordId),
        operation = Value(operation);
  static Insertable<SyncQueueEntity> custom({
    Expression<int>? id,
    Expression<String>? targetTable,
    Expression<String>? recordId,
    Expression<String>? operation,
    Expression<int>? retryCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastAttemptAt,
    Expression<String>? errorMessage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (targetTable != null) 'target_table': targetTable,
      if (recordId != null) 'record_id': recordId,
      if (operation != null) 'operation': operation,
      if (retryCount != null) 'retry_count': retryCount,
      if (createdAt != null) 'created_at': createdAt,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
      if (errorMessage != null) 'error_message': errorMessage,
    });
  }

  SyncQueueCompanion copyWith(
      {Value<int>? id,
      Value<String>? targetTable,
      Value<String>? recordId,
      Value<String>? operation,
      Value<int>? retryCount,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastAttemptAt,
      Value<String?>? errorMessage}) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      targetTable: targetTable ?? this.targetTable,
      recordId: recordId ?? this.recordId,
      operation: operation ?? this.operation,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (targetTable.present) {
      map['target_table'] = Variable<String>(targetTable.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('targetTable: $targetTable, ')
          ..write('recordId: $recordId, ')
          ..write('operation: $operation, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt, ')
          ..write('errorMessage: $errorMessage')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSettingEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSettingEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSettingEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingEntity(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSettingEntity extends DataClass
    implements Insertable<AppSettingEntity> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const AppSettingEntity(
      {required this.key, required this.value, required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSettingEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingEntity(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSettingEntity copyWith(
          {String? key, String? value, DateTime? updatedAt}) =>
      AppSettingEntity(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSettingEntity copyWithCompanion(AppSettingsCompanion data) {
    return AppSettingEntity(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingEntity(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingEntity &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSettingEntity> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<AppSettingEntity> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<String>? key,
      Value<String>? value,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $WorkoutPlansTable workoutPlans = $WorkoutPlansTable(this);
  late final $WorkoutPlanExercisesTable workoutPlanExercises =
      $WorkoutPlanExercisesTable(this);
  late final $WorkoutSessionsTable workoutSessions =
      $WorkoutSessionsTable(this);
  late final $SessionExercisesTable sessionExercises =
      $SessionExercisesTable(this);
  late final $WorkoutSetsTable workoutSets = $WorkoutSetsTable(this);
  late final $PersonalRecordsTable personalRecords =
      $PersonalRecordsTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        exercises,
        workoutPlans,
        workoutPlanExercises,
        workoutSessions,
        sessionExercises,
        workoutSets,
        personalRecords,
        syncQueue,
        appSettings
      ];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String id,
  Value<String?> email,
  Value<String?> displayName,
  Value<String?> supabaseId,
  Value<bool> isAnonymous,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<DateTime?> lastSyncedAt,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> id,
  Value<String?> email,
  Value<String?> displayName,
  Value<String?> supabaseId,
  Value<bool> isAnonymous,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<DateTime?> lastSyncedAt,
  Value<int> rowid,
});

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    UserEntity,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> displayName = const Value.absent(),
            Value<String?> supabaseId = const Value.absent(),
            Value<bool> isAnonymous = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            email: email,
            displayName: displayName,
            supabaseId: supabaseId,
            isAnonymous: isAnonymous,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            lastSyncedAt: lastSyncedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> email = const Value.absent(),
            Value<String?> displayName = const Value.absent(),
            Value<String?> supabaseId = const Value.absent(),
            Value<bool> isAnonymous = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            email: email,
            displayName: displayName,
            supabaseId: supabaseId,
            isAnonymous: isAnonymous,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            lastSyncedAt: lastSyncedAt,
            rowid: rowid,
          ),
        ));
}

class $$UsersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get displayName => $state.composableBuilder(
      column: $state.table.displayName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get supabaseId => $state.composableBuilder(
      column: $state.table.supabaseId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isAnonymous => $state.composableBuilder(
      column: $state.table.isAnonymous,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastSyncedAt => $state.composableBuilder(
      column: $state.table.lastSyncedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter exercisesRefs(
      ComposableFilter Function($$ExercisesTableFilterComposer f) f) {
    final $$ExercisesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.exercises,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$ExercisesTableFilterComposer(ComposerState(
                $state.db, $state.db.exercises, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter workoutPlansRefs(
      ComposableFilter Function($$WorkoutPlansTableFilterComposer f) f) {
    final $$WorkoutPlansTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.workoutPlans,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutPlansTableFilterComposer(ComposerState($state.db,
                $state.db.workoutPlans, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter workoutSessionsRefs(
      ComposableFilter Function($$WorkoutSessionsTableFilterComposer f) f) {
    final $$WorkoutSessionsTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.workoutSessions,
            getReferencedColumn: (t) => t.userId,
            builder: (joinBuilder, parentComposers) =>
                $$WorkoutSessionsTableFilterComposer(ComposerState($state.db,
                    $state.db.workoutSessions, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter personalRecordsRefs(
      ComposableFilter Function($$PersonalRecordsTableFilterComposer f) f) {
    final $$PersonalRecordsTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.personalRecords,
            getReferencedColumn: (t) => t.userId,
            builder: (joinBuilder, parentComposers) =>
                $$PersonalRecordsTableFilterComposer(ComposerState($state.db,
                    $state.db.personalRecords, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get displayName => $state.composableBuilder(
      column: $state.table.displayName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get supabaseId => $state.composableBuilder(
      column: $state.table.supabaseId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isAnonymous => $state.composableBuilder(
      column: $state.table.isAnonymous,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastSyncedAt => $state.composableBuilder(
      column: $state.table.lastSyncedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ExercisesTableCreateCompanionBuilder = ExercisesCompanion Function({
  required String id,
  required String userId,
  required String name,
  Value<String?> description,
  required String muscleGroup,
  Value<String?> secondaryMuscles,
  required String equipment,
  Value<String?> instructions,
  Value<String?> imageUrl,
  Value<bool> isCustom,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> rowid,
});
typedef $$ExercisesTableUpdateCompanionBuilder = ExercisesCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<String> name,
  Value<String?> description,
  Value<String> muscleGroup,
  Value<String?> secondaryMuscles,
  Value<String> equipment,
  Value<String?> instructions,
  Value<String?> imageUrl,
  Value<bool> isCustom,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> rowid,
});

class $$ExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExercisesTable,
    ExerciseEntity,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder> {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExercisesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExercisesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> muscleGroup = const Value.absent(),
            Value<String?> secondaryMuscles = const Value.absent(),
            Value<String> equipment = const Value.absent(),
            Value<String?> instructions = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<bool> isCustom = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExercisesCompanion(
            id: id,
            userId: userId,
            name: name,
            description: description,
            muscleGroup: muscleGroup,
            secondaryMuscles: secondaryMuscles,
            equipment: equipment,
            instructions: instructions,
            imageUrl: imageUrl,
            isCustom: isCustom,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String name,
            Value<String?> description = const Value.absent(),
            required String muscleGroup,
            Value<String?> secondaryMuscles = const Value.absent(),
            required String equipment,
            Value<String?> instructions = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<bool> isCustom = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExercisesCompanion.insert(
            id: id,
            userId: userId,
            name: name,
            description: description,
            muscleGroup: muscleGroup,
            secondaryMuscles: secondaryMuscles,
            equipment: equipment,
            instructions: instructions,
            imageUrl: imageUrl,
            isCustom: isCustom,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            rowid: rowid,
          ),
        ));
}

class $$ExercisesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get muscleGroup => $state.composableBuilder(
      column: $state.table.muscleGroup,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get secondaryMuscles => $state.composableBuilder(
      column: $state.table.secondaryMuscles,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get equipment => $state.composableBuilder(
      column: $state.table.equipment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get instructions => $state.composableBuilder(
      column: $state.table.instructions,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCustom => $state.composableBuilder(
      column: $state.table.isCustom,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastSyncedAt => $state.composableBuilder(
      column: $state.table.lastSyncedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter workoutPlanExercisesRefs(
      ComposableFilter Function($$WorkoutPlanExercisesTableFilterComposer f)
          f) {
    final $$WorkoutPlanExercisesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.workoutPlanExercises,
            getReferencedColumn: (t) => t.exerciseId,
            builder: (joinBuilder, parentComposers) =>
                $$WorkoutPlanExercisesTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.workoutPlanExercises,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }

  ComposableFilter sessionExercisesRefs(
      ComposableFilter Function($$SessionExercisesTableFilterComposer f) f) {
    final $$SessionExercisesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.sessionExercises,
            getReferencedColumn: (t) => t.exerciseId,
            builder: (joinBuilder, parentComposers) =>
                $$SessionExercisesTableFilterComposer(ComposerState($state.db,
                    $state.db.sessionExercises, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter personalRecordsRefs(
      ComposableFilter Function($$PersonalRecordsTableFilterComposer f) f) {
    final $$PersonalRecordsTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.personalRecords,
            getReferencedColumn: (t) => t.exerciseId,
            builder: (joinBuilder, parentComposers) =>
                $$PersonalRecordsTableFilterComposer(ComposerState($state.db,
                    $state.db.personalRecords, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ExercisesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get muscleGroup => $state.composableBuilder(
      column: $state.table.muscleGroup,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get secondaryMuscles => $state.composableBuilder(
      column: $state.table.secondaryMuscles,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get equipment => $state.composableBuilder(
      column: $state.table.equipment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get instructions => $state.composableBuilder(
      column: $state.table.instructions,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCustom => $state.composableBuilder(
      column: $state.table.isCustom,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastSyncedAt => $state.composableBuilder(
      column: $state.table.lastSyncedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$WorkoutPlansTableCreateCompanionBuilder = WorkoutPlansCompanion
    Function({
  required String id,
  required String userId,
  required String name,
  Value<String?> description,
  Value<String?> targetMuscleGroups,
  Value<int?> estimatedDurationMinutes,
  Value<int> sortOrder,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> rowid,
});
typedef $$WorkoutPlansTableUpdateCompanionBuilder = WorkoutPlansCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String> name,
  Value<String?> description,
  Value<String?> targetMuscleGroups,
  Value<int?> estimatedDurationMinutes,
  Value<int> sortOrder,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> rowid,
});

class $$WorkoutPlansTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutPlansTable,
    WorkoutPlanEntity,
    $$WorkoutPlansTableFilterComposer,
    $$WorkoutPlansTableOrderingComposer,
    $$WorkoutPlansTableCreateCompanionBuilder,
    $$WorkoutPlansTableUpdateCompanionBuilder> {
  $$WorkoutPlansTableTableManager(_$AppDatabase db, $WorkoutPlansTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WorkoutPlansTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WorkoutPlansTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> targetMuscleGroups = const Value.absent(),
            Value<int?> estimatedDurationMinutes = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutPlansCompanion(
            id: id,
            userId: userId,
            name: name,
            description: description,
            targetMuscleGroups: targetMuscleGroups,
            estimatedDurationMinutes: estimatedDurationMinutes,
            sortOrder: sortOrder,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> targetMuscleGroups = const Value.absent(),
            Value<int?> estimatedDurationMinutes = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutPlansCompanion.insert(
            id: id,
            userId: userId,
            name: name,
            description: description,
            targetMuscleGroups: targetMuscleGroups,
            estimatedDurationMinutes: estimatedDurationMinutes,
            sortOrder: sortOrder,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            rowid: rowid,
          ),
        ));
}

class $$WorkoutPlansTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get targetMuscleGroups => $state.composableBuilder(
      column: $state.table.targetMuscleGroups,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get estimatedDurationMinutes => $state.composableBuilder(
      column: $state.table.estimatedDurationMinutes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sortOrder => $state.composableBuilder(
      column: $state.table.sortOrder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastSyncedAt => $state.composableBuilder(
      column: $state.table.lastSyncedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter workoutPlanExercisesRefs(
      ComposableFilter Function($$WorkoutPlanExercisesTableFilterComposer f)
          f) {
    final $$WorkoutPlanExercisesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.workoutPlanExercises,
            getReferencedColumn: (t) => t.workoutPlanId,
            builder: (joinBuilder, parentComposers) =>
                $$WorkoutPlanExercisesTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.workoutPlanExercises,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }

  ComposableFilter workoutSessionsRefs(
      ComposableFilter Function($$WorkoutSessionsTableFilterComposer f) f) {
    final $$WorkoutSessionsTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.workoutSessions,
            getReferencedColumn: (t) => t.workoutPlanId,
            builder: (joinBuilder, parentComposers) =>
                $$WorkoutSessionsTableFilterComposer(ComposerState($state.db,
                    $state.db.workoutSessions, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$WorkoutPlansTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get targetMuscleGroups => $state.composableBuilder(
      column: $state.table.targetMuscleGroups,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get estimatedDurationMinutes => $state.composableBuilder(
      column: $state.table.estimatedDurationMinutes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sortOrder => $state.composableBuilder(
      column: $state.table.sortOrder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastSyncedAt => $state.composableBuilder(
      column: $state.table.lastSyncedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$WorkoutPlanExercisesTableCreateCompanionBuilder
    = WorkoutPlanExercisesCompanion Function({
  required String id,
  required String workoutPlanId,
  required String exerciseId,
  Value<int> sortOrder,
  Value<int> targetSets,
  Value<int?> targetReps,
  Value<double?> targetWeight,
  Value<int> restSeconds,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<String?> remoteId,
  Value<int> rowid,
});
typedef $$WorkoutPlanExercisesTableUpdateCompanionBuilder
    = WorkoutPlanExercisesCompanion Function({
  Value<String> id,
  Value<String> workoutPlanId,
  Value<String> exerciseId,
  Value<int> sortOrder,
  Value<int> targetSets,
  Value<int?> targetReps,
  Value<double?> targetWeight,
  Value<int> restSeconds,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<String?> remoteId,
  Value<int> rowid,
});

class $$WorkoutPlanExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutPlanExercisesTable,
    WorkoutPlanExerciseEntity,
    $$WorkoutPlanExercisesTableFilterComposer,
    $$WorkoutPlanExercisesTableOrderingComposer,
    $$WorkoutPlanExercisesTableCreateCompanionBuilder,
    $$WorkoutPlanExercisesTableUpdateCompanionBuilder> {
  $$WorkoutPlanExercisesTableTableManager(
      _$AppDatabase db, $WorkoutPlanExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$WorkoutPlanExercisesTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$WorkoutPlanExercisesTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> workoutPlanId = const Value.absent(),
            Value<String> exerciseId = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<int> targetSets = const Value.absent(),
            Value<int?> targetReps = const Value.absent(),
            Value<double?> targetWeight = const Value.absent(),
            Value<int> restSeconds = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutPlanExercisesCompanion(
            id: id,
            workoutPlanId: workoutPlanId,
            exerciseId: exerciseId,
            sortOrder: sortOrder,
            targetSets: targetSets,
            targetReps: targetReps,
            targetWeight: targetWeight,
            restSeconds: restSeconds,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            remoteId: remoteId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String workoutPlanId,
            required String exerciseId,
            Value<int> sortOrder = const Value.absent(),
            Value<int> targetSets = const Value.absent(),
            Value<int?> targetReps = const Value.absent(),
            Value<double?> targetWeight = const Value.absent(),
            Value<int> restSeconds = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutPlanExercisesCompanion.insert(
            id: id,
            workoutPlanId: workoutPlanId,
            exerciseId: exerciseId,
            sortOrder: sortOrder,
            targetSets: targetSets,
            targetReps: targetReps,
            targetWeight: targetWeight,
            restSeconds: restSeconds,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            remoteId: remoteId,
            rowid: rowid,
          ),
        ));
}

class $$WorkoutPlanExercisesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WorkoutPlanExercisesTable> {
  $$WorkoutPlanExercisesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sortOrder => $state.composableBuilder(
      column: $state.table.sortOrder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get targetSets => $state.composableBuilder(
      column: $state.table.targetSets,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get targetReps => $state.composableBuilder(
      column: $state.table.targetReps,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get targetWeight => $state.composableBuilder(
      column: $state.table.targetWeight,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get restSeconds => $state.composableBuilder(
      column: $state.table.restSeconds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$WorkoutPlansTableFilterComposer get workoutPlanId {
    final $$WorkoutPlansTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutPlanId,
        referencedTable: $state.db.workoutPlans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutPlansTableFilterComposer(ComposerState($state.db,
                $state.db.workoutPlans, joinBuilder, parentComposers)));
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $state.db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExercisesTableFilterComposer(ComposerState(
                $state.db, $state.db.exercises, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$WorkoutPlanExercisesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WorkoutPlanExercisesTable> {
  $$WorkoutPlanExercisesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sortOrder => $state.composableBuilder(
      column: $state.table.sortOrder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get targetSets => $state.composableBuilder(
      column: $state.table.targetSets,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get targetReps => $state.composableBuilder(
      column: $state.table.targetReps,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get targetWeight => $state.composableBuilder(
      column: $state.table.targetWeight,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get restSeconds => $state.composableBuilder(
      column: $state.table.restSeconds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$WorkoutPlansTableOrderingComposer get workoutPlanId {
    final $$WorkoutPlansTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutPlanId,
        referencedTable: $state.db.workoutPlans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutPlansTableOrderingComposer(ComposerState($state.db,
                $state.db.workoutPlans, joinBuilder, parentComposers)));
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $state.db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExercisesTableOrderingComposer(ComposerState(
                $state.db, $state.db.exercises, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$WorkoutSessionsTableCreateCompanionBuilder = WorkoutSessionsCompanion
    Function({
  required String id,
  required String userId,
  Value<String?> workoutPlanId,
  required String name,
  Value<String?> notes,
  required DateTime startedAt,
  Value<DateTime?> completedAt,
  Value<int?> durationSeconds,
  Value<double?> totalVolume,
  Value<int?> totalSets,
  Value<int?> totalReps,
  Value<String> status,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> rowid,
});
typedef $$WorkoutSessionsTableUpdateCompanionBuilder = WorkoutSessionsCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String?> workoutPlanId,
  Value<String> name,
  Value<String?> notes,
  Value<DateTime> startedAt,
  Value<DateTime?> completedAt,
  Value<int?> durationSeconds,
  Value<double?> totalVolume,
  Value<int?> totalSets,
  Value<int?> totalReps,
  Value<String> status,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> rowid,
});

class $$WorkoutSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutSessionsTable,
    WorkoutSessionEntity,
    $$WorkoutSessionsTableFilterComposer,
    $$WorkoutSessionsTableOrderingComposer,
    $$WorkoutSessionsTableCreateCompanionBuilder,
    $$WorkoutSessionsTableUpdateCompanionBuilder> {
  $$WorkoutSessionsTableTableManager(
      _$AppDatabase db, $WorkoutSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WorkoutSessionsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WorkoutSessionsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String?> workoutPlanId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<int?> durationSeconds = const Value.absent(),
            Value<double?> totalVolume = const Value.absent(),
            Value<int?> totalSets = const Value.absent(),
            Value<int?> totalReps = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutSessionsCompanion(
            id: id,
            userId: userId,
            workoutPlanId: workoutPlanId,
            name: name,
            notes: notes,
            startedAt: startedAt,
            completedAt: completedAt,
            durationSeconds: durationSeconds,
            totalVolume: totalVolume,
            totalSets: totalSets,
            totalReps: totalReps,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            Value<String?> workoutPlanId = const Value.absent(),
            required String name,
            Value<String?> notes = const Value.absent(),
            required DateTime startedAt,
            Value<DateTime?> completedAt = const Value.absent(),
            Value<int?> durationSeconds = const Value.absent(),
            Value<double?> totalVolume = const Value.absent(),
            Value<int?> totalSets = const Value.absent(),
            Value<int?> totalReps = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutSessionsCompanion.insert(
            id: id,
            userId: userId,
            workoutPlanId: workoutPlanId,
            name: name,
            notes: notes,
            startedAt: startedAt,
            completedAt: completedAt,
            durationSeconds: durationSeconds,
            totalVolume: totalVolume,
            totalSets: totalSets,
            totalReps: totalReps,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            rowid: rowid,
          ),
        ));
}

class $$WorkoutSessionsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startedAt => $state.composableBuilder(
      column: $state.table.startedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get durationSeconds => $state.composableBuilder(
      column: $state.table.durationSeconds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalVolume => $state.composableBuilder(
      column: $state.table.totalVolume,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get totalSets => $state.composableBuilder(
      column: $state.table.totalSets,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get totalReps => $state.composableBuilder(
      column: $state.table.totalReps,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastSyncedAt => $state.composableBuilder(
      column: $state.table.lastSyncedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  $$WorkoutPlansTableFilterComposer get workoutPlanId {
    final $$WorkoutPlansTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutPlanId,
        referencedTable: $state.db.workoutPlans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutPlansTableFilterComposer(ComposerState($state.db,
                $state.db.workoutPlans, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter sessionExercisesRefs(
      ComposableFilter Function($$SessionExercisesTableFilterComposer f) f) {
    final $$SessionExercisesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.sessionExercises,
            getReferencedColumn: (t) => t.sessionId,
            builder: (joinBuilder, parentComposers) =>
                $$SessionExercisesTableFilterComposer(ComposerState($state.db,
                    $state.db.sessionExercises, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$WorkoutSessionsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startedAt => $state.composableBuilder(
      column: $state.table.startedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get durationSeconds => $state.composableBuilder(
      column: $state.table.durationSeconds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalVolume => $state.composableBuilder(
      column: $state.table.totalVolume,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get totalSets => $state.composableBuilder(
      column: $state.table.totalSets,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get totalReps => $state.composableBuilder(
      column: $state.table.totalReps,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastSyncedAt => $state.composableBuilder(
      column: $state.table.lastSyncedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  $$WorkoutPlansTableOrderingComposer get workoutPlanId {
    final $$WorkoutPlansTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutPlanId,
        referencedTable: $state.db.workoutPlans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutPlansTableOrderingComposer(ComposerState($state.db,
                $state.db.workoutPlans, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$SessionExercisesTableCreateCompanionBuilder
    = SessionExercisesCompanion Function({
  required String id,
  required String sessionId,
  required String exerciseId,
  Value<int> sortOrder,
  Value<String?> notes,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<String?> remoteId,
  Value<int> rowid,
});
typedef $$SessionExercisesTableUpdateCompanionBuilder
    = SessionExercisesCompanion Function({
  Value<String> id,
  Value<String> sessionId,
  Value<String> exerciseId,
  Value<int> sortOrder,
  Value<String?> notes,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<String?> remoteId,
  Value<int> rowid,
});

class $$SessionExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SessionExercisesTable,
    SessionExerciseEntity,
    $$SessionExercisesTableFilterComposer,
    $$SessionExercisesTableOrderingComposer,
    $$SessionExercisesTableCreateCompanionBuilder,
    $$SessionExercisesTableUpdateCompanionBuilder> {
  $$SessionExercisesTableTableManager(
      _$AppDatabase db, $SessionExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SessionExercisesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SessionExercisesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> sessionId = const Value.absent(),
            Value<String> exerciseId = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionExercisesCompanion(
            id: id,
            sessionId: sessionId,
            exerciseId: exerciseId,
            sortOrder: sortOrder,
            notes: notes,
            startedAt: startedAt,
            completedAt: completedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            remoteId: remoteId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String sessionId,
            required String exerciseId,
            Value<int> sortOrder = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionExercisesCompanion.insert(
            id: id,
            sessionId: sessionId,
            exerciseId: exerciseId,
            sortOrder: sortOrder,
            notes: notes,
            startedAt: startedAt,
            completedAt: completedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            remoteId: remoteId,
            rowid: rowid,
          ),
        ));
}

class $$SessionExercisesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SessionExercisesTable> {
  $$SessionExercisesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sortOrder => $state.composableBuilder(
      column: $state.table.sortOrder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startedAt => $state.composableBuilder(
      column: $state.table.startedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$WorkoutSessionsTableFilterComposer get sessionId {
    final $$WorkoutSessionsTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.sessionId,
            referencedTable: $state.db.workoutSessions,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$WorkoutSessionsTableFilterComposer(ComposerState($state.db,
                    $state.db.workoutSessions, joinBuilder, parentComposers)));
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $state.db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExercisesTableFilterComposer(ComposerState(
                $state.db, $state.db.exercises, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter workoutSetsRefs(
      ComposableFilter Function($$WorkoutSetsTableFilterComposer f) f) {
    final $$WorkoutSetsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.workoutSets,
        getReferencedColumn: (t) => t.sessionExerciseId,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutSetsTableFilterComposer(ComposerState($state.db,
                $state.db.workoutSets, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$SessionExercisesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SessionExercisesTable> {
  $$SessionExercisesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sortOrder => $state.composableBuilder(
      column: $state.table.sortOrder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startedAt => $state.composableBuilder(
      column: $state.table.startedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$WorkoutSessionsTableOrderingComposer get sessionId {
    final $$WorkoutSessionsTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.sessionId,
            referencedTable: $state.db.workoutSessions,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$WorkoutSessionsTableOrderingComposer(ComposerState($state.db,
                    $state.db.workoutSessions, joinBuilder, parentComposers)));
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $state.db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExercisesTableOrderingComposer(ComposerState(
                $state.db, $state.db.exercises, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$WorkoutSetsTableCreateCompanionBuilder = WorkoutSetsCompanion
    Function({
  required String id,
  required String sessionExerciseId,
  required int setNumber,
  Value<int?> reps,
  Value<double?> weight,
  Value<int?> durationSeconds,
  Value<double?> distance,
  Value<int?> restSeconds,
  Value<String> setType,
  Value<double?> rpe,
  Value<bool> isCompleted,
  Value<String?> notes,
  Value<DateTime?> completedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<String?> remoteId,
  Value<int> rowid,
});
typedef $$WorkoutSetsTableUpdateCompanionBuilder = WorkoutSetsCompanion
    Function({
  Value<String> id,
  Value<String> sessionExerciseId,
  Value<int> setNumber,
  Value<int?> reps,
  Value<double?> weight,
  Value<int?> durationSeconds,
  Value<double?> distance,
  Value<int?> restSeconds,
  Value<String> setType,
  Value<double?> rpe,
  Value<bool> isCompleted,
  Value<String?> notes,
  Value<DateTime?> completedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<String?> remoteId,
  Value<int> rowid,
});

class $$WorkoutSetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutSetsTable,
    WorkoutSetEntity,
    $$WorkoutSetsTableFilterComposer,
    $$WorkoutSetsTableOrderingComposer,
    $$WorkoutSetsTableCreateCompanionBuilder,
    $$WorkoutSetsTableUpdateCompanionBuilder> {
  $$WorkoutSetsTableTableManager(_$AppDatabase db, $WorkoutSetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WorkoutSetsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WorkoutSetsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> sessionExerciseId = const Value.absent(),
            Value<int> setNumber = const Value.absent(),
            Value<int?> reps = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<int?> durationSeconds = const Value.absent(),
            Value<double?> distance = const Value.absent(),
            Value<int?> restSeconds = const Value.absent(),
            Value<String> setType = const Value.absent(),
            Value<double?> rpe = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutSetsCompanion(
            id: id,
            sessionExerciseId: sessionExerciseId,
            setNumber: setNumber,
            reps: reps,
            weight: weight,
            durationSeconds: durationSeconds,
            distance: distance,
            restSeconds: restSeconds,
            setType: setType,
            rpe: rpe,
            isCompleted: isCompleted,
            notes: notes,
            completedAt: completedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            remoteId: remoteId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String sessionExerciseId,
            required int setNumber,
            Value<int?> reps = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<int?> durationSeconds = const Value.absent(),
            Value<double?> distance = const Value.absent(),
            Value<int?> restSeconds = const Value.absent(),
            Value<String> setType = const Value.absent(),
            Value<double?> rpe = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutSetsCompanion.insert(
            id: id,
            sessionExerciseId: sessionExerciseId,
            setNumber: setNumber,
            reps: reps,
            weight: weight,
            durationSeconds: durationSeconds,
            distance: distance,
            restSeconds: restSeconds,
            setType: setType,
            rpe: rpe,
            isCompleted: isCompleted,
            notes: notes,
            completedAt: completedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            remoteId: remoteId,
            rowid: rowid,
          ),
        ));
}

class $$WorkoutSetsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WorkoutSetsTable> {
  $$WorkoutSetsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get setNumber => $state.composableBuilder(
      column: $state.table.setNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get reps => $state.composableBuilder(
      column: $state.table.reps,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get durationSeconds => $state.composableBuilder(
      column: $state.table.durationSeconds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get distance => $state.composableBuilder(
      column: $state.table.distance,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get restSeconds => $state.composableBuilder(
      column: $state.table.restSeconds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get setType => $state.composableBuilder(
      column: $state.table.setType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get rpe => $state.composableBuilder(
      column: $state.table.rpe,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$SessionExercisesTableFilterComposer get sessionExerciseId {
    final $$SessionExercisesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.sessionExerciseId,
            referencedTable: $state.db.sessionExercises,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$SessionExercisesTableFilterComposer(ComposerState($state.db,
                    $state.db.sessionExercises, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter personalRecordsRefs(
      ComposableFilter Function($$PersonalRecordsTableFilterComposer f) f) {
    final $$PersonalRecordsTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.personalRecords,
            getReferencedColumn: (t) => t.setId,
            builder: (joinBuilder, parentComposers) =>
                $$PersonalRecordsTableFilterComposer(ComposerState($state.db,
                    $state.db.personalRecords, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$WorkoutSetsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WorkoutSetsTable> {
  $$WorkoutSetsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get setNumber => $state.composableBuilder(
      column: $state.table.setNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get reps => $state.composableBuilder(
      column: $state.table.reps,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get durationSeconds => $state.composableBuilder(
      column: $state.table.durationSeconds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get distance => $state.composableBuilder(
      column: $state.table.distance,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get restSeconds => $state.composableBuilder(
      column: $state.table.restSeconds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get setType => $state.composableBuilder(
      column: $state.table.setType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get rpe => $state.composableBuilder(
      column: $state.table.rpe,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$SessionExercisesTableOrderingComposer get sessionExerciseId {
    final $$SessionExercisesTableOrderingComposer composer = $state
        .composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.sessionExerciseId,
            referencedTable: $state.db.sessionExercises,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$SessionExercisesTableOrderingComposer(ComposerState($state.db,
                    $state.db.sessionExercises, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$PersonalRecordsTableCreateCompanionBuilder = PersonalRecordsCompanion
    Function({
  required String id,
  required String userId,
  required String exerciseId,
  required String recordType,
  required double value,
  Value<int?> reps,
  Value<String?> setId,
  required DateTime achievedAt,
  Value<bool> isCurrentRecord,
  Value<DateTime> createdAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<String?> remoteId,
  Value<int> rowid,
});
typedef $$PersonalRecordsTableUpdateCompanionBuilder = PersonalRecordsCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String> exerciseId,
  Value<String> recordType,
  Value<double> value,
  Value<int?> reps,
  Value<String?> setId,
  Value<DateTime> achievedAt,
  Value<bool> isCurrentRecord,
  Value<DateTime> createdAt,
  Value<bool> isDirty,
  Value<int> syncVersion,
  Value<String?> remoteId,
  Value<int> rowid,
});

class $$PersonalRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PersonalRecordsTable,
    PersonalRecordEntity,
    $$PersonalRecordsTableFilterComposer,
    $$PersonalRecordsTableOrderingComposer,
    $$PersonalRecordsTableCreateCompanionBuilder,
    $$PersonalRecordsTableUpdateCompanionBuilder> {
  $$PersonalRecordsTableTableManager(
      _$AppDatabase db, $PersonalRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PersonalRecordsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PersonalRecordsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> exerciseId = const Value.absent(),
            Value<String> recordType = const Value.absent(),
            Value<double> value = const Value.absent(),
            Value<int?> reps = const Value.absent(),
            Value<String?> setId = const Value.absent(),
            Value<DateTime> achievedAt = const Value.absent(),
            Value<bool> isCurrentRecord = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PersonalRecordsCompanion(
            id: id,
            userId: userId,
            exerciseId: exerciseId,
            recordType: recordType,
            value: value,
            reps: reps,
            setId: setId,
            achievedAt: achievedAt,
            isCurrentRecord: isCurrentRecord,
            createdAt: createdAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            remoteId: remoteId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String exerciseId,
            required String recordType,
            required double value,
            Value<int?> reps = const Value.absent(),
            Value<String?> setId = const Value.absent(),
            required DateTime achievedAt,
            Value<bool> isCurrentRecord = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<int> syncVersion = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PersonalRecordsCompanion.insert(
            id: id,
            userId: userId,
            exerciseId: exerciseId,
            recordType: recordType,
            value: value,
            reps: reps,
            setId: setId,
            achievedAt: achievedAt,
            isCurrentRecord: isCurrentRecord,
            createdAt: createdAt,
            isDirty: isDirty,
            syncVersion: syncVersion,
            remoteId: remoteId,
            rowid: rowid,
          ),
        ));
}

class $$PersonalRecordsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PersonalRecordsTable> {
  $$PersonalRecordsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get recordType => $state.composableBuilder(
      column: $state.table.recordType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get reps => $state.composableBuilder(
      column: $state.table.reps,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get achievedAt => $state.composableBuilder(
      column: $state.table.achievedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCurrentRecord => $state.composableBuilder(
      column: $state.table.isCurrentRecord,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $state.db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExercisesTableFilterComposer(ComposerState(
                $state.db, $state.db.exercises, joinBuilder, parentComposers)));
    return composer;
  }

  $$WorkoutSetsTableFilterComposer get setId {
    final $$WorkoutSetsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.setId,
        referencedTable: $state.db.workoutSets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutSetsTableFilterComposer(ComposerState($state.db,
                $state.db.workoutSets, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$PersonalRecordsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PersonalRecordsTable> {
  $$PersonalRecordsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get recordType => $state.composableBuilder(
      column: $state.table.recordType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get reps => $state.composableBuilder(
      column: $state.table.reps,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get achievedAt => $state.composableBuilder(
      column: $state.table.achievedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCurrentRecord => $state.composableBuilder(
      column: $state.table.isCurrentRecord,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDirty => $state.composableBuilder(
      column: $state.table.isDirty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get syncVersion => $state.composableBuilder(
      column: $state.table.syncVersion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $state.db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExercisesTableOrderingComposer(ComposerState(
                $state.db, $state.db.exercises, joinBuilder, parentComposers)));
    return composer;
  }

  $$WorkoutSetsTableOrderingComposer get setId {
    final $$WorkoutSetsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.setId,
        referencedTable: $state.db.workoutSets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutSetsTableOrderingComposer(ComposerState($state.db,
                $state.db.workoutSets, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$SyncQueueTableCreateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  required String targetTable,
  required String recordId,
  required String operation,
  Value<int> retryCount,
  Value<DateTime> createdAt,
  Value<DateTime?> lastAttemptAt,
  Value<String?> errorMessage,
});
typedef $$SyncQueueTableUpdateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  Value<String> targetTable,
  Value<String> recordId,
  Value<String> operation,
  Value<int> retryCount,
  Value<DateTime> createdAt,
  Value<DateTime?> lastAttemptAt,
  Value<String?> errorMessage,
});

class $$SyncQueueTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncQueueTable,
    SyncQueueEntity,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder> {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SyncQueueTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SyncQueueTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> targetTable = const Value.absent(),
            Value<String> recordId = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastAttemptAt = const Value.absent(),
            Value<String?> errorMessage = const Value.absent(),
          }) =>
              SyncQueueCompanion(
            id: id,
            targetTable: targetTable,
            recordId: recordId,
            operation: operation,
            retryCount: retryCount,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
            errorMessage: errorMessage,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String targetTable,
            required String recordId,
            required String operation,
            Value<int> retryCount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastAttemptAt = const Value.absent(),
            Value<String?> errorMessage = const Value.absent(),
          }) =>
              SyncQueueCompanion.insert(
            id: id,
            targetTable: targetTable,
            recordId: recordId,
            operation: operation,
            retryCount: retryCount,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
            errorMessage: errorMessage,
          ),
        ));
}

class $$SyncQueueTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get targetTable => $state.composableBuilder(
      column: $state.table.targetTable,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get recordId => $state.composableBuilder(
      column: $state.table.recordId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get operation => $state.composableBuilder(
      column: $state.table.operation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get retryCount => $state.composableBuilder(
      column: $state.table.retryCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastAttemptAt => $state.composableBuilder(
      column: $state.table.lastAttemptAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get errorMessage => $state.composableBuilder(
      column: $state.table.errorMessage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SyncQueueTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get targetTable => $state.composableBuilder(
      column: $state.table.targetTable,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get recordId => $state.composableBuilder(
      column: $state.table.recordId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get operation => $state.composableBuilder(
      column: $state.table.operation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get retryCount => $state.composableBuilder(
      column: $state.table.retryCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastAttemptAt => $state.composableBuilder(
      column: $state.table.lastAttemptAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get errorMessage => $state.composableBuilder(
      column: $state.table.errorMessage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  required String key,
  required String value,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<String> key,
  Value<String> value,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$AppSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSettingEntity,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder> {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AppSettingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AppSettingsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$AppSettingsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer(super.$state);
  ColumnFilters<String> get key => $state.composableBuilder(
      column: $state.table.key,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AppSettingsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get key => $state.composableBuilder(
      column: $state.table.key,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$WorkoutPlansTableTableManager get workoutPlans =>
      $$WorkoutPlansTableTableManager(_db, _db.workoutPlans);
  $$WorkoutPlanExercisesTableTableManager get workoutPlanExercises =>
      $$WorkoutPlanExercisesTableTableManager(_db, _db.workoutPlanExercises);
  $$WorkoutSessionsTableTableManager get workoutSessions =>
      $$WorkoutSessionsTableTableManager(_db, _db.workoutSessions);
  $$SessionExercisesTableTableManager get sessionExercises =>
      $$SessionExercisesTableTableManager(_db, _db.sessionExercises);
  $$WorkoutSetsTableTableManager get workoutSets =>
      $$WorkoutSetsTableTableManager(_db, _db.workoutSets);
  $$PersonalRecordsTableTableManager get personalRecords =>
      $$PersonalRecordsTableTableManager(_db, _db.personalRecords);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
