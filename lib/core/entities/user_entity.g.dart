// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      rol: UserRolEntity.fromJson(json['rol'] as Map<String, dynamic>),
      email: json['email'] as String? ?? null,
      active: json['active'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rol': instance.rol,
      'email': instance.email,
      'active': instance.active,
    };
