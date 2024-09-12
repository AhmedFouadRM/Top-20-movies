import 'package:dio/dio.dart';
import 'package:top_20_movies/models/cast_model.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/models/review_model.dart';
import 'package:top_20_movies/utils/constant.dart';

final dio = Dio();

enum Endpoints { nowPlaying, popular, topRated, upComing }

class MoviesServices {
  List<String> endPoints = ['now_playing', 'popular', 'top_rated', 'upcoming'];
  Future<MovieItemModel> getMovie(int id) async {
    try {
      final response = await dio.get('$kDomain/movie/$id?', queryParameters: {
        'api_key': kKey,
        'language': kLanguage,
      });
      return MovieItemModel.fromDetailedJson(response.data);
    } on DioException catch (e) {
      if (e.response != null &&
          e.response!.statusCode! >= 400 &&
          e.response!.statusCode! < 500) {
        throw (e.response!.data['status_message']);
      }
      throw ('There is an error, please try again');
    }
  }

  Future<List<MovieItemModel>> getTrendingList() async {
    List<MovieItemModel> trendList = [];
    try {
      final response =
          await dio.get('$kDomain/trending/movie/day?', queryParameters: {
        'api_key': kKey,
        'language': kLanguage,
      });
      List<dynamic> jsontrendList = response.data['results'];

      for (var item in jsontrendList) {
        trendList.add(MovieItemModel.fromSimpleJson(item));
      }
    } on DioException catch (e) {
      if (e.response != null &&
          e.response!.statusCode! >= 400 &&
          e.response!.statusCode! < 500) {
        throw (e.response!.data['status_message']);
      }
      throw ('There is an error, please try again');
    }
    return trendList;
  }

  Future<List<MovieItemModel>> getMoviesList(Endpoints endpoint,
      [page = 1]) async {
    List<MovieItemModel> moviesList = [];
    try {
      final response = await dio.get(
          '$kDomain/movie/${endPoints[endpoint.index]}?',
          queryParameters: {
            'api_key': kKey,
            'language': kLanguage,
            'region': kRegion,
            'page': page
          });
      List<dynamic> jsonMoviesList = response.data['results'];

      for (var item in jsonMoviesList) {
        moviesList.add(MovieItemModel.fromSimpleJson(item));
      }
    } on DioException catch (e) {
      if (e.response != null &&
          e.response!.statusCode! >= 400 &&
          e.response!.statusCode! < 500) {
        throw (e.response!.data['status_message']);
      }
      throw ('There is an error, please try again');
    }
    return moviesList;
  }

  Future<List<CastModel>> getCast(int movieId) async {
    List<CastModel> castList = [];

    try {
      final response =
          await dio.get('$kDomain/movie/$movieId/credits?', queryParameters: {
        'api_key': kKey,
        'language': kLanguage,
      });
      List<dynamic> jsonCastList = response.data['cast'];

      for (var item in jsonCastList) {
        castList.add(CastModel.fromJson(item));
      }
    } on DioException catch (e) {
      if (e.response != null &&
          e.response!.statusCode! >= 400 &&
          e.response!.statusCode! < 500) {
        throw (e.response!.data['status_message']);
      }
      throw ('There is an error, please try again');
    }
    return castList;
  }

  Future<List<ReviewModel>> getReviews(int movieId, [page = 1]) async {
    List<ReviewModel> reviewsList = [];

    try {
      final response = await dio.get('$kDomain/movie/$movieId/reviews?',
          queryParameters: {
            'api_key': kKey,
            'language': kLanguage,
            'page': page
          });
      List<dynamic> reviewsListJson = response.data['results'];

      for (var review in reviewsListJson) {
        reviewsList.add(ReviewModel.fromJson(review));
      }
    } on DioException catch (e) {
      if (e.response != null &&
          e.response!.statusCode! >= 400 &&
          e.response!.statusCode! < 500) {
        throw (e.response!.data['status_message']);
      }
      throw ('There is an error, please try again');
    }
    return reviewsList;
  }
}
