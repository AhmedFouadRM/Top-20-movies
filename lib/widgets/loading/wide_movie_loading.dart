import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_20_movies/utils/constant.dart';
import 'package:top_20_movies/widgets/loading/image_loading.dart';

class WideMovieLoading extends StatelessWidget {
  const WideMovieLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey[300]!
            : const Color(0xFF1C3439),
        highlightColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey[100]!
            : const Color(0xFF334A50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageLoading(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: kTitleTextHight,
                      width: 240,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    const SizedBox(height: kPadding),
                    Container(
                      height: kSubTitleTextHight,
                      width: 160,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    Container(
                      height: kSubTitleTextHight,
                      width: 80,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    const SizedBox(height: kPadding),
                    Container(
                      height: kSubTitleTextHight,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    Container(
                      height: kSubTitleTextHight,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    Container(
                      height: kSubTitleTextHight,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    Container(
                      height: kSubTitleTextHight,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    Container(
                      height: kSubTitleTextHight,
                      width: 240,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
