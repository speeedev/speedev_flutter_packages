import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDModalBottomSheet {
  static void show(BuildContext context, Widget child) {
    showPlatformModalSheet(
      context: context,
      builder: (context) => child,
    );
  }
}