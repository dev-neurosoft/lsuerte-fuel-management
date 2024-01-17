// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_price_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FuelPriceEntityImpl _$$FuelPriceEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$FuelPriceEntityImpl(
      id: json['id'] as String,
      fuel: FuelEntity.fromJson(json['fuels'] as Map<String, dynamic>),
      effectiveDate: DateTime.parse(json['effective_date'] as String),
      price: json['price'] as num,
      createdBy: UserEntity.fromJson(json['users'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$FuelPriceEntityImplToJson(
        _$FuelPriceEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fuels': instance.fuel,
      'effective_date': instance.effectiveDate.toIso8601String(),
      'price': instance.price,
      'users': instance.createdBy,
      'created_at': instance.createdAt.toIso8601String(),
    };
