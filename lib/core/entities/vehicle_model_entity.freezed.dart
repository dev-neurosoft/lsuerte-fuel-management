// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleModelEntity _$VehicleModelEntityFromJson(Map<String, dynamic> json) {
  return _VehicleModelEntity.fromJson(json);
}

/// @nodoc
mixin _$VehicleModelEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleModelEntityCopyWith<VehicleModelEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleModelEntityCopyWith<$Res> {
  factory $VehicleModelEntityCopyWith(
          VehicleModelEntity value, $Res Function(VehicleModelEntity) then) =
      _$VehicleModelEntityCopyWithImpl<$Res, VehicleModelEntity>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$VehicleModelEntityCopyWithImpl<$Res, $Val extends VehicleModelEntity>
    implements $VehicleModelEntityCopyWith<$Res> {
  _$VehicleModelEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleModelEntityImplCopyWith<$Res>
    implements $VehicleModelEntityCopyWith<$Res> {
  factory _$$VehicleModelEntityImplCopyWith(_$VehicleModelEntityImpl value,
          $Res Function(_$VehicleModelEntityImpl) then) =
      __$$VehicleModelEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$VehicleModelEntityImplCopyWithImpl<$Res>
    extends _$VehicleModelEntityCopyWithImpl<$Res, _$VehicleModelEntityImpl>
    implements _$$VehicleModelEntityImplCopyWith<$Res> {
  __$$VehicleModelEntityImplCopyWithImpl(_$VehicleModelEntityImpl _value,
      $Res Function(_$VehicleModelEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$VehicleModelEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleModelEntityImpl implements _VehicleModelEntity {
  const _$VehicleModelEntityImpl({required this.id, required this.name});

  factory _$VehicleModelEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleModelEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'VehicleModelEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleModelEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleModelEntityImplCopyWith<_$VehicleModelEntityImpl> get copyWith =>
      __$$VehicleModelEntityImplCopyWithImpl<_$VehicleModelEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleModelEntityImplToJson(
      this,
    );
  }
}

abstract class _VehicleModelEntity implements VehicleModelEntity {
  const factory _VehicleModelEntity(
      {required final String id,
      required final String name}) = _$VehicleModelEntityImpl;

  factory _VehicleModelEntity.fromJson(Map<String, dynamic> json) =
      _$VehicleModelEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$VehicleModelEntityImplCopyWith<_$VehicleModelEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
