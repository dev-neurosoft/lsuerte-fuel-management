import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_rol_entity.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@Freezed()
sealed class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String name,
    required UserRolEntity rol,
    @Default(null) String? email,
    @Default(true) bool? active,
  }) = _UserEntity;

  static String get tableName => "users";
  static String get primaryKey => "id";
  static String get select => "*, rol:user_roles(*)";

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
