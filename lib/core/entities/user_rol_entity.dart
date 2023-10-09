import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_rol_entity.freezed.dart';
part 'user_rol_entity.g.dart';

@Freezed()
class UserRolEntity with _$UserRolEntity {
  const factory UserRolEntity({
    required String id,
    required String name,
  }) = _UserRolEntity;

  static String get tableName => "user_roles";
  static String get primaryKey => "id";
  static String get select => "*";

  factory UserRolEntity.fromJson(Map<String, dynamic> json) => _$UserRolEntityFromJson(json);
}
