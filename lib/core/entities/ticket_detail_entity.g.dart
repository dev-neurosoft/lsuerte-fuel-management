// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketDetailEntityImpl _$$TicketDetailEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$TicketDetailEntityImpl(
      vehicle: VehicleEntity.fromJson(json['vehicle'] as Map<String, dynamic>),
      bettingBank: json['bettingBank'] == null
          ? null
          : BettingBankEntity.fromJson(
              json['bettingBank'] as Map<String, dynamic>),
      fuel: FuelEntity.fromJson(json['fuel'] as Map<String, dynamic>),
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      quantity: json['fuel_quantity'] as num,
      note: json['note'] as String? ?? null,
    );

Map<String, dynamic> _$$TicketDetailEntityImplToJson(
        _$TicketDetailEntityImpl instance) =>
    <String, dynamic>{
      'vehicle': instance.vehicle,
      'bettingBank': instance.bettingBank,
      'fuel': instance.fuel,
      'user': instance.user,
      'fuel_quantity': instance.quantity,
      'note': instance.note,
    };
