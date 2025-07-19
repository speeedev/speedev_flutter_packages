import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDAppBar extends PlatformAppBar {
  @override
  final Widget? title;
  @override
  final Color? backgroundColor;
  @override
  final Widget? leading;
  @override
  final List<Widget>? actions;
  @override
  final bool? automaticallyImplyLeading;
    
  SDAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
  }) : super(
          title: title,
          backgroundColor: backgroundColor,
          leading: leading ?? const Icon(Icons.arrow_back),
          trailingActions: actions ?? [],
          automaticallyImplyLeading: automaticallyImplyLeading,
        );
}
