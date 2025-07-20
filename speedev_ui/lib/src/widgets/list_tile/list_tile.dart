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
  final bool notched;
  
  const SDListTile({
    super.key, 
    required this.title, 
    this.subtitle, 
    this.leading, 
    this.trailing, 
    this.additionalInfo,
    this.onTap,
    this.notched = false,
  });

  // Notched constructor ekleyelim
  const SDListTile.notched({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.additionalInfo,
    this.onTap,
  }) : notched = true;

  @override
  Widget build(BuildContext context) {
    return PlatformListTile(
      material: (_, __) => MaterialListTileData(
        titleAlignment: ListTileTitleAlignment.center,
        textColor: context.theme.colorScheme.onSurface,
      ),
      cupertino: (_, __) => CupertinoListTileData(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        additionalInfo: additionalInfo,
        onTap: onTap,
      ),
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
    );
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
