import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_model_entity.freezed.dart';
part 'vehicle_model_entity.g.dart';

@Freezed()
sealed class VehicleModelEntity with _$VehicleModelEntity {
  const factory VehicleModelEntity({
    required String id,
    required String name,
  }) = _VehicleModelEntity;

  factory VehicleModelEntity.fromJson(Map<String, dynamic> json) => _$VehicleModelEntityFromJson(json);

  static String get tableName => "vehicle_models";
  static String get primaryKey => "id";
  static String get select => "*";
}
