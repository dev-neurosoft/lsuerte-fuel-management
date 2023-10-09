import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  Size get appSize => MediaQuery.of(this).size;
  Brightness get brightness => Theme.of(this).brightness;
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

extension ValueNotifierX<S> on ValueNotifier<S> {
  Widget watch(Widget Function(BuildContext context, S state) builder) {
    return ValueListenableBuilder(
      valueListenable: this,
      builder: (context, value, _) => builder(context, value),
    );
  }
}
