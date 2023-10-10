// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleEntity _$VehicleEntityFromJson(Map<String, dynamic> json) {
  return _VehicleEntity.fromJson(json);
}

/// @nodoc
mixin _$VehicleEntity {
  String get id => throw _privateConstructorUsedError;
  VehicleBrandEntity get brand => throw _privateConstructorUsedError;
  VehicleModelEntity get model => throw _privateConstructorUsedError;
  FuelEntity get fuel => throw _privateConstructorUsedError;
  num get year => throw _privateConstructorUsedError;
  @JsonKey(name: "fuel_quantity")
  num? get fuelQuantity => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  num? get kilometres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleEntityCopyWith<VehicleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleEntityCopyWith<$Res> {
  factory $VehicleEntityCopyWith(
          VehicleEntity value, $Res Function(VehicleEntity) then) =
      _$VehicleEntityCopyWithImpl<$Res, VehicleEntity>;
  @useResult
  $Res call(
      {String id,
      VehicleBrandEntity brand,
      VehicleModelEntity model,
      FuelEntity fuel,
      num year,
      @JsonKey(name: "fuel_quantity") num? fuelQuantity,
      String code,
      num? kilometres});

  $VehicleBrandEntityCopyWith<$Res> get brand;
  $VehicleModelEntityCopyWith<$Res> get model;
  $FuelEntityCopyWith<$Res> get fuel;
}

/// @nodoc
class _$VehicleEntityCopyWithImpl<$Res, $Val extends VehicleEntity>
    implements $VehicleEntityCopyWith<$Res> {
  _$VehicleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? model = null,
    Object? fuel = null,
    Object? year = null,
    Object? fuelQuantity = freezed,
    Object? code = null,
    Object? kilometres = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as VehicleBrandEntity,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as VehicleModelEntity,
      fuel: null == fuel
          ? _value.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as FuelEntity,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as num,
      fuelQuantity: freezed == fuelQuantity
          ? _value.fuelQuantity
          : fuelQuantity // ignore: cast_nullable_to_non_nullable
              as num?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      kilometres: freezed == kilometres
          ? _value.kilometres
          : kilometres // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleBrandEntityCopyWith<$Res> get brand {
    return $VehicleBrandEntityCopyWith<$Res>(_value.brand, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleModelEntityCopyWith<$Res> get model {
    return $VehicleModelEntityCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FuelEntityCopyWith<$Res> get fuel {
    return $FuelEntityCopyWith<$Res>(_value.fuel, (value) {
      return _then(_value.copyWith(fuel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleEntityImplCopyWith<$Res>
    implements $VehicleEntityCopyWith<$Res> {
  factory _$$VehicleEntityImplCopyWith(
          _$VehicleEntityImpl value, $Res Function(_$VehicleEntityImpl) then) =
      __$$VehicleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      VehicleBrandEntity brand,
      VehicleModelEntity model,
      FuelEntity fuel,
      num year,
      @JsonKey(name: "fuel_quantity") num? fuelQuantity,
      String code,
      num? kilometres});

  @override
  $VehicleBrandEntityCopyWith<$Res> get brand;
  @override
  $VehicleModelEntityCopyWith<$Res> get model;
  @override
  $FuelEntityCopyWith<$Res> get fuel;
}

/// @nodoc
class __$$VehicleEntityImplCopyWithImpl<$Res>
    extends _$VehicleEntityCopyWithImpl<$Res, _$VehicleEntityImpl>
    implements _$$VehicleEntityImplCopyWith<$Res> {
  __$$VehicleEntityImplCopyWithImpl(
      _$VehicleEntityImpl _value, $Res Function(_$VehicleEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? model = null,
    Object? fuel = null,
    Object? year = null,
    Object? fuelQuantity = freezed,
    Object? code = null,
    Object? kilometres = freezed,
  }) {
    return _then(_$VehicleEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as VehicleBrandEntity,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as VehicleModelEntity,
      fuel: null == fuel
          ? _value.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as FuelEntity,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as num,
      fuelQuantity: freezed == fuelQuantity
          ? _value.fuelQuantity
          : fuelQuantity // ignore: cast_nullable_to_non_nullable
              as num?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      kilometres: freezed == kilometres
          ? _value.kilometres
          : kilometres // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleEntityImpl implements _VehicleEntity {
  const _$VehicleEntityImpl(
      {required this.id,
      required this.brand,
      required this.model,
      required this.fuel,
      required this.year,
      @JsonKey(name: "fuel_quantity") this.fuelQuantity = 0,
      required this.code,
      this.kilometres = null});

  factory _$VehicleEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleEntityImplFromJson(json);

  @override
  final String id;
  @override
  final VehicleBrandEntity brand;
  @override
  final VehicleModelEntity model;
  @override
  final FuelEntity fuel;
  @override
  final num year;
  @override
  @JsonKey(name: "fuel_quantity")
  final num? fuelQuantity;
  @override
  final String code;
  @override
  @JsonKey()
  final num? kilometres;

  @override
  String toString() {
    return 'VehicleEntity(id: $id, brand: $brand, model: $model, fuel: $fuel, year: $year, fuelQuantity: $fuelQuantity, code: $code, kilometres: $kilometres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.fuelQuantity, fuelQuantity) ||
                other.fuelQuantity == fuelQuantity) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.kilometres, kilometres) ||
                other.kilometres == kilometres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, brand, model, fuel, year,
      fuelQuantity, code, kilometres);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleEntityImplCopyWith<_$VehicleEntityImpl> get copyWith =>
      __$$VehicleEntityImplCopyWithImpl<_$VehicleEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleEntityImplToJson(
      this,
    );
  }
}

abstract class _VehicleEntity implements VehicleEntity {
  const factory _VehicleEntity(
      {required final String id,
      required final VehicleBrandEntity brand,
      required final VehicleModelEntity model,
      required final FuelEntity fuel,
      required final num year,
      @JsonKey(name: "fuel_quantity") final num? fuelQuantity,
      required final String code,
      final num? kilometres}) = _$VehicleEntityImpl;

  factory _VehicleEntity.fromJson(Map<String, dynamic> json) =
      _$VehicleEntityImpl.fromJson;

  @override
  String get id;
  @override
  VehicleBrandEntity get brand;
  @override
  VehicleModelEntity get model;
  @override
  FuelEntity get fuel;
  @override
  num get year;
  @override
  @JsonKey(name: "fuel_quantity")
  num? get fuelQuantity;
  @override
  String get code;
  @override
  num? get kilometres;
  @override
  @JsonKey(ignore: true)
  _$$VehicleEntityImplCopyWith<_$VehicleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
