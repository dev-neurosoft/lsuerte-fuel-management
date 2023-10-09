import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_entity.dart';
import 'vehicle_entity.dart';

part 'vehicle_assignment_entity.freezed.dart';
part 'vehicle_assignment_entity.g.dart';

@Freezed()
sealed class VehicleAssignmentEntity with _$VehicleAssignmentEntity {
  const factory VehicleAssignmentEntity({
    required String id,
    required VehicleEntity vehicle,
    required UserEntity user,
    required num quantity,
  }) = _VehicleAssignmentEntity;

  static String get tableName => "vehicle_assignments";
  static String get primaryKey => "id";
  static String get select =>
      "*, vehicle:vehicles(*, brand:vehicle_brands(*), model:vehicle_models(*), fuel:fuels(*)), user:users(*, rol:user_roles(*))";

  factory VehicleAssignmentEntity.fromJson(Map<String, dynamic> json) => _$VehicleAssignmentEntityFromJson(json);
}
