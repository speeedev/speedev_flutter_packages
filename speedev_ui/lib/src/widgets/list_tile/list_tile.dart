import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/src/helpers/extensions/context_extension.dart';

class SDListTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onTap;
  const SDListTile({super.key, required this.title, this.subtitle, this.leading, this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return PlatformListTile(
      material: (_, __) => MaterialListTileData(
        titleAlignment: ListTileTitleAlignment.center,
        textColor: context.theme.colorScheme.onSurface,
      ),
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
