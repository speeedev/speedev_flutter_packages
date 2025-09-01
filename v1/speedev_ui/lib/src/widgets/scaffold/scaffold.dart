import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/src/helpers/extensions/context_extension.dart';
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
    // Check if we need to use iOS large title
    if (appBar?.iosLargeTitle == true && Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoPageScaffold(
        backgroundColor: backgroundColor ?? context.colors.surface,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              CupertinoSliverNavigationBar(
                largeTitle: appBar?.title,
                backgroundColor: appBar?.backgroundColor,
                leading: appBar?.leading,
                trailing: appBar?.actions?.isNotEmpty == true 
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: appBar!.actions!,
                    )
                  : null,
                automaticallyImplyLeading: appBar?.automaticallyImplyLeading ?? true,
              ),
            ];
          },
          body: Padding(
            padding: bodyPadding ?? SDPadding.medium(),
            child: body,
          ),
        ),
      );
    }
    
    // Default platform scaffold for non-iOS or when large title is not needed
    return PlatformScaffold(
      appBar: appBar,
      body: Padding(
        padding: bodyPadding ?? SDPadding.medium(),
      child: body,
      ),
      bottomNavBar: bottomNavBar,
      backgroundColor: backgroundColor ?? context.colors.surface,
    );
  }
}
