import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SDEasyLoading {
  static void initialize() {
    _initializeEasyLoading();
  }

  static void _initializeEasyLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..maskType = EasyLoadingMaskType.black
      ..userInteractions = false
      ..dismissOnTap = false
      ..toastPosition = EasyLoadingToastPosition.center;
    
    EasyLoading.init();
  }

  static void show([String? message]) {
    EasyLoading.show(status: message);
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }

  static void showSuccess(String message) {
    EasyLoading.showSuccess(message);
  }

  static void showError(String message) {
    EasyLoading.showError(message);
  }
}

TransitionBuilder getEasyLoadingBuilder() => EasyLoading.init();
