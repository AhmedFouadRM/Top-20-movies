import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:top_20_movies/providers/movies_provider.dart';
import 'package:top_20_movies/providers/user_provider.dart';
import 'package:top_20_movies/services/movies_servies.dart';
import 'package:top_20_movies/widgets/custom_drawer.dart';

import '../../widgets/smallMovies/small_movie_list_view.dart';
import '../../widgets/custom_carousel_slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = '/home_view';
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, _) {
      return Consumer<MoviesProvider>(builder: (context, moviesProvider, _) {
        if (moviesProvider.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          FlutterNativeSplash.remove();
          return Scaffold(
            appBar: AppBar(title: const Text('Top 20 Movies')),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: CustomCarouselSlider(
                        trendList: moviesProvider.trendList!)),
                SliverToBoxAdapter(
                    child: SmallMovieListView(
                  movieList: moviesProvider.nowPlayingList!,
                  name: 'Now Playing',
                  endpoint: Endpoints.nowPlaying,
                )),
                SliverToBoxAdapter(
                    child: SmallMovieListView(
                  movieList: moviesProvider.popularList!,
                  name: 'Popular',
                  endpoint: Endpoints.popular,
                )),
                SliverToBoxAdapter(
                    child: SmallMovieListView(
                  movieList: moviesProvider.topRateList!,
                  name: 'Top Rate',
                  endpoint: Endpoints.topRated,
                )),
                SliverToBoxAdapter(
                    child: SmallMovieListView(
                  movieList: moviesProvider.upComingList!,
                  name: 'Up Coming',
                  endpoint: Endpoints.upComing,
                )),
              ],
            ),
            drawer:
                CustomDrawer(isLoggedIn: userProvider.getSessionID() != null),
          );
        }
      });
    });
  }
}
