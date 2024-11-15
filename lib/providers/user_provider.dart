import 'package:flutter/widgets.dart';
import 'package:top_20_movies/models/user_model.dart';
import 'package:top_20_movies/utils/preferences_repository.dart';

class UserProvider extends ChangeNotifier {
  String? _sessionID;
  UserModel? _userModel;
  bool isloading = false;

  Future<void> checkSession() async {
    isloading = true;
    if (_sessionID == null) {
      _sessionID = await PreferencesRepository.getSessionId();
      isloading = false;
      notifyListeners();
    }
    isloading = false;
  }

  void setSessionID(String id) {
    _sessionID = id;
    PreferencesRepository.saveSessionId(id);
    notifyListeners();
  }

  String? getSessionID() {
    return _sessionID;
  }

  void setUserModel(UserModel? userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  UserModel? getUserModel() {
    return _userModel;
  }

  logout() {
    _sessionID = null;
    _userModel = null;
    PreferencesRepository.removeSession();
    notifyListeners();
  }
}
