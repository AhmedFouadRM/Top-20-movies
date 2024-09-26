import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/utils/constant.dart';
import 'package:top_20_movies/widgets/loading/image_loading.dart';

class MovieViewAppBar extends StatelessWidget {
  const MovieViewAppBar({
    super.key,
    required this.movie,
  });

  final MovieItemModel movie;

  @override
  Widget build(BuildContext context) {
    double hight = (MediaQuery.of(context).size.width * 9 / 16) +
        kMovieHeaderPadding -
        MediaQuery.of(context).viewPadding.top;
    return SliverAppBar(
      expandedHeight: hight,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        titlePadding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top,
            bottom: 8,
            left: 8,
            right: 8),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kRadius),
              child: movie.backdropPath != null
                  ? CachedNetworkImage(
                      width: kPosterWidth,
                      imageUrl: movie.posterPath!,
                      placeholder: (context, url) => const ImageLoading(),
                    )
                  : SizedBox(
                      width: kPosterWidth,
                      height: kPosterHeight,
                    ),
            ),
            Expanded(
              child: Container(
                height: kMovieHeaderPadding,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AutoSizeText(
                    movie.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        background: Padding(
          padding: const EdgeInsets.only(bottom: kMovieHeaderPadding),
          child: movie.backdropPath != null
              ? CachedNetworkImage(
                  imageUrl: movie.backdropPath!,
                  placeholder: (context, url) => const AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ImageLoading(
                      width: double.infinity,
                    ),
                  ),
                )
              : const AspectRatio(
                  aspectRatio: 16 / 9,
                  child: SizedBox(
                    width: double.infinity,
                  ),
                ),
        ),
      ),
    );
  }
}
