import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/src/helpers/extensions/context_extension.dart';

class SDListTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Widget? additionalInfo;
  final Function()? onTap;
  final Color? backgroundColor;

  const SDListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.additionalInfo,
    this.onTap,
    this.backgroundColor,
  });

  const SDListTile.notched({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.additionalInfo,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final listTile = PlatformListTile(
      material: (_, __) => MaterialListTileData(
        titleAlignment: ListTileTitleAlignment.center,
        textColor: context.theme.colorScheme.onSurface,
        tileColor: backgroundColor ?? context.colors.surfaceContainer,
      ),
      cupertino: (_, __) => CupertinoListTileData(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        additionalInfo: additionalInfo,
        onTap: onTap,
        backgroundColor: backgroundColor ?? context.colors.surfaceContainer,
      ),
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
    );

    if (backgroundColor != null) {
      return Container(
        color: backgroundColor,
        child: listTile,
      );
    }

    return listTile;
  }
}

class SDListTileChevron extends StatelessWidget {
  const SDListTileChevron({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (_, __) => const CupertinoListTileChevron(),
      material: (_, __) => const Icon(Icons.chevron_right),
    );
  }
}
