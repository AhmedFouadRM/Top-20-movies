import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/utils/constant.dart';
import 'package:top_20_movies/views/movie_view/movie_view_builder.dart';
import 'package:top_20_movies/widgets/loading/image_loading.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({super.key, required this.trendModel});
  final MovieItemModel trendModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, MovieViewBuilder.id,
              arguments: trendModel.id);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: trendModel.posterPath != null
              ? CachedNetworkImage(
                  imageUrl: trendModel.posterPath!,
                  placeholder: (context, url) => const ImageLoading(
                    width: kTrendPosterWidth,
                  ),
                )
              : SizedBox(
                  width: kPosterWidth,
                  height: kPosterHeight,
                ),
        ),
      ),
    );
  }
}
