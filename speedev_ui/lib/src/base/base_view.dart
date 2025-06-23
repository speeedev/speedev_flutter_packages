import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedev_ui/src/base/base_view_model.dart';

typedef BaseViewBuilder<T extends BaseViewModel> = Widget Function(BuildContext context, T viewModel);
typedef BaseViewOnInit<T extends BaseViewModel> = void Function(BuildContext context, T viewModel);
typedef BaseViewOnDispose<T extends BaseViewModel> = void Function(BuildContext context, T viewModel);

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({super.key, required this.viewModel, required this.builder, this.onInit, this.onDispose});
  final T viewModel;
  final BaseViewBuilder<T> builder;
  final BaseViewOnInit<T>? onInit;
  final BaseViewOnDispose<T>? onDispose;

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
