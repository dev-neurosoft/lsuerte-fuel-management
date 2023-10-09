import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_brand_entity.freezed.dart';
part 'vehicle_brand_entity.g.dart';

@Freezed()
sealed class VehicleBrandEntity with _$VehicleBrandEntity {
  const factory VehicleBrandEntity({
    required String id,
    required String name,
  }) = _VehicleBrandEntity;

  factory VehicleBrandEntity.fromJson(Map<String, dynamic> json) => _$VehicleBrandEntityFromJson(json);

  static String get tableName => "vehicle_brands";
  static String get primaryKey => "id";
  static String get select => "*";
}
