import 'package:flutter/material.dart';

class SDThemeProvider extends ChangeNotifier {
  SDThemeProvider();

  ThemeMode themeMode = ThemeMode.light;
  late ThemeData themeData;
  late ThemeData lightTheme;
  late ThemeData darkTheme;

  void setThemeMode(ThemeMode themeMode) {
    this.themeMode = themeMode;
    themeData = themeMode == ThemeMode.light ? lightTheme : darkTheme;
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
