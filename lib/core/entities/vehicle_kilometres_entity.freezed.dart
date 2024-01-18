// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_kilometres_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleKilometresEntity _$VehicleKilometresEntityFromJson(
    Map<String, dynamic> json) {
  return _VehicleKilometresEntity.fromJson(json);
}

/// @nodoc
mixin _$VehicleKilometresEntity {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicles")
  VehicleEntity get vehicle => throw _privateConstructorUsedError;
  @JsonKey(name: "users")
  UserEntity get user => throw _privateConstructorUsedError;
  @JsonKey(name: "effective_date")
  DateTime get effectiveDate => throw _privateConstructorUsedError;
  @JsonKey(name: "in_kilometres")
  num get inKilometres => throw _privateConstructorUsedError;
  @JsonKey(name: "out_kilometres")
  num? get outKilometres => throw _privateConstructorUsedError;
  @JsonKey(name: "createdBy")
  UserEntity get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleKilometresEntityCopyWith<VehicleKilometresEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleKilometresEntityCopyWith<$Res> {
  factory $VehicleKilometresEntityCopyWith(VehicleKilometresEntity value,
          $Res Function(VehicleKilometresEntity) then) =
      _$VehicleKilometresEntityCopyWithImpl<$Res, VehicleKilometresEntity>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "vehicles") VehicleEntity vehicle,
      @JsonKey(name: "users") UserEntity user,
      @JsonKey(name: "effective_date") DateTime effectiveDate,
      @JsonKey(name: "in_kilometres") num inKilometres,
      @JsonKey(name: "out_kilometres") num? outKilometres,
      @JsonKey(name: "createdBy") UserEntity createdBy,
      @JsonKey(name: "created_at") DateTime createdAt});

  $VehicleEntityCopyWith<$Res> get vehicle;
  $UserEntityCopyWith<$Res> get user;
  $UserEntityCopyWith<$Res> get createdBy;
}

