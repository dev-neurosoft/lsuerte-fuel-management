// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_rol_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRolEntity _$UserRolEntityFromJson(Map<String, dynamic> json) {
  return _UserRolEntity.fromJson(json);
}

/// @nodoc
mixin _$UserRolEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRolEntityCopyWith<UserRolEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRolEntityCopyWith<$Res> {
  factory $UserRolEntityCopyWith(
          UserRolEntity value, $Res Function(UserRolEntity) then) =
      _$UserRolEntityCopyWithImpl<$Res, UserRolEntity>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$UserRolEntityCopyWithImpl<$Res, $Val extends UserRolEntity>
    implements $UserRolEntityCopyWith<$Res> {
  _$UserRolEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$UserRolEntityImplCopyWith<$Res>
    implements $UserRolEntityCopyWith<$Res> {
  factory _$$UserRolEntityImplCopyWith(
          _$UserRolEntityImpl value, $Res Function(_$UserRolEntityImpl) then) =
      __$$UserRolEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$UserRolEntityImplCopyWithImpl<$Res>
    extends _$UserRolEntityCopyWithImpl<$Res, _$UserRolEntityImpl>
    implements _$$UserRolEntityImplCopyWith<$Res> {
  __$$UserRolEntityImplCopyWithImpl(
      _$UserRolEntityImpl _value, $Res Function(_$UserRolEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$UserRolEntityImpl(
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
class _$UserRolEntityImpl implements _UserRolEntity {
  const _$UserRolEntityImpl({required this.id, required this.name});

  factory _$UserRolEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRolEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'UserRolEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRolEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRolEntityImplCopyWith<_$UserRolEntityImpl> get copyWith =>
      __$$UserRolEntityImplCopyWithImpl<_$UserRolEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRolEntityImplToJson(
      this,
    );
  }
}

abstract class _UserRolEntity implements UserRolEntity {
  const factory _UserRolEntity(
      {required final String id,
      required final String name}) = _$UserRolEntityImpl;

  factory _UserRolEntity.fromJson(Map<String, dynamic> json) =
      _$UserRolEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UserRolEntityImplCopyWith<_$UserRolEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
