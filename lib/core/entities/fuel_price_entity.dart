import 'package:freezed_annotation/freezed_annotation.dart';

import 'fuel_entity.dart';
import 'user_entity.dart';

part 'fuel_price_entity.freezed.dart';
part 'fuel_price_entity.g.dart';

@Freezed()
sealed class FuelPriceEntity with _$FuelPriceEntity {
  const factory FuelPriceEntity({
    required String id,
    @JsonKey(name: "fuels") required FuelEntity fuel,
    @JsonKey(name: "effective_date") required DateTime effectiveDate,
    required num price,
    @JsonKey(name: "users") required UserEntity createdBy,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _FuelPriceEntity;

  static String get tableName => "fuel_prices";
  static String get primaryKey => "id";
  static String get select => "*, fuels(*), users(*, rol:user_roles(*))";

  factory FuelPriceEntity.fromJson(Map<String, dynamic> json) => _$FuelPriceEntityFromJson(json);
}
