import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  Widget padding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  Widget margin(EdgeInsetsGeometry margin) {
    return Container(margin: margin, child: this);
  }

  SliverToBoxAdapter toSliver() {
    return SliverToBoxAdapter(child: this);
  }

  Widget center() {
    return Center(child: this);
  }

  Widget expanded() {
    return Expanded(child: this);
  }
}
