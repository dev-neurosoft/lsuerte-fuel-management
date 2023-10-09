// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleEntityImpl _$$VehicleEntityImplFromJson(Map<String, dynamic> json) =>
    _$VehicleEntityImpl(
      id: json['id'] as String,
      brand: VehicleBrandEntity.fromJson(json['brand'] as Map<String, dynamic>),
      model: VehicleModelEntity.fromJson(json['model'] as Map<String, dynamic>),
      fuel: FuelEntity.fromJson(json['fuel'] as Map<String, dynamic>),
      year: json['year'] as num,
      fuelQuantity: json['fuelQuantity'] as num? ?? 0,
      code: json['code'] as String,
      kilometres: json['kilometres'] as num? ?? null,
    );

Map<String, dynamic> _$$VehicleEntityImplToJson(_$VehicleEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'model': instance.model,
      'fuel': instance.fuel,
      'year': instance.year,
      'fuelQuantity': instance.fuelQuantity,
      'code': instance.code,
      'kilometres': instance.kilometres,
    };
