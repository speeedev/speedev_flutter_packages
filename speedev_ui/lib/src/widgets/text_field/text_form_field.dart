import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speedev_ui/src/extensions/context_extension.dart';
import 'package:speedev_ui/src/theme/values/sd_padding.dart';
import 'package:speedev_ui/src/theme/values/sd_radius.dart';

class SDTextInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? enabled;
  final bool? readOnly;
  final bool? autofocus;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final TextInputFormatter? inputFormatter;
  final TextStyle? style;
  final Widget? prefix;
  final Widget? suffix;
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
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.validator,
    this.inputFormatter,
    this.style,
    this.prefix,
    this.suffix,
  });

  @override
  State<SDTextInput> createState() => _SDTextInputState();
}

class _SDTextInputState extends State<SDTextInput> {
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? _buildMaterialTextField() : _buildCupertinoTextField();
  }

  Widget _buildMaterialTextField() {
    return TextFormField(
      controller: widget.controller,
      style: widget.style,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText ?? false,
      enabled: widget.enabled ?? true,
      readOnly: widget.readOnly ?? false,
      autofocus: widget.autofocus ?? false,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatter != null ? [widget.inputFormatter!] : null,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: context.colors.primary,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: SDRadius.medium(), borderSide: BorderSide(color: context.colors.outline)),
        enabledBorder: OutlineInputBorder(borderRadius: SDRadius.medium(), borderSide: BorderSide(color: context.colors.outline)),
        focusedBorder: OutlineInputBorder(borderRadius: SDRadius.medium(), borderSide: BorderSide(color: context.colors.primary)),
        errorBorder: OutlineInputBorder(borderRadius: SDRadius.medium(), borderSide: BorderSide(color: context.colors.error)),
        disabledBorder: OutlineInputBorder(borderRadius: SDRadius.medium(), borderSide: BorderSide(color: context.colors.outline)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: SDRadius.medium(), borderSide: BorderSide(color: context.colors.error)),
        fillColor: context.colors.surfaceContainerLow,
        filled: true,
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
      ),
    );
  }

  Widget _buildCupertinoTextField() {
    return CupertinoTextField(
      controller: widget.controller,
      placeholder: widget.hintText,
      style: widget.style,
      placeholderStyle: widget.style != null ? widget.style!.copyWith(color: context.colors.onSurface.withValues(alpha: 0.5)) : TextStyle(color: context.colors.onSurface.withValues(alpha: 0.5)),
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText ?? false,
      enabled: widget.enabled ?? true,
      readOnly: widget.readOnly ?? false,
      autofocus: widget.autofocus ?? false,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      onSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatter != null ? [widget.inputFormatter!] : null,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: context.colors.primary,
      prefix: widget.prefix,
      suffix: widget.suffix,
      padding: EdgeInsets.symmetric(horizontal: SDPadding.medium().horizontal, vertical: SDPadding.medium().vertical),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLow,
        borderRadius: SDRadius.medium(),
        border: Border.all(color: Colors.transparent),
      ),
    );
  }
}
