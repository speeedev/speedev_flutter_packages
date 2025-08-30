import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDModalBottomSheet {
  static void show({
    required BuildContext context,
    required Widget child,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showPlatformModalSheet(
        context: context,
        builder: (context) => child,
      );
    });
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
