import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/speedev_ui.dart';
import 'package:flutter/material.dart';

class SDFormSection extends StatelessWidget {
  final Widget? header;
  final Widget? footer;
  final List<SDFormSectionItem> children;
  final EdgeInsets? margin;
  final EdgeInsets? itemPadding;
  final Color? backgroundColor;

  const SDFormSection({super.key, this.header, this.footer, required this.children, this.margin, this.backgroundColor, this.itemPadding});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (_, __) => _buildCupertinoFormSection(context),
      material: (_, __) => _buildMaterialFormSection(context),
    );
  }

  Widget _buildCupertinoFormSection(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.symmetric(horizontal: SDPadding.medium().horizontal, vertical: SDPadding.small().vertical),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CupertinoFormSection(
          backgroundColor: backgroundColor ?? context.colors.surfaceContainer,
          header: header,
          footer: footer,
          margin: EdgeInsets.zero,
          children: children
              .map((child) => Padding(
                    padding: itemPadding ?? EdgeInsets.symmetric(horizontal: SDPadding.medium().horizontal, vertical: SDPadding.small().vertical),
                    child: child,
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildMaterialFormSection(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.symmetric(horizontal: SDPadding.medium().horizontal, vertical: SDPadding.small().vertical),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor ?? context.colors.surfaceContainer,
        ),
        child: Column(
          children: [
            if (header != null) header!,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: itemPadding ?? EdgeInsets.symmetric(horizontal: SDPadding.medium().horizontal, vertical: SDPadding.small().vertical),
                child: children[index],
              ),
              separatorBuilder: (context, index) => const Divider(height: 1, thickness: 0.5),
              itemCount: children.length,
            ),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}
