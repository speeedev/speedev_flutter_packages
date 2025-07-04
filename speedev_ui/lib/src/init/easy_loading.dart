import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SDEasyLoadingInitializer {
  static final SDEasyLoadingInitializer _instance = SDEasyLoadingInitializer._();
  SDEasyLoadingInitializer._();
  factory SDEasyLoadingInitializer() => _instance;

  static TransitionBuilder initialize() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..maskType = EasyLoadingMaskType.black
      ..userInteractions = false
      ..toastPosition = EasyLoadingToastPosition.center
      ..dismissOnTap = false;

    return EasyLoading.init();
  }
}
