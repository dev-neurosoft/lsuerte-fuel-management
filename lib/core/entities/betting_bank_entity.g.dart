// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'betting_bank_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BettingBankEntityImpl _$$BettingBankEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$BettingBankEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      active: json['active'] as bool? ?? true,
    );

Map<String, dynamic> _$$BettingBankEntityImplToJson(
        _$BettingBankEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
    };
