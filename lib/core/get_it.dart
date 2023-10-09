import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:postgrest/postgrest.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'get_it.config.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @singleton
  PostgrestClient get client => PostgrestClient(postgrestEndpoint);

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
