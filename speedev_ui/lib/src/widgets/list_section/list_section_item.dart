import 'package:flutter/cupertino.dart';
import 'package:speedev_ui/speedev_ui.dart';

class SDListSectionItem extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? prefix;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;

  const SDListSectionItem({super.key, this.title, this.subtitle, this.trailing, this.prefix, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SDListTile.notched(title: title ?? const SizedBox.shrink(), subtitle: subtitle, trailing: trailing, leading: prefix, onTap: onTap);
  }
}
