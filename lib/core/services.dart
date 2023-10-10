import 'package:postgrest/postgrest.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/controllers/auth_controller.dart';
import '../features/ticket/repositories/printer_repository.dart';
import 'get_it.dart';
import 'router.dart';

AuthController get authController => getIt.get<AuthController>();
PrinterRepository get printerRepository => getIt.get<PrinterRepository>();

AppRouter get router => getIt.get<AppRouter>();

PostgrestClient get database => getIt.get<PostgrestClient>();

SharedPreferences get sharedPrefs => getIt.get<SharedPreferences>();
