import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/services.dart';

class SDTextInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? enabled;
  final bool? readOnly;
  final bool? autofocus;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final TextInputFormatter? inputFormatter;
  const SDTextInput({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.obscureText,
    this.enabled,
    this.readOnly,
    this.autofocus,
    this.maxLines,
    this.maxLength,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.validator,
    this.inputFormatter,
  });

  @override
  State<SDTextInput> createState() => _SDTextInputState();
}

class _SDTextInputState extends State<SDTextInput> {
  @override
  Widget build(BuildContext context) {
    return PlatformTextFormField(
      controller: widget.controller,
      hintText: widget.hintText,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      inputFormatters: widget.inputFormatter != null ? [widget.inputFormatter!] : null,
    );
  }
}
