import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SDLoadingIndicator extends StatelessWidget {
  final Indicator indicatorType;
  const SDLoadingIndicator({super.key, this.indicatorType = Indicator.lineScale});

  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(indicatorType: indicatorType);
  }
}
