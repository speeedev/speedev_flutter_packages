import 'package:flutter/material.dart';

extension IntExtension on int {
  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());
}

extension DoubleExtension on double {
  EdgeInsets get toEdgeInsets => EdgeInsets.all(this);
  EdgeInsets get toEdgeInsetsOnlyTop => EdgeInsets.only(top: this);
  EdgeInsets get toEdgeInsetsOnlyBottom => EdgeInsets.only(bottom: this);
  EdgeInsets get toEdgeInsetsOnlyLeft => EdgeInsets.only(left: this);
  EdgeInsets get toEdgeInsetsOnlyRight => EdgeInsets.only(right: this);

  EdgeInsets get toEdgeInsetsOnlyHorizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get toEdgeInsetsOnlyVertical => EdgeInsets.symmetric(vertical: this);
}
