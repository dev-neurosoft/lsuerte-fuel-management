import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:postgrest/postgrest.dart';

import '../../../core/entities/fuel_entity.dart';
import '../../../core/entities/vehicle_brand_entity.dart';
import '../../../core/entities/vehicle_model_entity.dart';

part 'vehicle_controller.freezed.dart';

@Freezed()
class VehicleControllerState with _$VehicleControllerState {
  const factory VehicleControllerState.initial() = _VehicleControllerInitial;
  const factory VehicleControllerState.loading() = _VehicleControllerLoading;
  const factory VehicleControllerState.failure([String? message]) = _VehicleControllerFailure;
  const factory VehicleControllerState.success({
    required List<VehicleBrandEntity> brands,
    required List<VehicleModelEntity> models,
    required List<FuelEntity> fuels,
  }) = _VehicleControllerSuccess;
}

@LazySingleton()
class VehicleController extends ValueNotifier<VehicleControllerState> {
  VehicleController(this._client) : super(const VehicleControllerState.initial());

  final PostgrestClient _client;

  Future<void> initialize() async {
    value = const VehicleControllerState.loading();

    try {
      final result = await Future.wait([
        _client.from(VehicleBrandEntity.tableName).select<PostgrestList>().withConverter<List<VehicleBrandEntity>>(
              (data) => data.map((e) => VehicleBrandEntity.fromJson(e)).toList(),
            ),
        _client.from(VehicleModelEntity.tableName).select<PostgrestList>().withConverter<List<VehicleModelEntity>>(
              (data) => data.map((e) => VehicleModelEntity.fromJson(e)).toList(),
            ),
        _client.from(FuelEntity.tableName).select<PostgrestList>().withConverter<List<FuelEntity>>(
              (data) => data.map((e) => FuelEntity.fromJson(e)).toList(),
            ),
      ]);

      value = VehicleControllerState.success(
        brands: result[0] as List<VehicleBrandEntity>,
        models: result[1] as List<VehicleModelEntity>,
        fuels: result[2] as List<FuelEntity>,
      );
    } on PostgrestException catch (error) {
      value = VehicleControllerState.failure(error.message);
    }
  }
}
