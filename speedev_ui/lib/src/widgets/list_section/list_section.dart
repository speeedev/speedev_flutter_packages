import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/src/helpers/extensions/context_extension.dart';
import 'package:speedev_ui/src/theme/values/sd_radius.dart';
import 'package:speedev_ui/src/widgets/list_section/list_section_item.dart';

class SDListSection extends StatelessWidget {
  final List<SDListSectionItem> children;
  final Widget? header;
  final Widget? footer;
  final EdgeInsets margin;
  final Color? backgroundColor;
  final Color? itemBackgroundColor;
  
  const SDListSection({
    super.key, 
    required this.children, 
    this.header, 
    this.footer, 
    this.margin = EdgeInsets.zero, 
    this.backgroundColor,
    this.itemBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final updatedChildren = children.map((child) {
      if (itemBackgroundColor != null && child.backgroundColor == null) {
        return SDListSectionItem(
          title: child.title,
          subtitle: child.subtitle,
          trailing: child.trailing,
          prefix: child.prefix,
          padding: child.padding,
          onTap: child.onTap,
          backgroundColor: itemBackgroundColor,
        );
      }
      return child;
    }).toList();

    return PlatformWidget(
      cupertino: (_, __) => _buildCupertinoListSection(context, updatedChildren),
      material: (_, __) => _buildMaterialListSection(context, updatedChildren),
    );
  }

  Widget _buildCupertinoListSection(BuildContext context, List<SDListSectionItem> children) {
    return CupertinoListSection.insetGrouped(
      header: header,
      footer: footer,
      margin: EdgeInsets.zero,
      backgroundColor: backgroundColor ?? context.colors.surfaceContainer,
      children: children,
    );
  }

  Widget _buildMaterialListSection(BuildContext context, List<SDListSectionItem> children) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: SDRadius.large(),
        child: Column(
          children: [
            if (header != null) header!,
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => children[index],
              separatorBuilder: (context, index) => const Divider(),
              itemCount: children.length,
            ),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}
