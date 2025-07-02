import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SDLoadingIndicator extends StatelessWidget {
  final Indicator indicatorType;
  final double? size;
  const SDLoadingIndicator({super.key, this.indicatorType = Indicator.lineScale, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: LoadingIndicator(indicatorType: indicatorType),
    );
  }
}
