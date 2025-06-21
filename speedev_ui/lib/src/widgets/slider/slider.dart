import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDSlider extends StatelessWidget {
  final double value;
  final Function(double) onChanged;
  final double min;
  final double max;
  final double divisions;
  final Function(double)? onChangeEnd;
  final Function(double)? onChangeStart;
  const SDSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 1,
    this.divisions = 1,
    this.onChangeEnd,
    this.onChangeStart,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformSlider(value: value, onChanged: onChanged, min: min, max: max, onChangeEnd: onChangeEnd, onChangeStart: onChangeStart);
  }
}
