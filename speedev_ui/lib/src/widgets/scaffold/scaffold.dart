import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDScaffold extends StatelessWidget {
  final Widget body;
  final PlatformAppBar? appBar;
  final PlatformNavBar? bottomNavBar;
  final Color? backgroundColor;
  const SDScaffold({super.key, required this.body, this.appBar, this.bottomNavBar, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: appBar,
      body: body,
      bottomNavBar: bottomNavBar,
      backgroundColor: backgroundColor,
    );
  }
}
