import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:speedev_ui/speedev_ui.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SDUIFeedbackHelper {
  static Future<void> showLoading() async {
    await EasyLoading.show();
  }

  static Future<void> hideLoading() async {
    await EasyLoading.dismiss();
  }

  static Future<void> showSuccessSnackBar({
    required BuildContext context,
    required String message,
    Icon icon = const Icon(Icons.sentiment_very_satisfied),
    Duration duration = const Duration(seconds: 3),
  }) async {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        icon: icon,
      ),
      displayDuration: duration,
    );
  }

  static Future<void> showErrorSnackBar({
    required BuildContext context,
    required String message,
    Icon icon = const Icon(Icons.sentiment_very_dissatisfied),
    Duration duration = const Duration(seconds: 3),
  }) async {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        icon: icon,
      ),
      displayDuration: duration,
    );
  }

  static Future<void> showInfoSnackBar({
    required BuildContext context,
    required String message,
    Icon icon = const Icon(Icons.info),
    Duration duration = const Duration(seconds: 3),
  }) async {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.info(message: message, icon: icon), displayDuration: duration);
  }

  static void showNetworkError({required BuildContext context, String? message}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message ?? "No internet connection. Please check your internet connection.",
        icon: const Icon(Icons.wifi_off),
      ),
    );
  }

  static Future<void> vibrateSuccess() async {
    await HapticFeedback.lightImpact();
  }

  static Future<void> vibrateError() async {
    await HapticFeedback.heavyImpact();
  }

  static Future<bool?> showConfirmDialog({
    required BuildContext context,
    String title = "Confirm",
    String content = "Are you sure you want to continue?",
    String confirmText = "Yes",
    String cancelText = "No",
    Function? onConfirm,
    Function? onCancel,
  }) async {
    SDAlert.show(
      context: context,
      title: SDText(title, style: context.textTheme.titleLarge),
      content: SDText(content, style: context.textTheme.bodyMedium),
      actions: [
        SDButton.text(
          onPressed: () {
            onCancel?.call();
            SDAlert.close(context);
          },
          child: SDText(cancelText, style: context.textTheme.bodyMedium),
        ),
        SDButton.text(
          onPressed: () {
            onConfirm?.call();
            SDAlert.close(context);
          },
          child: SDText(confirmText, style: context.textTheme.bodyMedium),
        ),
      ],
    );
    return null;
  }
}
