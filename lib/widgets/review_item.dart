import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:top_20_movies/models/review_model.dart';
import 'package:top_20_movies/widgets/custom_rating_bar.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.author,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              review.createdAt,
              style:
                  TextStyle(fontSize: 16, color: Theme.of(context).hintColor),
            ),
            review.rating != null
                ? CustomRatingBar(rating: review.rating! / 2)
                : const SizedBox(),
            ReadMoreText(
              review.content,
              trimLines: 7,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Read more',
              trimExpandedText: 'Read less',
            ),
          ],
        ),
      ),
    );
  }
}
