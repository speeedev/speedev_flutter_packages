import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/src/theme/values/sd_padding.dart';
import 'package:speedev_ui/src/widgets/appbar/appbar.dart';
import 'package:speedev_ui/src/widgets/bottom_nav_bar/bottom_nav_bar.dart';

class SDScaffold extends StatelessWidget {
  final Widget body;
  final SDAppBar? appBar;
  final SDBottomNavBar? bottomNavBar;
  final Color? backgroundColor;
  final EdgeInsets? bodyPadding;
  const SDScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavBar,
    this.backgroundColor,
    this.bodyPadding,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: appBar,
      body: Padding(
        padding: bodyPadding ?? SDPadding.medium(),
        child: body,
      ),
      bottomNavBar: bottomNavBar,
      backgroundColor: backgroundColor,
    );
  }
}
