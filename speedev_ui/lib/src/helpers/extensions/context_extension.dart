import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get allWidth => mediaQuery.size.width;
  double get allHeight => mediaQuery.size.height;
}
