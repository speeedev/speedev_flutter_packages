import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/speedev_ui.dart';

class SDAppBar extends StatelessWidget {
  final Widget? title;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? automaticallyImplyLeading;

  const SDAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformAppBar(
      title: title ?? SDText(""),
      backgroundColor: backgroundColor,
      leading: leading,
      trailingActions: actions,
    );
  }
}
