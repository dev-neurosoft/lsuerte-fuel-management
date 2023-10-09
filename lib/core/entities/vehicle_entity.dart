import 'package:freezed_annotation/freezed_annotation.dart';

import 'fuel_entity.dart';
import 'vehicle_brand_entity.dart';
import 'vehicle_model_entity.dart';

part 'vehicle_entity.freezed.dart';
part 'vehicle_entity.g.dart';

extension VehicleEntityX on VehicleEntity {
  String get name => "${brand.name} ${model.name} $year";
}

@Freezed()
sealed class VehicleEntity with _$VehicleEntity {
  const factory VehicleEntity({
    required String id,
    required VehicleBrandEntity brand,
    required VehicleModelEntity model,
    required FuelEntity fuel,
    required num year,
    @Default(0) num? fuelQuantity,
    required String code,
    @Default(null) num? kilometres,
  }) = _VehicleEntity;

  static String get tableName => "vehicles";
  static String get primaryKey => "id";
  static String get select => "*, brand:vehicle_brands(*), model:vehicle_models(*), fuel:fuels(*)";

  factory VehicleEntity.fromJson(Map<String, dynamic> json) => _$VehicleEntityFromJson(json);
}
