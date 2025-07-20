import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedev_ui/speedev_ui.dart';

class SDListSectionItem extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? prefix;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  final Color? backgroundColor;

  const SDListSectionItem({
    super.key, 
    this.title, 
    this.subtitle, 
    this.trailing, 
    this.prefix, 
    this.padding, 
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SDListTile(
      title: title ?? const SizedBox.shrink(), 
      subtitle: subtitle, 
      trailing: trailing, 
      leading: prefix, 
      onTap: onTap,
      backgroundColor: backgroundColor,
    );
  }
}
