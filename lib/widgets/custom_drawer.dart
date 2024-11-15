import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_20_movies/providers/user_provider.dart';
import 'package:top_20_movies/utils/constant.dart';
import 'package:top_20_movies/views/log_in_view/log_in_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required bool isLoggedIn,
  }) : _isLoggedIn = isLoggedIn;

  final bool _isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, provider, _) {
      return Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
                child: Row(children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: provider.getUserModel() == null
                    ? AssetImage('assets/images/empty_profile.png')
                        as ImageProvider
                    : CachedNetworkImageProvider(
                        provider.getUserModel()!.avatar == null
                            ? kGravatarURL + provider.getUserModel()!.hash!
                            : kBaseURL +
                                kProfileSize +
                                provider.getUserModel()!.avatar!,
                      ),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 20),
              Text(
                provider.getUserModel()?.name?.isNotEmpty == true
                    ? provider.getUserModel()!.name!
                    : provider.getUserModel()?.username ?? "Guest",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ])),
            _isLoggedIn
                ? ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () {
                      // Show profile details
                      Navigator.pop(context);
                    },
                  )
                : ListTile(
                    leading: Icon(Icons.login),
                    title: Text('Login'),
                    onTap: () {
                      Navigator.pushNamed(context, LogInView.id);
                    },
                  ),
            _isLoggedIn
                ? ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: () {
                      provider.logout();
                    },
                  )
                : SizedBox.shrink(),
          ],
        ),
      );
    });
  }
}
