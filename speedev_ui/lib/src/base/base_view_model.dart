import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  void updateState() => notifyListeners();
}
