import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SDPagingController<PageKeyType, ItemType> extends PagingController<PageKeyType, ItemType> {
  SDPagingController({
    required super.firstPageKey,
    super.invisibleItemsThreshold,
  });
}