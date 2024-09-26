import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/utils/constant.dart';
import 'package:top_20_movies/views/movie_view/movie_view_builder.dart';
import 'package:top_20_movies/widgets/loading/image_loading.dart';

class WideMovieItem extends StatelessWidget {
  const WideMovieItem({super.key, required this.item});
  final MovieItemModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MovieViewBuilder.id, arguments: item.id);
      },
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kRadius),
              child: item.posterPath != null
                  ? CachedNetworkImage(
                      width: 150,
                      imageUrl: item.posterPath!,
                      placeholder: (context, url) =>
                          const ImageLoading(width: 150, height: 225),
                    )
                  : SizedBox(
                      width: 150,
                      height: 225,
                    ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(item.genres),
                    Text('${item.voteAverage} / 5'),
                    const SizedBox(height: 8),
                    Text(
                      item.overview,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
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
