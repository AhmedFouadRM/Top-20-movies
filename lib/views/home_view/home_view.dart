import 'package:flutter/material.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/services/movies_servies.dart';

import '../../widgets/smallMovies/small_movie_list_view.dart';
import '../../widgets/custom_carousel_slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.movies});

  final List<List<MovieItemModel>> movies;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CustomCarouselSlider(trendList: movies[0])),
        SliverToBoxAdapter(
            child: SmallMovieListView(
          movieList: movies[1],
          name: 'Now Playing',
          endpoint: Endpoints.nowPlaying,
        )),
        SliverToBoxAdapter(
            child: SmallMovieListView(
          movieList: movies[2],
          name: 'Popular',
          endpoint: Endpoints.popular,
        )),
        SliverToBoxAdapter(
            child: SmallMovieListView(
          movieList: movies[3],
          name: 'Top Rate',
          endpoint: Endpoints.topRated,
        )),
        SliverToBoxAdapter(
            child: SmallMovieListView(
          movieList: movies[4],
          name: 'Up Coming',
          endpoint: Endpoints.upComing,
        )),
      ],
    );
  }
}
