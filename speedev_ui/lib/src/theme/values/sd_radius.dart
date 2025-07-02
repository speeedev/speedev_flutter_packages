import 'package:flutter/material.dart';

enum SDRadiusValues {
  none(radiusValue: 0),
  small(radiusValue: 5),
  medium(radiusValue: 10),
  large(radiusValue: 16),
  xLarge(radiusValue: 24),
  xxLarge(radiusValue: 32),
  rounded(radiusValue: 50);

  final double radiusValue;
  const SDRadiusValues({required this.radiusValue});
}

class SDRadius extends BorderRadius {
  SDRadius.none()
      : super.all(
          Radius.circular(SDRadiusValues.none.radiusValue),
        );

  SDRadius.small()
      : super.all(
          Radius.circular(SDRadiusValues.small.radiusValue),
        );

  SDRadius.medium()
      : super.all(
          Radius.circular(SDRadiusValues.medium.radiusValue),
        );

  SDRadius.large()
      : super.all(
          Radius.circular(SDRadiusValues.large.radiusValue),
        );

  SDRadius.rounded()
      : super.all(
          Radius.circular(SDRadiusValues.rounded.radiusValue),
        );

  SDRadius.xLarge()
      : super.all(
          Radius.circular(SDRadiusValues.xLarge.radiusValue),
        );

  SDRadius.xxLarge()
      : super.all(
          Radius.circular(SDRadiusValues.xxLarge.radiusValue),
        );
}
