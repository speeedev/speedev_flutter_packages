import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDSwitch extends StatefulWidget {
  final bool value;
  final Function(bool) onChanged;
  const SDSwitch({super.key, required this.value, required this.onChanged});

  @override
  State<SDSwitch> createState() => _SDSwitchState();
}

class _SDSwitchState extends State<SDSwitch> {
  @override
  Widget build(BuildContext context) {
    return PlatformSwitch(
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}