/// @nodoc
class _$VehicleKilometresEntityCopyWithImpl<$Res,
        $Val extends VehicleKilometresEntity>
    implements $VehicleKilometresEntityCopyWith<$Res> {
  _$VehicleKilometresEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicle = null,
    Object? user = null,
    Object? effectiveDate = null,
    Object? inKilometres = null,
    Object? outKilometres = freezed,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleEntity,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      effectiveDate: null == effectiveDate
          ? _value.effectiveDate
          : effectiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inKilometres: null == inKilometres
          ? _value.inKilometres
          : inKilometres // ignore: cast_nullable_to_non_nullable
              as num,
      outKilometres: freezed == outKilometres
          ? _value.outKilometres
          : outKilometres // ignore: cast_nullable_to_non_nullable
              as num?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleEntityCopyWith<$Res> get vehicle {
    return $VehicleEntityCopyWith<$Res>(_value.vehicle, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get user {
    return $UserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
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
abstract class _$$VehicleKilometresEntityImplCopyWith<$Res>
    implements $VehicleKilometresEntityCopyWith<$Res> {
  factory _$$VehicleKilometresEntityImplCopyWith(
          _$VehicleKilometresEntityImpl value,
          $Res Function(_$VehicleKilometresEntityImpl) then) =
      __$$VehicleKilometresEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "vehicles") VehicleEntity vehicle,
      @JsonKey(name: "users") UserEntity user,
      @JsonKey(name: "effective_date") DateTime effectiveDate,
      @JsonKey(name: "in_kilometres") num inKilometres,
      @JsonKey(name: "out_kilometres") num? outKilometres,
      @JsonKey(name: "createdBy") UserEntity createdBy,
      @JsonKey(name: "created_at") DateTime createdAt});

  @override
  $VehicleEntityCopyWith<$Res> get vehicle;
  @override
  $UserEntityCopyWith<$Res> get user;
  @override
  $UserEntityCopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$VehicleKilometresEntityImplCopyWithImpl<$Res>
    extends _$VehicleKilometresEntityCopyWithImpl<$Res,
        _$VehicleKilometresEntityImpl>
    implements _$$VehicleKilometresEntityImplCopyWith<$Res> {
  __$$VehicleKilometresEntityImplCopyWithImpl(
      _$VehicleKilometresEntityImpl _value,
      $Res Function(_$VehicleKilometresEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicle = null,
    Object? user = null,
    Object? effectiveDate = null,
    Object? inKilometres = null,
    Object? outKilometres = freezed,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_$VehicleKilometresEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleEntity,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      effectiveDate: null == effectiveDate
          ? _value.effectiveDate
          : effectiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inKilometres: null == inKilometres
          ? _value.inKilometres
          : inKilometres // ignore: cast_nullable_to_non_nullable
              as num,
      outKilometres: freezed == outKilometres
          ? _value.outKilometres
          : outKilometres // ignore: cast_nullable_to_non_nullable
              as num?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleKilometresEntityImpl implements _VehicleKilometresEntity {
  const _$VehicleKilometresEntityImpl(
      {required this.id,
      @JsonKey(name: "vehicles") required this.vehicle,
      @JsonKey(name: "users") required this.user,
      @JsonKey(name: "effective_date") required this.effectiveDate,
      @JsonKey(name: "in_kilometres") required this.inKilometres,
      @JsonKey(name: "out_kilometres") required this.outKilometres,
      @JsonKey(name: "createdBy") required this.createdBy,
      @JsonKey(name: "created_at") required this.createdAt});

  factory _$VehicleKilometresEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleKilometresEntityImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "vehicles")
  final VehicleEntity vehicle;
  @override
  @JsonKey(name: "users")
  final UserEntity user;
  @override
  @JsonKey(name: "effective_date")
  final DateTime effectiveDate;
  @override
  @JsonKey(name: "in_kilometres")
  final num inKilometres;
  @override
  @JsonKey(name: "out_kilometres")
  final num? outKilometres;
  @override
  @JsonKey(name: "createdBy")
  final UserEntity createdBy;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'VehicleKilometresEntity(id: $id, vehicle: $vehicle, user: $user, effectiveDate: $effectiveDate, inKilometres: $inKilometres, outKilometres: $outKilometres, createdBy: $createdBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleKilometresEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.effectiveDate, effectiveDate) ||
                other.effectiveDate == effectiveDate) &&
            (identical(other.inKilometres, inKilometres) ||
                other.inKilometres == inKilometres) &&
            (identical(other.outKilometres, outKilometres) ||
                other.outKilometres == outKilometres) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, vehicle, user, effectiveDate,
      inKilometres, outKilometres, createdBy, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleKilometresEntityImplCopyWith<_$VehicleKilometresEntityImpl>
      get copyWith => __$$VehicleKilometresEntityImplCopyWithImpl<
          _$VehicleKilometresEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleKilometresEntityImplToJson(
      this,
    );
  }
}

abstract class _VehicleKilometresEntity implements VehicleKilometresEntity {
  const factory _VehicleKilometresEntity(
      {required final String id,
      @JsonKey(name: "vehicles") required final VehicleEntity vehicle,
      @JsonKey(name: "users") required final UserEntity user,
      @JsonKey(name: "effective_date") required final DateTime effectiveDate,
      @JsonKey(name: "in_kilometres") required final num inKilometres,
      @JsonKey(name: "out_kilometres") required final num? outKilometres,
      @JsonKey(name: "createdBy") required final UserEntity createdBy,
      @JsonKey(name: "created_at")
      required final DateTime createdAt}) = _$VehicleKilometresEntityImpl;

  factory _VehicleKilometresEntity.fromJson(Map<String, dynamic> json) =
      _$VehicleKilometresEntityImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "vehicles")
  VehicleEntity get vehicle;
  @override
  @JsonKey(name: "users")
  UserEntity get user;
  @override
  @JsonKey(name: "effective_date")
  DateTime get effectiveDate;
  @override
  @JsonKey(name: "in_kilometres")
  num get inKilometres;
  @override
  @JsonKey(name: "out_kilometres")
  num? get outKilometres;
  @override
  @JsonKey(name: "createdBy")
  UserEntity get createdBy;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$VehicleKilometresEntityImplCopyWith<_$VehicleKilometresEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
