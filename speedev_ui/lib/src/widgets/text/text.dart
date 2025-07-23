import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/speedev_ui.dart';

class SDText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const SDText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = style ?? context.textTheme.bodyMedium;
    return PlatformText(text, style: textStyle, textAlign: textAlign, overflow: overflow, maxLines: maxLines);
  }
}
