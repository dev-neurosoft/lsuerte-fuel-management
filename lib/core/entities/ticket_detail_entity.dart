import 'package:freezed_annotation/freezed_annotation.dart';

import 'betting_bank_entity.dart';
import 'fuel_entity.dart';
import 'user_entity.dart';
import 'vehicle_entity.dart';

part 'ticket_detail_entity.freezed.dart';
part 'ticket_detail_entity.g.dart';

@Freezed()
sealed class TicketDetailEntity with _$TicketDetailEntity {
  const factory TicketDetailEntity({
    required VehicleEntity vehicle,
    @Default(null) BettingBankEntity? bettingBank,
    required FuelEntity fuel,
    required UserEntity user,
    @JsonKey(name: "fuel_quantity") required num quantity,
    @Default(null) String? note,
  }) = _TicketDetailEntity;

  static String get tableName => "ticket_details";
  static String get primaryKey => "ticket_id";
  static String get select => """
        *,
        bettingBank:betting_banks(*),
        vehicle:vehicles(
          *,
          brand:vehicle_brands(*),
          model:vehicle_models(*),
          fuel:fuels(*)
        ),
        user:users(*, rol:user_roles(*)),
        fuel:fuels(*)
  """;

  factory TicketDetailEntity.fromJson(Map<String, dynamic> json) => _$TicketDetailEntityFromJson(json);
}
