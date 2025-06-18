import 'package:flutter/material.dart';

enum SDPaddingValues {
  none(paddingValue: 0),
  small(paddingValue: 4),
  medium(paddingValue: 8),
  large(paddingValue: 16),
  xlarge(paddingValue: 24),
  xxlarge(paddingValue: 32);

  final double paddingValue;
  const SDPaddingValues({required this.paddingValue});
}

class SDPadding extends EdgeInsets {
  SDPadding.none() : super.all(SDPaddingValues.none.paddingValue);
  SDPadding.small() : super.all(SDPaddingValues.small.paddingValue);
  SDPadding.medium() : super.all(SDPaddingValues.medium.paddingValue);
  SDPadding.large() : super.all(SDPaddingValues.large.paddingValue);
  SDPadding.xlarge() : super.all(SDPaddingValues.xlarge.paddingValue);
  SDPadding.xxlarge() : super.all(SDPaddingValues.xxlarge.paddingValue);
}
