import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/speedev_ui.dart';
import 'package:speedev_ui/src/extensions/context_extension.dart';
import 'package:speedev_ui/src/theme/sd_radius.dart';

enum SDButtonType { primary, secondary, text, icon }

class SDButton extends StatefulWidget {
  final Widget child;
  final void Function()? onPressed;
  final SDButtonState? state;
  final Widget? prefix;
  final Widget? suffix;
  final SDButtonType _type;
  final EdgeInsetsGeometry? padding;

  const SDButton.primary({
    super.key,
    required this.child,
    this.onPressed,
    this.state = SDButtonState.enabled,
    this.prefix,
    this.suffix,
    this.padding,
  }) : _type = SDButtonType.primary;

  @override
  State<SDButton> createState() => _SDButtonState();
}

class _SDButtonState extends State<SDButton> {
  @override
  Widget build(BuildContext context) {
    switch (widget._type) {
      case SDButtonType.primary:
        return _buildPrimaryButton();
      default:
        return Container();
    }
  }

  Widget _buildPrimaryButton() {
    return PlatformWidget(
      material: (_, __) => _buildMaterialPrimaryButton(),
      cupertino: (_, __) => _buildCupertinoPrimaryButton(),
    );
  }

  Widget _buildMaterialPrimaryButton() {
    return SizedBox(
      width: context.allWidth,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: widget.padding,
          backgroundColor: context.colors.primary,
          foregroundColor: context.colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: SDRadius.medium(),
          ),
        ),
        onPressed: widget.state == SDButtonState.enabled ? widget.onPressed : null,
        child: _primaryButtonContent(),
      ),
    );
  }

  Widget _buildCupertinoPrimaryButton() {
    return SizedBox(
      width: context.allWidth,
      height: 56,
      child: CupertinoButton(
        onPressed: widget.state == SDButtonState.enabled ? widget.onPressed : null,
        padding: widget.padding,
        color: context.colors.primary,
        disabledColor: context.colors.primary.withValues(alpha: 0.5),
        child: _primaryButtonContent(),
      ),
    );
  }

  Widget _primaryButtonContent() {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (widget.state == SDButtonState.loading)
          SizedBox(
            width: 16,
            height: 16,
            child: PlatformCircularProgressIndicator(
              material: (_, __) => MaterialProgressIndicatorData(
                color: context.colors.primary,
              ),
              cupertino: (_, __) => CupertinoProgressIndicatorData(
                color: context.colors.primary,
              ),
            ),
          ),
        if (widget.state != SDButtonState.loading)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.prefix ?? const SizedBox.shrink(),
              6.width,
              (widget.child is SDText) ? SDText((widget.child as SDText).text, style: (widget.child as SDText).style?.copyWith(color: context.colors.onPrimary)) : widget.child,
              6.width,
              widget.suffix ?? const SizedBox.shrink(),
            ],
          ),
      ],
    );
  }
}
