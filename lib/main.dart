import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:provider/provider.dart';
import 'package:top_20_movies/providers/movies_provider.dart';
import 'package:top_20_movies/services/movies_servies.dart';
import 'package:top_20_movies/views/category_view.dart';
import 'package:top_20_movies/views/home_view/home_view.dart';
import 'package:top_20_movies/views/home_view/home_view_builder.dart';
import 'package:top_20_movies/providers/user_provider.dart';
import 'package:top_20_movies/views/log_in_view/log_in_view.dart';
import 'package:top_20_movies/views/movie_view/movie_view_builder.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    const MoviesApp(),
  );
}

class MoviesApp extends StatefulWidget {
  const MoviesApp({
    super.key,
  });

  @override
  State<MoviesApp> createState() => _MoviesAppState();
}

class _MoviesAppState extends State<MoviesApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => MoviesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: FlexThemeData.light(
          scheme: FlexScheme.cyanM3,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 7,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          // To use the Playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.cyanM3,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 13,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        routes: {
          '/': (context) => HomeViewBuilder(),
          LogInView.id: (context) => LogInView(),
          HomeView.id: (context) => HomeView(),
          CategoryView.id: (context) => CategoryView(
                endpoint:
                    ModalRoute.of(context)!.settings.arguments as Endpoints,
              ),
          MovieViewBuilder.id: (context) => MovieViewBuilder(
              movieId: ModalRoute.of(context)!.settings.arguments as int),
        },
      ),
    );
  }
}
