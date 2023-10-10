// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketEntityImpl _$$TicketEntityImplFromJson(Map<String, dynamic> json) =>
    _$TicketEntityImpl(
      id: json['id'] as String,
      requestedBy:
          UserEntity.fromJson(json['requestedBy'] as Map<String, dynamic>),
      createdBy: UserEntity.fromJson(json['createdBy'] as Map<String, dynamic>),
      note: json['note'] as String? ?? null,
      createdAt: DateTime.parse(json['created_at'] as String),
      code: json['code'] as String,
      active: json['active'] as bool,
      details: (json['details'] as List<dynamic>?)
              ?.map(
                  (e) => TicketDetailEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TicketEntityImplToJson(_$TicketEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestedBy': instance.requestedBy,
      'createdBy': instance.createdBy,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
      'code': instance.code,
      'active': instance.active,
      'details': instance.details,
    };
