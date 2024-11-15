import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_20_movies/models/user_model.dart';

class PreferencesRepository {
  static String sessionKey = 'session_id';
  static saveSessionId(String sessionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sessionKey, sessionId);
  }

  static Future<String?> getSessionId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sessionKey);
  }

  static removeSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(sessionKey);
  }

  static saveUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user.toJson()));
  }

  static Future<UserModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user') != null
        ? UserModel.fromJson(jsonDecode(prefs.getString('user') ?? ""))
        : null;
  }

  static removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}
