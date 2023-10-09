// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_assignment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleAssignmentEntityImpl _$$VehicleAssignmentEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleAssignmentEntityImpl(
      id: json['id'] as String,
      vehicle: VehicleEntity.fromJson(json['vehicle'] as Map<String, dynamic>),
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      quantity: json['quantity'] as num,
    );

Map<String, dynamic> _$$VehicleAssignmentEntityImplToJson(
        _$VehicleAssignmentEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicle': instance.vehicle,
      'user': instance.user,
      'quantity': instance.quantity,
    };
