import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_20_movies/utils/constant.dart';

class ImageLoading extends StatelessWidget {
  const ImageLoading(
      {super.key, this.width = kPosterWidth, this.height = kPosterHeight});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      /*baseColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey[300]!
          : Colors.grey[850]!,
      highlightColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey[100]!
          : Colors.grey[800]!,*/
      baseColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey[300]!
          : const Color(0xFF1C3439),
      highlightColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey[100]!
          : const Color(0xFF334A50),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(kRadius)),
          color: Colors.white,
        ),
      ),
    );
  }
}
