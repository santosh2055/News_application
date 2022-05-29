import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'dispay_shimmer.dart';

displayNetworkImageWithErrorControl({
  required String imageName,
  double? imageWidth,
  double? imageHeight,
  BoxFit fit = BoxFit.contain,
  double borderRadius = 0,
  double padding = 0,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    child: imageName != 'null'
        ? Padding(
            padding: EdgeInsets.all(padding),
            child: CachedNetworkImage(
              imageUrl: imageName,
              width: imageWidth,
              height: imageHeight,
              fit: fit,
              placeholder: (context, url) => displayShimmer(),
              errorWidget: (context, url, error) => displayShimmer(),
            ),
          )
        : displayShimmer(
            shimmerContainerHeight: imageHeight,
            shimmerContainerWidth: imageWidth,
          ),
  );
}
