// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FuelEntityImpl _$$FuelEntityImplFromJson(Map<String, dynamic> json) =>
    _$FuelEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
      quantity: json['quantity'] as num,
    );

Map<String, dynamic> _$$FuelEntityImplToJson(_$FuelEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
      'quantity': instance.quantity,
    };
