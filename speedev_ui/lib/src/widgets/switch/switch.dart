import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  const SDSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PlatformSwitch(
      value: value,
      onChanged: onChanged,
    );
  }
}
