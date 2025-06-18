import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:speedev_core/speedev_core.dart';

abstract class BaseViewModel extends ChangeNotifier {
  void updateState() => notifyListeners();
  BuildContext? context;
  bool isLoading = false;
  bool isError = false;
  bool isSuccess = false;

  void init(BuildContext? context) {
    if (this.context == null) {
      this.context = context;
    }
  }

  Future<void> handleAsync(Future<void> Function() operation) async {
    safeExecute(
      operation: operation,
      onError: (e, stackTrace) {
        showErrorDialog();
        SDFirebaseCrashlyticsService().recordCrash(error: e, stackTrace: stackTrace);
      },
    );
  }

  Future<void> showLoadingDialog() async {
    isLoading = true;
    await EasyLoading.show();
  }

  Future<void> hideLoadingDialog() async {
    isLoading = false;
    await EasyLoading.dismiss();
  }

  Future<void> showSuccessDialog(String message) async {
    isSuccess = true;
    await EasyLoading.showSuccess(message);
  }

  Future<void> showErrorDialog() async {
    isError = true;
    await EasyLoading.showError("");
  }
}
