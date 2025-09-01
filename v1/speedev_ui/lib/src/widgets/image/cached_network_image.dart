import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:speedev_ui/src/widgets/state/error/error_view.dart';
import 'package:speedev_ui/src/widgets/state/loading/loading_indicator.dart';

class SDCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  const SDCachedNetworkImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => const SDLoadingIndicator(),
      placeholder: (context, url) => const SDLoadingIndicator(),
      errorWidget: (context, url, error) => const SDErrorView(),
    );
  }
}
