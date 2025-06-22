import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/speedev_ui.dart';
import 'package:flutter/material.dart';

class SDFormSection extends StatelessWidget {
  final Widget? header;
  final Widget? footer;
  final List<SDFormSectionItem> children;
  final EdgeInsets? margin;
  final Color? backgroundColor;

  const SDFormSection({super.key, this.header, this.footer, required this.children, this.margin, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (_, __) => _buildCupertinoFormSection(context),
      material: (_, __) => _buildMaterialFormSection(context),
    );
  }

  Widget _buildCupertinoFormSection(BuildContext context) {
    return CupertinoFormSection(
      backgroundColor: backgroundColor ?? context.colors.surfaceContainer,
      header: header,
      footer: footer,
      margin: margin ?? EdgeInsets.symmetric(horizontal: SDPadding.large().horizontal),
      children: children,
    );
  }

  Widget _buildMaterialFormSection(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: SDPadding.large().horizontal),
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
