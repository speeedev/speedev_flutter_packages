import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/src/widgets/form_section/form_section_item.dart';

class SDFormSection extends StatelessWidget {
  final Widget? header;
  final Widget? footer;
  final List<SDFormSectionItem> children;
  final EdgeInsets margin;

  const SDFormSection({super.key, this.header, this.footer, required this.children, this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (_, __) => _buildCupertinoFormSection(),
      material: (_, __) => _buildMaterialFormSection(),
    );
  }

  Widget _buildCupertinoFormSection() {
    return CupertinoFormSection(
      header: header,
      footer: footer,
      margin: margin,
      children: children,
    );
  }

  Widget _buildMaterialFormSection() {
    return Container(
      margin: margin,
      child: ListView.builder(
        itemBuilder: (context, index) => children[index],
        itemCount: children.length,
      ),
    );
  }
}
