import 'package:dio/dio.dart';

class Api {
  Future<dynamic> get(String url) async {
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 401) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(String url,
      {Map<String, dynamic>? body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response =
        await Dio().post(url, data: body, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> put(String url,
      {Map<String, dynamic>? body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response =
        await Dio().put(url, data: body, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }
}
