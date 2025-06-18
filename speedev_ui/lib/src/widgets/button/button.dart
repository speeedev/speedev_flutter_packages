import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/speedev_ui.dart';
import 'package:speedev_ui/src/extensions/context_extension.dart';
import 'package:speedev_ui/src/theme/sd_padding.dart';
import 'package:speedev_ui/src/theme/sd_radius.dart';

enum SDButtonType { primary, secondary, text, icon }

class SDButton extends StatelessWidget {
  final SDButtonType type;
  final SDButtonState state;
  final VoidCallback? onPressed;
  final String? text;
  final IconData? icon;
  final ButtonStyle? style;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? textStyle;
  final double? width;

  const SDButton({
    super.key,
    this.type = SDButtonType.primary,
    this.state = SDButtonState.enabled,
    required this.onPressed,
    this.text,
    this.icon,
    this.style,
    this.leading,
    this.trailing,
    this.textStyle,
    this.width,
  });

  const SDButton.primary({
    super.key,
    required this.onPressed,
    this.state = SDButtonState.enabled,
    this.text = '',
    this.style,
    this.leading,
    this.trailing,
    this.icon,
    this.textStyle,
    this.width,
  }) : type = SDButtonType.primary;

  const SDButton.secondary({
    super.key,
    required this.onPressed,
    this.state = SDButtonState.enabled,
    this.text = '',
    this.style,
    this.leading,
    this.trailing,
    this.icon,
    this.textStyle,
    this.width,
  }) : type = SDButtonType.secondary;

  const SDButton.text({
    super.key,
    required this.onPressed,
    this.state = SDButtonState.enabled,
    this.text = '',
    this.style,
    this.leading,
    this.trailing,
    this.icon,
    this.textStyle,
    this.width,
  }) : type = SDButtonType.text;

  const SDButton.icon({
    super.key,
    required this.onPressed,
    this.state = SDButtonState.enabled,
    this.text = '',
    this.icon,
    this.style,
    this.leading,
    this.trailing,
    this.textStyle,
    this.width,
  }) : type = SDButtonType.icon;

  bool get _isEnabled => state == SDButtonState.enabled;
  bool get _isLoading => state == SDButtonState.loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.allWidth,
      height: 50,
      child: switch (type) {
        SDButtonType.primary => _buildPrimaryButton(context),
        SDButtonType.secondary => _buildSecondaryButton(context),
        SDButtonType.text => _buildTextButton(context),
        SDButtonType.icon => _buildIconButton(context),
      },
    );
  }

  Widget _buildButtonContent() {
    if (_isLoading) {
      return const CircularProgressIndicator.adaptive();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[leading!, 4.width],
        if (text != null) SDText(text!, style: textStyle),
        if (trailing != null) ...[4.width, trailing!],
      ],
    );
  }

  Color _getStateAwareColor(BuildContext context, {double baseAlpha = 1.0, double disabledAlpha = 0.5}) {
    return _isEnabled ? context.colors.primary.withValues(alpha: baseAlpha) : context.colors.primary.withValues(alpha: disabledAlpha);
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return PlatformElevatedButton(
      color: _getStateAwareColor(context),
      cupertino: (_, __) => CupertinoElevatedButtonData(
        color: _getStateAwareColor(context),
        disabledColor: _getStateAwareColor(context, baseAlpha: 0.5),
      ),
      onPressed: _isEnabled ? onPressed : null,
      child: _buildButtonContent(),
    );
  }

  Widget _buildSecondaryButton(BuildContext context) {
    final buttonColor = _getStateAwareColor(context);

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: buttonColor,
        side: BorderSide(color: buttonColor, width: 2),
        textStyle: textStyle?.copyWith(color: buttonColor),
        shape: RoundedRectangleBorder(borderRadius: SDRadius.medium()),
      ),
      onPressed: _isEnabled ? onPressed : null,
      child: _buildButtonContent(),
    );
  }

  Widget _buildTextButton(BuildContext context) {
    final buttonColor = _getStateAwareColor(context);

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: buttonColor,
        textStyle: textStyle,
        shape: RoundedRectangleBorder(borderRadius: SDRadius.medium()),
      ),
      onPressed: _isEnabled ? onPressed : null,
      child: _buildButtonContent(),
    );
  }

  Widget _buildIconButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: _isEnabled ? onPressed : null,
        child: Container(
          decoration: BoxDecoration(
            color: _getStateAwareColor(context, baseAlpha: 0.1, disabledAlpha: 0.05),
            shape: BoxShape.circle,
          ),
          padding: SDPadding.small(),
          child: Icon(
            icon,
            color: _getStateAwareColor(context),
          ),
        ),
      ),
    );
  }
}
