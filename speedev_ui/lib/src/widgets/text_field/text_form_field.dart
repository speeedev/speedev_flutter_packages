import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDTextInput extends StatefulWidget {
  const SDTextInput({super.key});

  @override
  State<SDTextInput> createState() => _SDTextInputState();
}

class _SDTextInputState extends State<SDTextInput> {
  @override
  Widget build(BuildContext context) {
    return PlatformTextFormField(); // todo: add props
  }
}