// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketEntity _$TicketEntityFromJson(Map<String, dynamic> json) {
  return _TicketEntity.fromJson(json);
}

/// @nodoc
mixin _$TicketEntity {
  String get id => throw _privateConstructorUsedError;
  UserEntity get requestedBy => throw _privateConstructorUsedError;
  UserEntity get createdBy => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  List<TicketDetailEntity> get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketEntityCopyWith<TicketEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketEntityCopyWith<$Res> {
  factory $TicketEntityCopyWith(
          TicketEntity value, $Res Function(TicketEntity) then) =
      _$TicketEntityCopyWithImpl<$Res, TicketEntity>;
  @useResult
  $Res call(
      {String id,
      UserEntity requestedBy,
      UserEntity createdBy,
      String? note,
      @JsonKey(name: "created_at") DateTime createdAt,
      String code,
      bool active,
      List<TicketDetailEntity> details});

  $UserEntityCopyWith<$Res> get requestedBy;
  $UserEntityCopyWith<$Res> get createdBy;
}

/// @nodoc
class _$TicketEntityCopyWithImpl<$Res, $Val extends TicketEntity>
    implements $TicketEntityCopyWith<$Res> {
  _$TicketEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestedBy = null,
    Object? createdBy = null,
    Object? note = freezed,
    Object? createdAt = null,
    Object? code = null,
    Object? active = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      requestedBy: null == requestedBy
          ? _value.requestedBy
          : requestedBy // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<TicketDetailEntity>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get requestedBy {
    return $UserEntityCopyWith<$Res>(_value.requestedBy, (value) {
      return _then(_value.copyWith(requestedBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get createdBy {
    return $UserEntityCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TicketEntityImplCopyWith<$Res>
    implements $TicketEntityCopyWith<$Res> {
  factory _$$TicketEntityImplCopyWith(
          _$TicketEntityImpl value, $Res Function(_$TicketEntityImpl) then) =
      __$$TicketEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      UserEntity requestedBy,
      UserEntity createdBy,
      String? note,
      @JsonKey(name: "created_at") DateTime createdAt,
      String code,
      bool active,
      List<TicketDetailEntity> details});

  @override
  $UserEntityCopyWith<$Res> get requestedBy;
  @override
  $UserEntityCopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$TicketEntityImplCopyWithImpl<$Res>
    extends _$TicketEntityCopyWithImpl<$Res, _$TicketEntityImpl>
    implements _$$TicketEntityImplCopyWith<$Res> {
  __$$TicketEntityImplCopyWithImpl(
      _$TicketEntityImpl _value, $Res Function(_$TicketEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestedBy = null,
    Object? createdBy = null,
    Object? note = freezed,
    Object? createdAt = null,
    Object? code = null,
    Object? active = null,
    Object? details = null,
  }) {
    return _then(_$TicketEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      requestedBy: null == requestedBy
          ? _value.requestedBy
          : requestedBy // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<TicketDetailEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketEntityImpl implements _TicketEntity {
  const _$TicketEntityImpl(
      {required this.id,
      required this.requestedBy,
      required this.createdBy,
      this.note = null,
      @JsonKey(name: "created_at") required this.createdAt,
      required this.code,
      required this.active,
      final List<TicketDetailEntity> details = const []})
      : _details = details;

  factory _$TicketEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketEntityImplFromJson(json);

  @override
  final String id;
  @override
  final UserEntity requestedBy;
  @override
  final UserEntity createdBy;
  @override
  @JsonKey()
  final String? note;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  final String code;
  @override
  final bool active;
  final List<TicketDetailEntity> _details;
  @override
  @JsonKey()
  List<TicketDetailEntity> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'TicketEntity(id: $id, requestedBy: $requestedBy, createdBy: $createdBy, note: $note, createdAt: $createdAt, code: $code, active: $active, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requestedBy, requestedBy) ||
                other.requestedBy == requestedBy) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, requestedBy, createdBy, note,
      createdAt, code, active, const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketEntityImplCopyWith<_$TicketEntityImpl> get copyWith =>
      __$$TicketEntityImplCopyWithImpl<_$TicketEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketEntityImplToJson(
      this,
    );
  }
}

abstract class _TicketEntity implements TicketEntity {
  const factory _TicketEntity(
      {required final String id,
      required final UserEntity requestedBy,
      required final UserEntity createdBy,
      final String? note,
      @JsonKey(name: "created_at") required final DateTime createdAt,
      required final String code,
      required final bool active,
      final List<TicketDetailEntity> details}) = _$TicketEntityImpl;

  factory _TicketEntity.fromJson(Map<String, dynamic> json) =
      _$TicketEntityImpl.fromJson;

  @override
  String get id;
  @override
  UserEntity get requestedBy;
  @override
  UserEntity get createdBy;
  @override
  String? get note;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  String get code;
  @override
  bool get active;
  @override
  List<TicketDetailEntity> get details;
  @override
  @JsonKey(ignore: true)
  _$$TicketEntityImplCopyWith<_$TicketEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
