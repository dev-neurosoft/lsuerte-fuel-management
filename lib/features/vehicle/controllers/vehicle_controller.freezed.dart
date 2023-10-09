// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VehicleControllerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) failure,
    required TResult Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? failure,
    TResult? Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? failure,
    TResult Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VehicleControllerInitial value) initial,
    required TResult Function(_VehicleControllerLoading value) loading,
    required TResult Function(_VehicleControllerFailure value) failure,
    required TResult Function(_VehicleControllerSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VehicleControllerInitial value)? initial,
    TResult? Function(_VehicleControllerLoading value)? loading,
    TResult? Function(_VehicleControllerFailure value)? failure,
    TResult? Function(_VehicleControllerSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VehicleControllerInitial value)? initial,
    TResult Function(_VehicleControllerLoading value)? loading,
    TResult Function(_VehicleControllerFailure value)? failure,
    TResult Function(_VehicleControllerSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleControllerStateCopyWith<$Res> {
  factory $VehicleControllerStateCopyWith(VehicleControllerState value,
          $Res Function(VehicleControllerState) then) =
      _$VehicleControllerStateCopyWithImpl<$Res, VehicleControllerState>;
}

/// @nodoc
class _$VehicleControllerStateCopyWithImpl<$Res,
        $Val extends VehicleControllerState>
    implements $VehicleControllerStateCopyWith<$Res> {
  _$VehicleControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$VehicleControllerInitialImplCopyWith<$Res> {
  factory _$$VehicleControllerInitialImplCopyWith(
          _$VehicleControllerInitialImpl value,
          $Res Function(_$VehicleControllerInitialImpl) then) =
      __$$VehicleControllerInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VehicleControllerInitialImplCopyWithImpl<$Res>
    extends _$VehicleControllerStateCopyWithImpl<$Res,
        _$VehicleControllerInitialImpl>
    implements _$$VehicleControllerInitialImplCopyWith<$Res> {
  __$$VehicleControllerInitialImplCopyWithImpl(
      _$VehicleControllerInitialImpl _value,
      $Res Function(_$VehicleControllerInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VehicleControllerInitialImpl
    with DiagnosticableTreeMixin
    implements _VehicleControllerInitial {
  const _$VehicleControllerInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VehicleControllerState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'VehicleControllerState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleControllerInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) failure,
    required TResult Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? failure,
    TResult? Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)?
        success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? failure,
    TResult Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)?
        success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VehicleControllerInitial value) initial,
    required TResult Function(_VehicleControllerLoading value) loading,
    required TResult Function(_VehicleControllerFailure value) failure,
    required TResult Function(_VehicleControllerSuccess value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VehicleControllerInitial value)? initial,
    TResult? Function(_VehicleControllerLoading value)? loading,
    TResult? Function(_VehicleControllerFailure value)? failure,
    TResult? Function(_VehicleControllerSuccess value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VehicleControllerInitial value)? initial,
    TResult Function(_VehicleControllerLoading value)? loading,
    TResult Function(_VehicleControllerFailure value)? failure,
    TResult Function(_VehicleControllerSuccess value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _VehicleControllerInitial implements VehicleControllerState {
  const factory _VehicleControllerInitial() = _$VehicleControllerInitialImpl;
}

/// @nodoc
abstract class _$$VehicleControllerLoadingImplCopyWith<$Res> {
  factory _$$VehicleControllerLoadingImplCopyWith(
          _$VehicleControllerLoadingImpl value,
          $Res Function(_$VehicleControllerLoadingImpl) then) =
      __$$VehicleControllerLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VehicleControllerLoadingImplCopyWithImpl<$Res>
    extends _$VehicleControllerStateCopyWithImpl<$Res,
        _$VehicleControllerLoadingImpl>
    implements _$$VehicleControllerLoadingImplCopyWith<$Res> {
  __$$VehicleControllerLoadingImplCopyWithImpl(
      _$VehicleControllerLoadingImpl _value,
      $Res Function(_$VehicleControllerLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VehicleControllerLoadingImpl
    with DiagnosticableTreeMixin
    implements _VehicleControllerLoading {
  const _$VehicleControllerLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VehicleControllerState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'VehicleControllerState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleControllerLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) failure,
    required TResult Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)
        success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? failure,
    TResult? Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)?
        success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? failure,
    TResult Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VehicleControllerInitial value) initial,
    required TResult Function(_VehicleControllerLoading value) loading,
    required TResult Function(_VehicleControllerFailure value) failure,
    required TResult Function(_VehicleControllerSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VehicleControllerInitial value)? initial,
    TResult? Function(_VehicleControllerLoading value)? loading,
    TResult? Function(_VehicleControllerFailure value)? failure,
    TResult? Function(_VehicleControllerSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VehicleControllerInitial value)? initial,
    TResult Function(_VehicleControllerLoading value)? loading,
    TResult Function(_VehicleControllerFailure value)? failure,
    TResult Function(_VehicleControllerSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _VehicleControllerLoading implements VehicleControllerState {
  const factory _VehicleControllerLoading() = _$VehicleControllerLoadingImpl;
}

/// @nodoc
abstract class _$$VehicleControllerFailureImplCopyWith<$Res> {
  factory _$$VehicleControllerFailureImplCopyWith(
          _$VehicleControllerFailureImpl value,
          $Res Function(_$VehicleControllerFailureImpl) then) =
      __$$VehicleControllerFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$VehicleControllerFailureImplCopyWithImpl<$Res>
    extends _$VehicleControllerStateCopyWithImpl<$Res,
        _$VehicleControllerFailureImpl>
    implements _$$VehicleControllerFailureImplCopyWith<$Res> {
  __$$VehicleControllerFailureImplCopyWithImpl(
      _$VehicleControllerFailureImpl _value,
      $Res Function(_$VehicleControllerFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$VehicleControllerFailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VehicleControllerFailureImpl
    with DiagnosticableTreeMixin
    implements _VehicleControllerFailure {
  const _$VehicleControllerFailureImpl([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VehicleControllerState.failure(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VehicleControllerState.failure'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleControllerFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleControllerFailureImplCopyWith<_$VehicleControllerFailureImpl>
      get copyWith => __$$VehicleControllerFailureImplCopyWithImpl<
          _$VehicleControllerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) failure,
    required TResult Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)
        success,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? failure,
    TResult? Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)?
        success,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? failure,
    TResult Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)?
        success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VehicleControllerInitial value) initial,
    required TResult Function(_VehicleControllerLoading value) loading,
    required TResult Function(_VehicleControllerFailure value) failure,
    required TResult Function(_VehicleControllerSuccess value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VehicleControllerInitial value)? initial,
    TResult? Function(_VehicleControllerLoading value)? loading,
    TResult? Function(_VehicleControllerFailure value)? failure,
    TResult? Function(_VehicleControllerSuccess value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VehicleControllerInitial value)? initial,
    TResult Function(_VehicleControllerLoading value)? loading,
    TResult Function(_VehicleControllerFailure value)? failure,
    TResult Function(_VehicleControllerSuccess value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _VehicleControllerFailure implements VehicleControllerState {
  const factory _VehicleControllerFailure([final String? message]) =
      _$VehicleControllerFailureImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$VehicleControllerFailureImplCopyWith<_$VehicleControllerFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VehicleControllerSuccessImplCopyWith<$Res> {
  factory _$$VehicleControllerSuccessImplCopyWith(
          _$VehicleControllerSuccessImpl value,
          $Res Function(_$VehicleControllerSuccessImpl) then) =
      __$$VehicleControllerSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<VehicleBrandEntity> brands,
      List<VehicleModelEntity> models,
      List<FuelEntity> fuels});
}

/// @nodoc
class __$$VehicleControllerSuccessImplCopyWithImpl<$Res>
    extends _$VehicleControllerStateCopyWithImpl<$Res,
        _$VehicleControllerSuccessImpl>
    implements _$$VehicleControllerSuccessImplCopyWith<$Res> {
  __$$VehicleControllerSuccessImplCopyWithImpl(
      _$VehicleControllerSuccessImpl _value,
      $Res Function(_$VehicleControllerSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brands = null,
    Object? models = null,
    Object? fuels = null,
  }) {
    return _then(_$VehicleControllerSuccessImpl(
      brands: null == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<VehicleBrandEntity>,
      models: null == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<VehicleModelEntity>,
      fuels: null == fuels
          ? _value._fuels
          : fuels // ignore: cast_nullable_to_non_nullable
              as List<FuelEntity>,
    ));
  }
}

/// @nodoc

class _$VehicleControllerSuccessImpl
    with DiagnosticableTreeMixin
    implements _VehicleControllerSuccess {
  const _$VehicleControllerSuccessImpl(
      {required final List<VehicleBrandEntity> brands,
      required final List<VehicleModelEntity> models,
      required final List<FuelEntity> fuels})
      : _brands = brands,
        _models = models,
        _fuels = fuels;

  final List<VehicleBrandEntity> _brands;
  @override
  List<VehicleBrandEntity> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  final List<VehicleModelEntity> _models;
  @override
  List<VehicleModelEntity> get models {
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_models);
  }

  final List<FuelEntity> _fuels;
  @override
  List<FuelEntity> get fuels {
    if (_fuels is EqualUnmodifiableListView) return _fuels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fuels);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VehicleControllerState.success(brands: $brands, models: $models, fuels: $fuels)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VehicleControllerState.success'))
      ..add(DiagnosticsProperty('brands', brands))
      ..add(DiagnosticsProperty('models', models))
      ..add(DiagnosticsProperty('fuels', fuels));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleControllerSuccessImpl &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            const DeepCollectionEquality().equals(other._models, _models) &&
            const DeepCollectionEquality().equals(other._fuels, _fuels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_brands),
      const DeepCollectionEquality().hash(_models),
      const DeepCollectionEquality().hash(_fuels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleControllerSuccessImplCopyWith<_$VehicleControllerSuccessImpl>
      get copyWith => __$$VehicleControllerSuccessImplCopyWithImpl<
          _$VehicleControllerSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) failure,
    required TResult Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)
        success,
  }) {
    return success(brands, models, fuels);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? failure,
    TResult? Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)?
        success,
  }) {
    return success?.call(brands, models, fuels);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? failure,
    TResult Function(List<VehicleBrandEntity> brands,
            List<VehicleModelEntity> models, List<FuelEntity> fuels)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(brands, models, fuels);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VehicleControllerInitial value) initial,
    required TResult Function(_VehicleControllerLoading value) loading,
    required TResult Function(_VehicleControllerFailure value) failure,
    required TResult Function(_VehicleControllerSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VehicleControllerInitial value)? initial,
    TResult? Function(_VehicleControllerLoading value)? loading,
    TResult? Function(_VehicleControllerFailure value)? failure,
    TResult? Function(_VehicleControllerSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VehicleControllerInitial value)? initial,
    TResult Function(_VehicleControllerLoading value)? loading,
    TResult Function(_VehicleControllerFailure value)? failure,
    TResult Function(_VehicleControllerSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _VehicleControllerSuccess implements VehicleControllerState {
  const factory _VehicleControllerSuccess(
      {required final List<VehicleBrandEntity> brands,
      required final List<VehicleModelEntity> models,
      required final List<FuelEntity> fuels}) = _$VehicleControllerSuccessImpl;

  List<VehicleBrandEntity> get brands;
  List<VehicleModelEntity> get models;
  List<FuelEntity> get fuels;
  @JsonKey(ignore: true)
  _$$VehicleControllerSuccessImplCopyWith<_$VehicleControllerSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
