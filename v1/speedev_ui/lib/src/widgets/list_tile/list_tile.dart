import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/speedev_ui.dart';

class SDListTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Widget? additionalInfo;
  final Function()? onTap;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const SDListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.additionalInfo,
    this.onTap,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBackgroundColor = backgroundColor ?? (onTap != null ? context.colors.surfaceContainerHigh : context.colors.surfaceContainerLow);
        
    final listTile = PlatformListTile(
      material: (_, __) => MaterialListTileData(
        titleAlignment: ListTileTitleAlignment.center,
        textColor: context.colors.onSurface,
        tileColor: backgroundColor ?? defaultBackgroundColor,
        contentPadding: padding ?? EdgeInsets.zero,
      ),
      cupertino: (_, __) => CupertinoListTileData(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        additionalInfo: additionalInfo,
        onTap: onTap,
        backgroundColor: backgroundColor ?? defaultBackgroundColor,
        padding: padding ?? EdgeInsets.zero,
      ),
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
    );

    if (backgroundColor != null) {
      return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: SDRadius.large(),
          border: Border(bottom: BorderSide(color: context.colors.outline)),
        ),
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
