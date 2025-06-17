import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedev_ui/src/base/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({super.key, required this.viewModel, required this.builder, this.onInit, this.onDispose});
  final T viewModel;
  final Widget Function(BuildContext context, T viewModel) builder;
  final Function(BuildContext context, T viewModel)? onInit;
  final Function(BuildContext context, T viewModel)? onDispose;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
    viewModel.showLoadingDialog();
    viewModel.init(context);
    widget.onInit?.call(context, viewModel);
    WidgetsBinding.instance.addPostFrameCallback((_) => viewModel.hideLoadingDialog());
  }

  @override
  void dispose() {
    widget.onDispose?.call(context, viewModel);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<T>(
        builder: (context, value, child) {
          return widget.builder(context, value);
        },
      ),
    );
  }
}
