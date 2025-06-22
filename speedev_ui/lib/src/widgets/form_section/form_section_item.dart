import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/speedev_ui.dart';

class SDFormSectionItem extends StatelessWidget {
  final Widget? trailing;
  final Widget? prefix;
  final EdgeInsetsGeometry? padding;
  final Widget? helper;
  final void Function()? onTap;

  const SDFormSectionItem({super.key, this.trailing, this.prefix, this.padding, this.helper, this.onTap});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (_, __) => _buildCupertinoFormSectionItem(),
      material: (_, __) => _buildMaterialFormSectionItem(),
    );
  }

  Widget _buildCupertinoFormSectionItem() {
    return InkWell(
      onTap: onTap,
      child: CupertinoFormRow(
        prefix: prefix ?? const SizedBox.shrink(),
        padding: padding ?? EdgeInsets.zero,
        helper: helper ?? const SizedBox.shrink(),
        child: trailing ?? const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildMaterialFormSectionItem() {
    return SDListTile(
      title: prefix ?? const SizedBox.shrink(),
      subtitle: helper ?? const SizedBox.shrink(),
      trailing: trailing ?? const SizedBox.shrink(),
      leading: prefix ?? const SizedBox.shrink(),
      onTap: onTap,
    );
  }
}
