import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDAleart {
  static void show(BuildContext context, Widget title, Widget content, List<Widget> actions) {
    showPlatformDialog(
      context: context,
      builder: (context) => PlatformAlertDialog(
        title: (title),
        content: (content),
        actions: (actions),
      ),
    );
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
