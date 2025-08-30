import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDPopupMenuOption extends PopupMenuOption {
  @override
  final void Function(PopupMenuOption)? onTap;

  SDPopupMenuOption({
    required super.label,
    this.onTap,
  }) : super(
          onTap: onTap,
        );
}
