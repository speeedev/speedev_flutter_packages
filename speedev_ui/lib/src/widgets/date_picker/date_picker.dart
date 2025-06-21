import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDDatePicker {
  static Future<DateTime?> show(BuildContext context, DateTime initialDate, DateTime firstDate, DateTime lastDate) async {
    return await showPlatformDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }
}
