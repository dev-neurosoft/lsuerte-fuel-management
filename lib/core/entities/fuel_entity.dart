import 'package:freezed_annotation/freezed_annotation.dart';

part 'fuel_entity.freezed.dart';
part 'fuel_entity.g.dart';

@Freezed()
sealed class FuelEntity with _$FuelEntity {
  const factory FuelEntity({
    required String id,
    required String name,
    required bool active,
    required num quantity,
  }) = _FuelEntity;

  factory FuelEntity.fromJson(Map<String, dynamic> json) => _$FuelEntityFromJson(json);

  static String get tableName => "fuels";
  static String get primaryKey => "id";
  static String get select => "*";
}
