import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_entity.dart';
import 'vehicle_entity.dart';

part 'vehicle_kilometres_entity.freezed.dart';
part 'vehicle_kilometres_entity.g.dart';

@Freezed()
sealed class VehicleKilometresEntity with _$VehicleKilometresEntity {
  const factory VehicleKilometresEntity({
    required String id,
    @JsonKey(name: "vehicles") required VehicleEntity vehicle,
    @JsonKey(name: "users") required UserEntity user,
    @JsonKey(name: "effective_date") required DateTime effectiveDate,
    @JsonKey(name: "in_kilometres") required num inKilometres,
    @JsonKey(name: "out_kilometres") required num? outKilometres,
    @JsonKey(name: "createdBy") required UserEntity createdBy,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _VehicleKilometresEntity;

  static String get tableName => "vehicle_kilometres";
  static String get primaryKey => "id";
  static String get select =>
      "*, vehicles(*, brand:vehicle_brands(*), model:vehicle_models(*), fuel:fuels(*) ), users:user_id(*, rol:user_roles(*)), createdBy:created_by(*, rol:user_roles(*))";

  factory VehicleKilometresEntity.fromJson(Map<String, dynamic> json) => _$VehicleKilometresEntityFromJson(json);
}
