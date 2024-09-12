import 'package:flutter/material.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/models/review_model.dart';
import 'package:top_20_movies/utils/helper.dart';
import 'package:intl/intl.dart';

import '../custom_rating_bar.dart';
import '../review_item.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({
    super.key,
    required this.movie,
    required this.reviews,
  });
  final List<ReviewModel> reviews;
  final MovieItemModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          movie.tagline != ''
              ? Text(
                  movie.tagline!,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).hintColor,
                  ),
                )
              : const SizedBox(),
          movie.overview != ''
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Overview',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      movie.overview,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                )
              : const SizedBox(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'About',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              movie.voteCount! > 0
                  ? Row(
                      children: [
                        Text(
                          'rating: ${movie.voteAverage.toStringAsFixed(1)}/10',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        CustomRatingBar(rating: movie.voteAverage / 2),
                      ],
                    )
                  : const Text(
                      'Not rated yet',
                      style: TextStyle(fontSize: 16),
                    ),
              Text(
                'Release Date: ${movie.releaseDate}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Category: ${movie.genres}',
                style: const TextStyle(fontSize: 16),
              ),
              movie.runtime! > 0
                  ? Text(
                      'Duration: ${durationToString(movie.runtime!)}',
                      style: const TextStyle(fontSize: 16),
                    )
                  : const SizedBox(),
              movie.revenue! > 0
                  ? Text(
                      'Revenue: ${NumberFormat.compactSimpleCurrency(
                        locale: 'en_US',
                        decimalDigits: 2,
                      ).format(movie.revenue)}',
                      style: const TextStyle(fontSize: 16),
                    )
                  : const SizedBox(),
              movie.budget! > 0
                  ? Text(
                      'Budget: ${NumberFormat.compactSimpleCurrency(
                        locale: 'en_US',
                        decimalDigits: 2,
                      ).format(movie.budget)}',
                      style: const TextStyle(fontSize: 16),
                    )
                  : const SizedBox(),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Reviews',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          reviews.isEmpty
              ? const Text('No reviews yet')
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: reviews.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ReviewItem(review: reviews[index]);
                  }),
        ],
      ),
    );
  }
}
