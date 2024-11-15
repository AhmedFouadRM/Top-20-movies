import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_20_movies/models/user_model.dart';
import 'package:top_20_movies/providers/user_provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:top_20_movies/services/auth_service.dart';
import 'package:top_20_movies/views/home_view/home_view.dart';

class HomeViewBuilder extends StatefulWidget {
  const HomeViewBuilder({super.key});

  @override
  State<HomeViewBuilder> createState() => _HomeViewBuilderState();
}

class _HomeViewBuilderState extends State<HomeViewBuilder> {
  @override
  void initState() {
    super.initState();
    _checkSession(Provider.of<UserProvider>(context, listen: false));
  }

  _checkSession(UserProvider userProvider) async {
    await userProvider.checkSession();
    String? sessionId = userProvider.getSessionID();
    UserModel? userModel = userProvider.getUserModel();
    if (sessionId != null) {
      if (userModel == null) {
        userModel = await AuthService().getUser();
        userProvider.setUserModel(userModel);
      }
      Navigator.pushReplacementNamed(context, HomeView.id);
    } else {
      // If session doesn't exist, navigate to LoginPage
      FlutterNativeSplash.remove();
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
