import 'dart:convert';

import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:postgrest/postgrest.dart';

import '../../../core/entities/user_entity.dart';
import '../../../core/services.dart';

part 'auth_controller.freezed.dart';

@Freezed()
sealed class AuthControllerState with _$AuthControllerState {
  const factory AuthControllerState({
    @Default(null) UserEntity? user,
  }) = _AuthControllerState;
}

@Singleton()
class AuthController extends ValueNotifier<AuthControllerState> {
  AuthController(this._client) : super(const AuthControllerState());

  final PostgrestClient _client;

  bool get loggedIn => value.user != null;
  UserEntity? get user => value.user;
  String? get userId => value.user?.id;
  String? get userName => value.user?.name;

  Future<void> initialize() async {
    final userJsonOrNone = sharedPrefs.getString("user");

    if (userJsonOrNone != null) {
      value = value.copyWith(user: UserEntity.fromJson(jsonDecode(userJsonOrNone)));
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    Function()? onSuccess,
    Function(String? message)? onFailure,
  }) async {
    try {
      final result = await _client
          .rpc("sign_in", params: {
            "email": email,
            "password": password,
          })
          .select()
          .maybeSingle();

      if (result["message"] != null) {
        return onFailure?.call(result["message"]);
      }

      final foundUser = await _client
          .from(UserEntity.tableName)
          .select(UserEntity.select)
          .eq(UserEntity.primaryKey, result["id"])
          .limit(1)
          .maybeSingle();

      value = value.copyWith(user: UserEntity.fromJson(foundUser));

      if (value.user != null) {
        sharedPrefs.setString("user", jsonEncode(value.user!.toJson()));
      }
      onSuccess?.call();
    } on PostgrestException catch (error) {
      onFailure?.call(jsonDecode(error.message)?["message"] ?? error.message);
    }
  }

  Future<void> signOut({
    Function()? onSuccess,
    Function(String? message)? onFailure,
  }) async {
    try {
      value = value.copyWith(user: null);
      onSuccess?.call();
    } on PostgrestException catch (error) {
      onFailure?.call(error.message);
    }
  }
}
