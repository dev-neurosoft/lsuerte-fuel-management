// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'betting_bank_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BettingBankEntity _$BettingBankEntityFromJson(Map<String, dynamic> json) {
  return _BettingBankEntity.fromJson(json);
}

/// @nodoc
mixin _$BettingBankEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BettingBankEntityCopyWith<BettingBankEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BettingBankEntityCopyWith<$Res> {
  factory $BettingBankEntityCopyWith(
          BettingBankEntity value, $Res Function(BettingBankEntity) then) =
      _$BettingBankEntityCopyWithImpl<$Res, BettingBankEntity>;
  @useResult
  $Res call({String id, String name, bool active});
}

/// @nodoc
class _$BettingBankEntityCopyWithImpl<$Res, $Val extends BettingBankEntity>
    implements $BettingBankEntityCopyWith<$Res> {
  _$BettingBankEntityCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BettingBankEntityImplCopyWith<$Res>
    implements $BettingBankEntityCopyWith<$Res> {
  factory _$$BettingBankEntityImplCopyWith(_$BettingBankEntityImpl value,
          $Res Function(_$BettingBankEntityImpl) then) =
      __$$BettingBankEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, bool active});
}

/// @nodoc
class __$$BettingBankEntityImplCopyWithImpl<$Res>
    extends _$BettingBankEntityCopyWithImpl<$Res, _$BettingBankEntityImpl>
    implements _$$BettingBankEntityImplCopyWith<$Res> {
  __$$BettingBankEntityImplCopyWithImpl(_$BettingBankEntityImpl _value,
      $Res Function(_$BettingBankEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? active = null,
  }) {
    return _then(_$BettingBankEntityImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BettingBankEntityImpl implements _BettingBankEntity {
  const _$BettingBankEntityImpl(
      {required this.id, required this.name, this.active = true});

  factory _$BettingBankEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BettingBankEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final bool active;

  @override
  String toString() {
    return 'BettingBankEntity(id: $id, name: $name, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BettingBankEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BettingBankEntityImplCopyWith<_$BettingBankEntityImpl> get copyWith =>
      __$$BettingBankEntityImplCopyWithImpl<_$BettingBankEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BettingBankEntityImplToJson(
      this,
    );
  }
}

abstract class _BettingBankEntity implements BettingBankEntity {
  const factory _BettingBankEntity(
      {required final String id,
      required final String name,
      final bool active}) = _$BettingBankEntityImpl;

  factory _BettingBankEntity.fromJson(Map<String, dynamic> json) =
      _$BettingBankEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$BettingBankEntityImplCopyWith<_$BettingBankEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
