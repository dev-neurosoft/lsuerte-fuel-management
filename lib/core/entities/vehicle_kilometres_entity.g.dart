// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_kilometres_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleKilometresEntityImpl _$$VehicleKilometresEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleKilometresEntityImpl(
      id: json['id'] as String,
      vehicle: VehicleEntity.fromJson(json['vehicles'] as Map<String, dynamic>),
      user: UserEntity.fromJson(json['users'] as Map<String, dynamic>),
      effectiveDate: DateTime.parse(json['effective_date'] as String),
      inKilometres: json['in_kilometres'] as num,
      outKilometres: json['out_kilometres'] as num?,
      createdBy: UserEntity.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$VehicleKilometresEntityImplToJson(
        _$VehicleKilometresEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicles': instance.vehicle,
      'users': instance.user,
      'effective_date': instance.effectiveDate.toIso8601String(),
      'in_kilometres': instance.inKilometres,
      'out_kilometres': instance.outKilometres,
      'createdBy': instance.createdBy,
      'created_at': instance.createdAt.toIso8601String(),
    };
