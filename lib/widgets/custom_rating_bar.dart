import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    required this.rating,
    this.itemSize = 20,
  });

  final double rating;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rating,
      allowHalfRating: true,
      ignoreGestures: true,
      itemSize: itemSize,
      itemCount: 5,
      onRatingUpdate: (value) {},
      ratingWidget: RatingWidget(
        full: const Icon(Icons.star, color: Colors.amber),
        empty: const Icon(Icons.star_border, color: Colors.amber),
        half: const Icon(Icons.star_half, color: Colors.amber),
      ),
    );
  }
}
