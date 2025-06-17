import 'package:flutter/material.dart';

extension IntExtension on int {
  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());
}