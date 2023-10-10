// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketDetailEntity _$TicketDetailEntityFromJson(Map<String, dynamic> json) {
  return _TicketDetailEntity.fromJson(json);
}

/// @nodoc
mixin _$TicketDetailEntity {
  VehicleEntity get vehicle => throw _privateConstructorUsedError;
  BettingBankEntity? get bettingBank => throw _privateConstructorUsedError;
  FuelEntity get fuel => throw _privateConstructorUsedError;
  UserEntity get user => throw _privateConstructorUsedError;
  @JsonKey(name: "fuel_quantity")
  num get quantity => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketDetailEntityCopyWith<TicketDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketDetailEntityCopyWith<$Res> {
  factory $TicketDetailEntityCopyWith(
          TicketDetailEntity value, $Res Function(TicketDetailEntity) then) =
      _$TicketDetailEntityCopyWithImpl<$Res, TicketDetailEntity>;
  @useResult
  $Res call(
      {VehicleEntity vehicle,
      BettingBankEntity? bettingBank,
      FuelEntity fuel,
      UserEntity user,
      @JsonKey(name: "fuel_quantity") num quantity,
      String? note});

  $VehicleEntityCopyWith<$Res> get vehicle;
  $BettingBankEntityCopyWith<$Res>? get bettingBank;
  $FuelEntityCopyWith<$Res> get fuel;
  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$TicketDetailEntityCopyWithImpl<$Res, $Val extends TicketDetailEntity>
    implements $TicketDetailEntityCopyWith<$Res> {
  _$TicketDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicle = null,
    Object? bettingBank = freezed,
    Object? fuel = null,
    Object? user = null,
    Object? quantity = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleEntity,
      bettingBank: freezed == bettingBank
          ? _value.bettingBank
          : bettingBank // ignore: cast_nullable_to_non_nullable
              as BettingBankEntity?,
      fuel: null == fuel
          ? _value.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as FuelEntity,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $BettingBankEntityCopyWith<$Res>? get bettingBank {
    if (_value.bettingBank == null) {
      return null;
    }

    return $BettingBankEntityCopyWith<$Res>(_value.bettingBank!, (value) {
      return _then(_value.copyWith(bettingBank: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FuelEntityCopyWith<$Res> get fuel {
    return $FuelEntityCopyWith<$Res>(_value.fuel, (value) {
      return _then(_value.copyWith(fuel: value) as $Val);
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
abstract class _$$TicketDetailEntityImplCopyWith<$Res>
    implements $TicketDetailEntityCopyWith<$Res> {
  factory _$$TicketDetailEntityImplCopyWith(_$TicketDetailEntityImpl value,
          $Res Function(_$TicketDetailEntityImpl) then) =
      __$$TicketDetailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VehicleEntity vehicle,
      BettingBankEntity? bettingBank,
      FuelEntity fuel,
      UserEntity user,
      @JsonKey(name: "fuel_quantity") num quantity,
      String? note});

  @override
  $VehicleEntityCopyWith<$Res> get vehicle;
  @override
  $BettingBankEntityCopyWith<$Res>? get bettingBank;
  @override
  $FuelEntityCopyWith<$Res> get fuel;
  @override
  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$TicketDetailEntityImplCopyWithImpl<$Res>
    extends _$TicketDetailEntityCopyWithImpl<$Res, _$TicketDetailEntityImpl>
    implements _$$TicketDetailEntityImplCopyWith<$Res> {
  __$$TicketDetailEntityImplCopyWithImpl(_$TicketDetailEntityImpl _value,
      $Res Function(_$TicketDetailEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicle = null,
    Object? bettingBank = freezed,
    Object? fuel = null,
    Object? user = null,
    Object? quantity = null,
    Object? note = freezed,
  }) {
    return _then(_$TicketDetailEntityImpl(
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleEntity,
      bettingBank: freezed == bettingBank
          ? _value.bettingBank
          : bettingBank // ignore: cast_nullable_to_non_nullable
              as BettingBankEntity?,
      fuel: null == fuel
          ? _value.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as FuelEntity,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketDetailEntityImpl implements _TicketDetailEntity {
  const _$TicketDetailEntityImpl(
      {required this.vehicle,
      this.bettingBank = null,
      required this.fuel,
      required this.user,
      @JsonKey(name: "fuel_quantity") required this.quantity,
      this.note = null});

  factory _$TicketDetailEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketDetailEntityImplFromJson(json);

  @override
  final VehicleEntity vehicle;
  @override
  @JsonKey()
  final BettingBankEntity? bettingBank;
  @override
  final FuelEntity fuel;
  @override
  final UserEntity user;
  @override
  @JsonKey(name: "fuel_quantity")
  final num quantity;
  @override
  @JsonKey()
  final String? note;

  @override
  String toString() {
    return 'TicketDetailEntity(vehicle: $vehicle, bettingBank: $bettingBank, fuel: $fuel, user: $user, quantity: $quantity, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketDetailEntityImpl &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.bettingBank, bettingBank) ||
                other.bettingBank == bettingBank) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, vehicle, bettingBank, fuel, user, quantity, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketDetailEntityImplCopyWith<_$TicketDetailEntityImpl> get copyWith =>
      __$$TicketDetailEntityImplCopyWithImpl<_$TicketDetailEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketDetailEntityImplToJson(
      this,
    );
  }
}

abstract class _TicketDetailEntity implements TicketDetailEntity {
  const factory _TicketDetailEntity(
      {required final VehicleEntity vehicle,
      final BettingBankEntity? bettingBank,
      required final FuelEntity fuel,
      required final UserEntity user,
      @JsonKey(name: "fuel_quantity") required final num quantity,
      final String? note}) = _$TicketDetailEntityImpl;

  factory _TicketDetailEntity.fromJson(Map<String, dynamic> json) =
      _$TicketDetailEntityImpl.fromJson;

  @override
  VehicleEntity get vehicle;
  @override
  BettingBankEntity? get bettingBank;
  @override
  FuelEntity get fuel;
  @override
  UserEntity get user;
  @override
  @JsonKey(name: "fuel_quantity")
  num get quantity;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$TicketDetailEntityImplCopyWith<_$TicketDetailEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
