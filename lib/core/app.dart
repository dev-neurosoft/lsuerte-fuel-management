import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:paged_datatable/paged_datatable.dart';

import 'constants.dart';
import 'services.dart';
import 'theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appTitle,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router.config(),
      supportedLocales: const [Locale('en'), Locale('es')],
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
        PagedDataTableLocalization.delegate,
      ],
    );
  }
}