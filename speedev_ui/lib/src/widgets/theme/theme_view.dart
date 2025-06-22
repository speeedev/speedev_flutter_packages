import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedev_ui/src/providers/theme_provider.dart';

class SDThemeView extends StatelessWidget {
  final Widget child;
  const SDThemeView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<SDThemeProvider>(
      builder: (context, themeManager, child) {
        return Theme(
          data: themeManager.themeData,
          child: child!,
        );
      },
    );
  }
}