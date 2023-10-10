import 'package:freezed_annotation/freezed_annotation.dart';

part 'betting_bank_entity.freezed.dart';
part 'betting_bank_entity.g.dart';

@Freezed()
sealed class BettingBankEntity with _$BettingBankEntity {
  const factory BettingBankEntity({
    required String id,
    required String name,
    @Default(true) bool active,
  }) = _BettingBankEntity;

  static String get tableName => "betting_banks";
  static String get primaryKey => "id";
  static String get select => "*";

  factory BettingBankEntity.fromJson(Map<String, dynamic> json) => _$BettingBankEntityFromJson(json);
}
