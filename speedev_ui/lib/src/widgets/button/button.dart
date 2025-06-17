import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/src/const/button_state_enum.dart';
import 'package:speedev_ui/src/widgets/text/text.dart';

class SDButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final SDButtonState state;
  const SDButton({super.key, required this.text, required this.onPressed, this.state = SDButtonState.enabled});

  @override
  State<SDButton> createState() => _SDButtonState();
}

class _SDButtonState extends State<SDButton> {
  @override
  Widget build(BuildContext context) {
    return PlatformElevatedButton(
      onPressed: widget.onPressed,
      child: SDText(widget.text),
    );
  }
}