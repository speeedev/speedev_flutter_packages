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
  const SDListSection({super.key, required this.children, this.header, this.footer, this.margin = EdgeInsets.zero, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (_, __) => _buildCupertinoListSection(context),
      material: (_, __) => _buildMaterialListSection(context),
    );
  }

  Widget _buildCupertinoListSection(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: header,
      footer: footer,
      backgroundColor: backgroundColor ?? context.colors.surfaceContainer,
      children: children,
    );
  }

  Widget _buildMaterialListSection(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: SDRadius.large(),
        color: backgroundColor ?? context.colors.surfaceContainer,
      ),
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
    );
  }
}
