import 'package:flutter/material.dart';
import 'package:speedev_ui/src/const/view_state_enum.dart';
import 'package:speedev_ui/src/widgets/state/loading/loading_indicator.dart';

class SDStateView extends StatefulWidget {
  final SDViewState viewState;
  final Widget? loadingWidget;
  final Widget? successWidget;
  final Widget? errorWidget;
  final Widget? initialWidget;
  const SDStateView({super.key, required this.viewState, this.loadingWidget, this.successWidget, this.errorWidget, this.initialWidget});

  @override
  State<SDStateView> createState() => _SDStateViewState();
}

class _SDStateViewState extends State<SDStateView> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.viewState) {
      SDViewState.initial => widget.initialWidget ?? const SizedBox.shrink(),
      SDViewState.loading => widget.loadingWidget ?? const SDLoadingIndicator(),
      SDViewState.success => widget.successWidget ?? const SizedBox.shrink(),
      SDViewState.error => widget.errorWidget ?? const SizedBox.shrink(),
    };
  }
}
