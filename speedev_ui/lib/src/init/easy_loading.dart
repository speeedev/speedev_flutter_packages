import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SDEasyLoading {
  static void initialize() {
    _initializeEasyLoading();
  }

  static void _initializeEasyLoading() {
    EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.fadingCircle;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.dark;
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.init();
  }

  static void show() {
    EasyLoading.show();
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
