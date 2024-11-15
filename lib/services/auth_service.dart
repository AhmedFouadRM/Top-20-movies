import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:top_20_movies/models/user_model.dart';
import 'package:top_20_movies/utils/api.dart';
import 'package:top_20_movies/utils/constant.dart';
import 'package:top_20_movies/utils/preferences_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthService {
  AuthService.deepLink({required VoidCallback onFinish}) {
    try {
      initDeepLinkListener(onFinish);
    } catch (e) {
      throw (e.toString());
    }
  }
  AuthService();
  Future<String?> getRequestToken() async {
    final data =
        await Api().get('$kDomain/authentication/token/new?api_key=$kKey');
    return data['request_token'];
  }

  Future<String?> getSessionId(String requestToken) async {
    final data = await Api()
        .post('$kDomain/authentication/session/new?api_key=$kKey', body: {
      "request_token": requestToken,
    });
    return data['session_id'];
  }

  Future<void> logInWebPage() async {
    String? requestToken = await getRequestToken();
    if (requestToken != null) {
      final url =
          'https://www.themoviedb.org/authenticate/$requestToken?redirect_to=yourapp://auth';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  Future<void> logInUsernamePassword(String username, String password) async {
    String? requestToken = await getRequestToken();
    if (requestToken != null) {
      final url = '$kDomain/authentication/token/validate_with_login';
      Map<String, dynamic> data = await Api().post(url, body: {
        "username": username,
        "password": password,
        "request_token": requestToken
      });

      if (data['success'] == true) {
        createUserSession(data['request_token']);
      }
    }
  }

  Future<void> createGuestSession() async {
    Map<String, dynamic> data = await Api()
        .get('$kDomain/authentication/guest_session/new?api_key=$kKey');
    if (data['success'] == true) {
      PreferencesRepository.saveSessionId(data['guest_session_id']);
    }
  }

  Future<void> createUserSession(String requestToken) async {
    try {
      String? sessionId = await getSessionId(requestToken);
      if (sessionId != null) {
        await PreferencesRepository.saveSessionId(sessionId);
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode! == 401) {
        throw (e.response!.data['status_message']);
      }
    } catch (e) {
      throw ('There is an error, please try again');
    }
  }

  void initDeepLinkListener(VoidCallback callback) async {
    AppLinks appLinks = AppLinks();
    StreamSubscription? subscription;

    // Listen for deep link changes
    subscription = appLinks.uriLinkStream.listen((Uri? uri) async {
      if (uri != null) {
        // Handle the deep link (e.g., extract the request token or session id)
        try {
          final requestToken = uri.queryParameters['request_token'];
          if (requestToken != null) {
            await createUserSession(requestToken);
          }
          subscription?.cancel();
          callback();
        } catch (e) {
          throw (e.toString());
        }
      }
    });
  }

  Future<UserModel?> getUser() async {
    String? sessionId = await PreferencesRepository.getSessionId();
    try {
      String url = '$kDomain/account?api_key=$kKey&session_id=$sessionId';
      Map<String, dynamic> data = await Api().get(url);
      return UserModel.fromJson(data);
    } on DioException catch (e) {
      if (e.response != null &&
          e.response!.statusCode! == 401 &&
          e.response!.data['status_code'] == 3) {
        {
          return null;
        }
      }
    } catch (e) {
      throw Exception('there is a problem with status code ${e.toString()}');
    }
    return null;
  }
}
