// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fuel_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FuelEntity _$FuelEntityFromJson(Map<String, dynamic> json) {
  return _FuelEntity.fromJson(json);
}

/// @nodoc
mixin _$FuelEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  num get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FuelEntityCopyWith<FuelEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FuelEntityCopyWith<$Res> {
  factory $FuelEntityCopyWith(
          FuelEntity value, $Res Function(FuelEntity) then) =
      _$FuelEntityCopyWithImpl<$Res, FuelEntity>;
  @useResult
  $Res call({String id, String name, bool active, num quantity});
}

/// @nodoc
class _$FuelEntityCopyWithImpl<$Res, $Val extends FuelEntity>
    implements $FuelEntityCopyWith<$Res> {
  _$FuelEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? active = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FuelEntityImplCopyWith<$Res>
    implements $FuelEntityCopyWith<$Res> {
  factory _$$FuelEntityImplCopyWith(
          _$FuelEntityImpl value, $Res Function(_$FuelEntityImpl) then) =
      __$$FuelEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, bool active, num quantity});
}

/// @nodoc
class __$$FuelEntityImplCopyWithImpl<$Res>
    extends _$FuelEntityCopyWithImpl<$Res, _$FuelEntityImpl>
    implements _$$FuelEntityImplCopyWith<$Res> {
  __$$FuelEntityImplCopyWithImpl(
      _$FuelEntityImpl _value, $Res Function(_$FuelEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? active = null,
    Object? quantity = null,
  }) {
    return _then(_$FuelEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FuelEntityImpl implements _FuelEntity {
  const _$FuelEntityImpl(
      {required this.id,
      required this.name,
      required this.active,
      required this.quantity});

  factory _$FuelEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FuelEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool active;
  @override
  final num quantity;

  @override
  String toString() {
    return 'FuelEntity(id: $id, name: $name, active: $active, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FuelEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, active, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FuelEntityImplCopyWith<_$FuelEntityImpl> get copyWith =>
      __$$FuelEntityImplCopyWithImpl<_$FuelEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FuelEntityImplToJson(
      this,
    );
  }
}

abstract class _FuelEntity implements FuelEntity {
  const factory _FuelEntity(
      {required final String id,
      required final String name,
      required final bool active,
      required final num quantity}) = _$FuelEntityImpl;

  factory _FuelEntity.fromJson(Map<String, dynamic> json) =
      _$FuelEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get active;
  @override
  num get quantity;
  @override
  @JsonKey(ignore: true)
  _$$FuelEntityImplCopyWith<_$FuelEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
