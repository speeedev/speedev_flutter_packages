import 'package:flutter/material.dart';

class SDThemeManager extends ChangeNotifier {
  late ThemeData _themeData;

  SDThemeManager({required ThemeData themeData}) : _themeData = themeData;

  ThemeData get themeData => _themeData;

  late ThemeData lightTheme;
  late ThemeData darkTheme;

  void setThemeMode(ThemeMode themeMode) {
    _themeData = themeMode == ThemeMode.light ? lightTheme : darkTheme;
    notifyListeners();
  }

  void setLightTheme(ThemeData themeData) {
    lightTheme = themeData;
    notifyListeners();
  }

  void setDarkTheme(ThemeData themeData) {
    darkTheme = themeData;
    notifyListeners();
  }
}
