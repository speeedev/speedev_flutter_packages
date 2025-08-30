import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get allWidth => mediaQuery.size.width;
  double get allHeight => mediaQuery.size.height;
}

extension BottomSheetExtension on BuildContext {
  void showSheet({
    required WidgetBuilder builder,
    bool isScrollControlled = false,
    bool useSafeArea = false,
    bool enableDrag = true,
    Color? backgroundColor,
    ShapeBorder? shape,
    Clip? clipBehavior,
    double? elevation,
    bool? showDragHandle,
    RouteSettings? routeSettings,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: this,
        builder: builder,
        isScrollControlled: isScrollControlled,
        useSafeArea: useSafeArea,
        enableDrag: enableDrag,
        backgroundColor: backgroundColor,
        shape: shape,
        clipBehavior: clipBehavior,
        elevation: elevation,
        showDragHandle: showDragHandle,
        routeSettings: routeSettings,
      );
    });
  }
}
