import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedev_ui/speedev_ui.dart';

class SDFormSectionItem extends StatelessWidget {
  final Widget? trailing;
  final Widget? prefix;
  final Widget? title;
  final EdgeInsetsGeometry? padding;
  final Widget? subtitle;
  final Color? backgroundColor;
  final void Function()? onTap;

  const SDFormSectionItem({super.key, this.trailing, this.prefix, this.title, this.padding, this.subtitle, this.onTap, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SDListTile(
      title: title ?? const SizedBox.shrink(),
      subtitle: subtitle,
      trailing: trailing,
      leading: prefix,
      onTap: onTap,
      backgroundColor: backgroundColor ?? context.colors.surfaceContainer,
    );
  }
}
