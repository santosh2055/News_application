import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

displayShimmer({
  double? shimmerContainerHeight,
  double? shimmerContainerWidth,
  double borderRadius = 0,
}) {
  return SafeArea(
    child: Container(
      width: shimmerContainerWidth,
      height: shimmerContainerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Shimmer.fromColors(
        period: const Duration(seconds: 1),
        baseColor: const Color.fromRGBO(232, 230, 225, 1),
        highlightColor: Colors.grey,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color:const Color.fromRGBO(232, 230, 225, 1),
          ),
        ),
      ),
    ),
  );
}
