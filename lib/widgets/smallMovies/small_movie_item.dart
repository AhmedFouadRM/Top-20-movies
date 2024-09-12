import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/views/movie_view/movie_view_builder.dart';
import 'package:top_20_movies/widgets/custom_rating_bar.dart';
import 'package:top_20_movies/widgets/loading/image_loading.dart';

class SmallMovieItem extends StatelessWidget {
  const SmallMovieItem({
    super.key,
    required this.movieItemModel,
  });
  final MovieItemModel movieItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MovieViewBuilder.id,
                    arguments: movieItemModel.id);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: movieItemModel.posterPath,
                  placeholder: (context, url) => const ImageLoading(),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              movieItemModel.title,
              style: const TextStyle(
                  fontSize: 14, overflow: TextOverflow.ellipsis),
            ),
            movieItemModel.voteCount! > 0
                ? CustomRatingBar(rating: movieItemModel.voteAverage / 2)
                : Text(
                    'Not rated yet',
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
          ],
        ),
      ),
    );
  }
}
