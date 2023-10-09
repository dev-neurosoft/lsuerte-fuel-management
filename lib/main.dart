import 'package:flutter/material.dart';

import 'core/app.dart';
import 'core/get_it.dart';
import 'core/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await authController.initialize();

  runApp(const MainApp());
}
