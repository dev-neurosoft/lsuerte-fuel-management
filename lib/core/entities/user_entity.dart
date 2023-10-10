import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_rol_entity.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

extension UserEntityX on UserEntity {
  bool get canDeativateTicket => [
        "759aa591-3920-4a12-8ea7-6e150adebc78",
        "f5b971c9-b4d0-497f-876e-3377b96e8021",
      ].contains(rol.id);
}

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
