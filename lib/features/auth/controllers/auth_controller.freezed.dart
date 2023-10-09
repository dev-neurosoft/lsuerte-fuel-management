// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthControllerState {
  UserEntity? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthControllerStateCopyWith<AuthControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthControllerStateCopyWith<$Res> {
  factory $AuthControllerStateCopyWith(
          AuthControllerState value, $Res Function(AuthControllerState) then) =
      _$AuthControllerStateCopyWithImpl<$Res, AuthControllerState>;
  @useResult
  $Res call({UserEntity? user});

  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthControllerStateCopyWithImpl<$Res, $Val extends AuthControllerState>
    implements $AuthControllerStateCopyWith<$Res> {
  _$AuthControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthControllerStateImplCopyWith<$Res>
    implements $AuthControllerStateCopyWith<$Res> {
  factory _$$AuthControllerStateImplCopyWith(_$AuthControllerStateImpl value,
          $Res Function(_$AuthControllerStateImpl) then) =
      __$$AuthControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserEntity? user});

  @override
  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthControllerStateImplCopyWithImpl<$Res>
    extends _$AuthControllerStateCopyWithImpl<$Res, _$AuthControllerStateImpl>
    implements _$$AuthControllerStateImplCopyWith<$Res> {
  __$$AuthControllerStateImplCopyWithImpl(_$AuthControllerStateImpl _value,
      $Res Function(_$AuthControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$AuthControllerStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ));
  }
}

/// @nodoc

class _$AuthControllerStateImpl implements _AuthControllerState {
  const _$AuthControllerStateImpl({this.user = null});

  @override
  @JsonKey()
  final UserEntity? user;

  @override
  String toString() {
    return 'AuthControllerState(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthControllerStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthControllerStateImplCopyWith<_$AuthControllerStateImpl> get copyWith =>
      __$$AuthControllerStateImplCopyWithImpl<_$AuthControllerStateImpl>(
          this, _$identity);
}

abstract class _AuthControllerState implements AuthControllerState {
  const factory _AuthControllerState({final UserEntity? user}) =
      _$AuthControllerStateImpl;

  @override
  UserEntity? get user;
  @override
  @JsonKey(ignore: true)
  _$$AuthControllerStateImplCopyWith<_$AuthControllerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
