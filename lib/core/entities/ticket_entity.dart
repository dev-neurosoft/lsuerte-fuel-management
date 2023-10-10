import 'package:freezed_annotation/freezed_annotation.dart';

import 'ticket_detail_entity.dart';
import 'user_entity.dart';

part 'ticket_entity.freezed.dart';
part 'ticket_entity.g.dart';

@Freezed()
sealed class TicketEntity with _$TicketEntity {
  const factory TicketEntity({
    required String id,
    required UserEntity requestedBy,
    required UserEntity createdBy,
    @Default(null) String? note,
    @JsonKey(name: "created_at") required DateTime createdAt,
    required String code,
    required bool active,
    @Default([]) List<TicketDetailEntity> details,
  }) = _TicketEntity;

  static String get tableName => "tickets";
  static String get primaryKey => "id";
  static String get select => """
      *,
      requestedBy:users!created_by(*, rol:user_roles(*)),
      createdBy:users!requested_by(*, rol:user_roles(*))
  """;

  factory TicketEntity.fromJson(Map<String, dynamic> json) => _$TicketEntityFromJson(json);
}
