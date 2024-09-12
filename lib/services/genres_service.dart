import 'package:dio/dio.dart';
import 'package:top_20_movies/utils/constant.dart';

class GenresService {
  static Map<int, String> genresMap = {};
  Future<bool> getGenres() async {
    try {
      Response response = await Dio().get('$kDomain/genre/movie/list',
          queryParameters: {'api_key': kKey, 'language': kLanguage});
      List<dynamic> jsonList = response.data['genres'];
      for (var item in jsonList) {
        genresMap[item['id']] = item['name'];
      }
    } on DioException catch (e) {
      if (e.response != null &&
          e.response!.statusCode! >= 400 &&
          e.response!.statusCode! < 500) {
        throw (e.response!.data['status_message']);
      }
      throw ('There is an error, please try again');
    }
    return true;
  }
}
