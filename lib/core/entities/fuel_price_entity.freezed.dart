// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fuel_price_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FuelPriceEntity _$FuelPriceEntityFromJson(Map<String, dynamic> json) {
  return _FuelPriceEntity.fromJson(json);
}

/// @nodoc
mixin _$FuelPriceEntity {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "fuels")
  FuelEntity get fuel => throw _privateConstructorUsedError;
  @JsonKey(name: "effective_date")
  DateTime get effectiveDate => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  @JsonKey(name: "users")
  UserEntity get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FuelPriceEntityCopyWith<FuelPriceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FuelPriceEntityCopyWith<$Res> {
  factory $FuelPriceEntityCopyWith(
          FuelPriceEntity value, $Res Function(FuelPriceEntity) then) =
      _$FuelPriceEntityCopyWithImpl<$Res, FuelPriceEntity>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "fuels") FuelEntity fuel,
      @JsonKey(name: "effective_date") DateTime effectiveDate,
      num price,
      @JsonKey(name: "users") UserEntity createdBy,
      @JsonKey(name: "created_at") DateTime createdAt});

  $FuelEntityCopyWith<$Res> get fuel;
  $UserEntityCopyWith<$Res> get createdBy;
}

/// @nodoc
class _$FuelPriceEntityCopyWithImpl<$Res, $Val extends FuelPriceEntity>
    implements $FuelPriceEntityCopyWith<$Res> {
  _$FuelPriceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fuel = null,
    Object? effectiveDate = null,
    Object? price = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fuel: null == fuel
          ? _value.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as FuelEntity,
      effectiveDate: null == effectiveDate
          ? _value.effectiveDate
          : effectiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
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
  $FuelEntityCopyWith<$Res> get fuel {
    return $FuelEntityCopyWith<$Res>(_value.fuel, (value) {
      return _then(_value.copyWith(fuel: value) as $Val);
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
abstract class _$$FuelPriceEntityImplCopyWith<$Res>
    implements $FuelPriceEntityCopyWith<$Res> {
  factory _$$FuelPriceEntityImplCopyWith(_$FuelPriceEntityImpl value,
          $Res Function(_$FuelPriceEntityImpl) then) =
      __$$FuelPriceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "fuels") FuelEntity fuel,
      @JsonKey(name: "effective_date") DateTime effectiveDate,
      num price,
      @JsonKey(name: "users") UserEntity createdBy,
      @JsonKey(name: "created_at") DateTime createdAt});

  @override
  $FuelEntityCopyWith<$Res> get fuel;
  @override
  $UserEntityCopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$FuelPriceEntityImplCopyWithImpl<$Res>
    extends _$FuelPriceEntityCopyWithImpl<$Res, _$FuelPriceEntityImpl>
    implements _$$FuelPriceEntityImplCopyWith<$Res> {
  __$$FuelPriceEntityImplCopyWithImpl(
      _$FuelPriceEntityImpl _value, $Res Function(_$FuelPriceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fuel = null,
    Object? effectiveDate = null,
    Object? price = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_$FuelPriceEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fuel: null == fuel
          ? _value.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as FuelEntity,
      effectiveDate: null == effectiveDate
          ? _value.effectiveDate
          : effectiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
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
class _$FuelPriceEntityImpl implements _FuelPriceEntity {
  const _$FuelPriceEntityImpl(
      {required this.id,
      @JsonKey(name: "fuels") required this.fuel,
      @JsonKey(name: "effective_date") required this.effectiveDate,
      required this.price,
      @JsonKey(name: "users") required this.createdBy,
      @JsonKey(name: "created_at") required this.createdAt});

  factory _$FuelPriceEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FuelPriceEntityImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "fuels")
  final FuelEntity fuel;
  @override
  @JsonKey(name: "effective_date")
  final DateTime effectiveDate;
  @override
  final num price;
  @override
  @JsonKey(name: "users")
  final UserEntity createdBy;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'FuelPriceEntity(id: $id, fuel: $fuel, effectiveDate: $effectiveDate, price: $price, createdBy: $createdBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FuelPriceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.effectiveDate, effectiveDate) ||
                other.effectiveDate == effectiveDate) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, fuel, effectiveDate, price, createdBy, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FuelPriceEntityImplCopyWith<_$FuelPriceEntityImpl> get copyWith =>
      __$$FuelPriceEntityImplCopyWithImpl<_$FuelPriceEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FuelPriceEntityImplToJson(
      this,
    );
  }
}

abstract class _FuelPriceEntity implements FuelPriceEntity {
  const factory _FuelPriceEntity(
      {required final String id,
      @JsonKey(name: "fuels") required final FuelEntity fuel,
      @JsonKey(name: "effective_date") required final DateTime effectiveDate,
      required final num price,
      @JsonKey(name: "users") required final UserEntity createdBy,
      @JsonKey(name: "created_at")
      required final DateTime createdAt}) = _$FuelPriceEntityImpl;

  factory _FuelPriceEntity.fromJson(Map<String, dynamic> json) =
      _$FuelPriceEntityImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "fuels")
  FuelEntity get fuel;
  @override
  @JsonKey(name: "effective_date")
  DateTime get effectiveDate;
  @override
  num get price;
  @override
  @JsonKey(name: "users")
  UserEntity get createdBy;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$FuelPriceEntityImplCopyWith<_$FuelPriceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
