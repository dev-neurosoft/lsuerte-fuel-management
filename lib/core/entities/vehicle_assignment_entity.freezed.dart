// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_assignment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleAssignmentEntity _$VehicleAssignmentEntityFromJson(
    Map<String, dynamic> json) {
  return _VehicleAssignmentEntity.fromJson(json);
}

/// @nodoc
mixin _$VehicleAssignmentEntity {
  String get id => throw _privateConstructorUsedError;
  VehicleEntity get vehicle => throw _privateConstructorUsedError;
  UserEntity get user => throw _privateConstructorUsedError;
  num get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleAssignmentEntityCopyWith<VehicleAssignmentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleAssignmentEntityCopyWith<$Res> {
  factory $VehicleAssignmentEntityCopyWith(VehicleAssignmentEntity value,
          $Res Function(VehicleAssignmentEntity) then) =
      _$VehicleAssignmentEntityCopyWithImpl<$Res, VehicleAssignmentEntity>;
  @useResult
  $Res call({String id, VehicleEntity vehicle, UserEntity user, num quantity});

  $VehicleEntityCopyWith<$Res> get vehicle;
  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$VehicleAssignmentEntityCopyWithImpl<$Res,
        $Val extends VehicleAssignmentEntity>
    implements $VehicleAssignmentEntityCopyWith<$Res> {
  _$VehicleAssignmentEntityCopyWithImpl(this._value, this._then);

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
    Object? quantity = null,
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
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
}

/// @nodoc
abstract class _$$VehicleAssignmentEntityImplCopyWith<$Res>
    implements $VehicleAssignmentEntityCopyWith<$Res> {
  factory _$$VehicleAssignmentEntityImplCopyWith(
          _$VehicleAssignmentEntityImpl value,
          $Res Function(_$VehicleAssignmentEntityImpl) then) =
      __$$VehicleAssignmentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, VehicleEntity vehicle, UserEntity user, num quantity});

  @override
  $VehicleEntityCopyWith<$Res> get vehicle;
  @override
  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$VehicleAssignmentEntityImplCopyWithImpl<$Res>
    extends _$VehicleAssignmentEntityCopyWithImpl<$Res,
        _$VehicleAssignmentEntityImpl>
    implements _$$VehicleAssignmentEntityImplCopyWith<$Res> {
  __$$VehicleAssignmentEntityImplCopyWithImpl(
      _$VehicleAssignmentEntityImpl _value,
      $Res Function(_$VehicleAssignmentEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicle = null,
    Object? user = null,
    Object? quantity = null,
  }) {
    return _then(_$VehicleAssignmentEntityImpl(
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleAssignmentEntityImpl implements _VehicleAssignmentEntity {
  const _$VehicleAssignmentEntityImpl(
      {required this.id,
      required this.vehicle,
      required this.user,
      required this.quantity});

  factory _$VehicleAssignmentEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleAssignmentEntityImplFromJson(json);

  @override
  final String id;
  @override
  final VehicleEntity vehicle;
  @override
  final UserEntity user;
  @override
  final num quantity;

  @override
  String toString() {
    return 'VehicleAssignmentEntity(id: $id, vehicle: $vehicle, user: $user, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleAssignmentEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, vehicle, user, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleAssignmentEntityImplCopyWith<_$VehicleAssignmentEntityImpl>
      get copyWith => __$$VehicleAssignmentEntityImplCopyWithImpl<
          _$VehicleAssignmentEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleAssignmentEntityImplToJson(
      this,
    );
  }
}

abstract class _VehicleAssignmentEntity implements VehicleAssignmentEntity {
  const factory _VehicleAssignmentEntity(
      {required final String id,
      required final VehicleEntity vehicle,
      required final UserEntity user,
      required final num quantity}) = _$VehicleAssignmentEntityImpl;

  factory _VehicleAssignmentEntity.fromJson(Map<String, dynamic> json) =
      _$VehicleAssignmentEntityImpl.fromJson;

  @override
  String get id;
  @override
  VehicleEntity get vehicle;
  @override
  UserEntity get user;
  @override
  num get quantity;
  @override
  @JsonKey(ignore: true)
  _$$VehicleAssignmentEntityImplCopyWith<_$VehicleAssignmentEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
