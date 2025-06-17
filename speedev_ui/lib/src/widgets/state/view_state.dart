import 'package:flutter/material.dart';
import 'package:speedev_ui/src/const/view_state_enum.dart';
import 'package:speedev_ui/src/widgets/state/loading/loading_indicator.dart';

class SDStateView extends StatefulWidget {
  final SDViewState viewState;
  const SDStateView({super.key, required this.viewState});

  @override
  State<SDStateView> createState() => _SDStateViewState();
}

class _SDStateViewState extends State<SDStateView> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.viewState) {
      SDViewState.initial => const SizedBox.shrink(),
      SDViewState.loading => const SDLoadingIndicator(),
      SDViewState.success => const SizedBox.shrink(),
      SDViewState.error => const SizedBox.shrink(),
    };
  }
}