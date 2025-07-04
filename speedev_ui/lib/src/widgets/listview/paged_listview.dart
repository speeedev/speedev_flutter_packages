import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:speedev_core/speedev_core.dart';
import 'package:speedev_ui/src/widgets/state/error/error_view.dart';
import 'package:speedev_ui/src/widgets/state/loading/loading_indicator.dart';

typedef InfiniteListViewFuture<T> = Future<List<T>> Function(int pageSize, int pageKey);

class SDPagedListView<T> extends StatefulWidget {
  final ItemWidgetBuilder<T> itemBuilder;
  final Widget? emptyView;
  final PagingController<int, T>? pagingController;
  final InfiniteListViewFuture<T>? future;
  final Widget? separator;
  final ScrollController? scrollController;
  final bool isScrollable;
  final bool? onRefreshActive;
  final GlobalKey<RefreshIndicatorState>? refreshIndicatorKey;
  final bool isSliver;
  final Axis scrollDirection;

  const SDPagedListView({
    super.key,
    required this.itemBuilder,
    this.pagingController,
    this.emptyView = const SizedBox.shrink(),
    this.future,
    this.separator,
    this.scrollController,
    this.isScrollable = true,
    this.onRefreshActive = true,
    this.refreshIndicatorKey,
    this.isSliver = false,
    this.scrollDirection = Axis.vertical,
  }) : assert((pagingController != null && future == null) || (pagingController == null && future != null), 'Either pagingController or future must be non-null, but not both and not neither.');

  @override
  State<SDPagedListView<T>> createState() => _SDPagedListViewState<T>();
}

class _SDPagedListViewState<T> extends State<SDPagedListView<T>> with AutomaticKeepAliveClientMixin {
  late final PagingController<int, T> _pagingController;

  @override
  void initState() {
    if (widget.pagingController == null && widget.future != null) {
      _pagingController = PagingController<int, T>(firstPageKey: 1);
      _pagingController.defaultFetchPage<T>(future: widget.future!);
    } else {
      _pagingController = widget.pagingController!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final listView = widget.isSliver ? pagedSliverListView() : pagedListView();

    return widget.onRefreshActive == true
        ? RefreshIndicator(
            key: widget.refreshIndicatorKey,
            onRefresh: () => Future.sync(() => _pagingController.refresh()),
            child: listView,
          )
        : listView;
  }

  Widget pagedListView() {
    return PagedListView.separated(
      scrollController: widget.scrollController ?? ScrollController(),
      physics: widget.isScrollable ? null : const NeverScrollableScrollPhysics(),
      shrinkWrap: !widget.isScrollable,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<T>(
        noItemsFoundIndicatorBuilder: (context) {
          return widget.emptyView!;
        },
        transitionDuration: const Duration(milliseconds: 2500),
        newPageProgressIndicatorBuilder: (_) => const SDLoadingIndicator(),
        firstPageProgressIndicatorBuilder: (_) => const SDLoadingIndicator(),
        firstPageErrorIndicatorBuilder: (context) {
          return SDErrorView(
            onTryAgain: () {
              _pagingController.refresh();
            },
          );
        },
        itemBuilder: (BuildContext context, T item, int index) {
          return widget.itemBuilder(context, item, index);
        },
      ),
      separatorBuilder: (BuildContext context, int index) {
        return widget.separator ?? Container();
      },
    );
  }

  Widget pagedSliverListView() {
    return PagedSliverList.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<T>(
        noItemsFoundIndicatorBuilder: (context) {
          return widget.emptyView!;
        },
        transitionDuration: const Duration(milliseconds: 2500),
        newPageProgressIndicatorBuilder: (_) => const SDLoadingIndicator(),
        firstPageProgressIndicatorBuilder: (_) => const SDLoadingIndicator(),
        firstPageErrorIndicatorBuilder: (context) {
          return SDErrorView(onTryAgain: () {
            _pagingController.refresh();
          });
        },
        itemBuilder: (BuildContext context, T item, int index) {
          return widget.itemBuilder(context, item, index);
        },
      ),
      separatorBuilder: (BuildContext context, int index) {
        return widget.separator ?? Container();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

extension PagingControllerExtension on PagingController {
  void defaultFetchPage<T>({
    required Future<List<T>> Function(int pageSize, int pageKey) future,
    int pageSize = 10,
    void Function(List<T> items)? onItemsFetch,
    VoidCallback? onLastPage,
  }) async {
    addPageRequestListener((pageKey) async {
      try {
        List<T> newItems = [];
        newItems = (await future(pageSize, pageKey)).cast<T>();

        final isLastPage = newItems.length < pageSize;
        if (isLastPage) {
          appendLastPage(newItems);
          onLastPage?.call();
        } else {
          final nextPageKey = pageKey + 1;
          appendPage(newItems, nextPageKey);
        }
        onItemsFetch?.call(newItems);
      } catch (e, stackTrace) {
        SDLoggerHelper().error("Error in fetch page method in infinite list view.");
        error = e;
        await SDFirebaseCrashlyticsService().recordError(error: e, stackTrace: stackTrace);
      }
    });
  }
}
