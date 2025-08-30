import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDModalBottomSheet {
  static void show({
    required BuildContext context,
    required Widget child,
    double topPadding = 80.0, // Üstten ne kadar boşluk bırakılacağı
    bool isDismissible = true,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showPlatformModalSheet(
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: child,
          ),
        ),
        cupertino: CupertinoModalSheetData(anchorPoint: Offset(0, 0)),
        material: MaterialModalSheetData(
          isDismissible: isDismissible,
          isScrollControlled: true,
        ),
      );
    });
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
