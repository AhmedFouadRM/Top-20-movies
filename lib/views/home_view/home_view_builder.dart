import 'package:flutter/material.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/services/genres_service.dart';
import 'package:top_20_movies/services/movies_servies.dart';
import 'package:top_20_movies/views/home_view/home_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeViewBuilder extends StatelessWidget {
  const HomeViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top 20 Movies')),
      body: FutureBuilder(
        future: initlize(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            FlutterNativeSplash.remove();
            return HomeView(movies: snapshot.data!);
          } else if (snapshot.hasError) {
            FlutterNativeSplash.remove();
            return Center(child: Text('${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<List<MovieItemModel>>> initlize() async {
    await GenresService().getGenres();
    List<MovieItemModel> trendList = await MoviesServices().getTrendingList();
    List<MovieItemModel> nowPlayingList =
        await MoviesServices().getMoviesList(Endpoints.nowPlaying);
    List<MovieItemModel> popularList =
        await MoviesServices().getMoviesList(Endpoints.popular);
    List<MovieItemModel> topRateList =
        await MoviesServices().getMoviesList(Endpoints.topRated);
    List<MovieItemModel> upComingList =
        await MoviesServices().getMoviesList(Endpoints.upComing);
    return [trendList, nowPlayingList, popularList, topRateList, upComingList];
  }
}
