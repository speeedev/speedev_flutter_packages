import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDPopupMenu extends StatelessWidget {
  final List<PopupMenuOption> options;
  final Widget icon;
  final Function(dynamic)? onSelected;
  const SDPopupMenu({super.key, required this.options, required this.icon, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PlatformPopupMenu(options: options, icon: icon);
  }
}
