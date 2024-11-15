import 'package:flutter/widgets.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/services/movies_servies.dart';

class MoviesProvider extends ChangeNotifier {
  Map<int, String>? genres;
  List<MovieItemModel>? trendList;
  List<MovieItemModel>? nowPlayingList;
  List<MovieItemModel>? popularList;
  List<MovieItemModel>? topRateList;
  List<MovieItemModel>? upComingList;

  bool isLoading = false;

  MoviesProvider() {
    initlize();
  }

  initlize() async {
    isLoading = true;
    genres = await MoviesServices().getGenres();
    trendList = await MoviesServices().getTrendingList();
    nowPlayingList = await MoviesServices().getMoviesList(Endpoints.nowPlaying);
    popularList = await MoviesServices().getMoviesList(Endpoints.popular);
    topRateList = await MoviesServices().getMoviesList(Endpoints.topRated);
    upComingList = await MoviesServices().getMoviesList(Endpoints.upComing);
    isLoading = false;
    notifyListeners();
  }

  loadGenres() async {
    isLoading = true;
    genres = await MoviesServices().getGenres();
    isLoading = false;
    notifyListeners();
  }
}
