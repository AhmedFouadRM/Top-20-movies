import 'package:flutter/material.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/widgets/custom_rating_bar.dart';
import 'package:top_20_movies/widgets/poster_image.dart';

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
            PosterImage(movieModel: movieItemModel),
            const SizedBox(
              height: 4,
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
