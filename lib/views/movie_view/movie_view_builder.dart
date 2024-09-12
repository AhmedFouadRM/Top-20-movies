import 'package:flutter/material.dart';
import 'package:top_20_movies/models/cast_model.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/models/review_model.dart';
import 'package:top_20_movies/services/movies_servies.dart';

import 'movie_view.dart';

class MovieViewBuilder extends StatefulWidget {
  const MovieViewBuilder({super.key, required this.movieId});
  static const String id = '/movie_view_builder';
  final int movieId;
  @override
  State<MovieViewBuilder> createState() => _MovieViewBuilderState();
}

class _MovieViewBuilderState extends State<MovieViewBuilder> {
  late Future<MovieItemModel> futureMovie;
  late Future<List<CastModel>> futureCast;
  late Future<List<ReviewModel>> futureReviews;
  @override
  void initState() {
    super.initState();
    futureCast = MoviesServices().getCast(widget.movieId);
    futureMovie = MoviesServices().getMovie(widget.movieId);
    futureReviews = MoviesServices().getReviews(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([futureMovie, futureCast, futureReviews]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MovieView(
              movie: snapshot.data![0] as MovieItemModel,
              cast: snapshot.data![1] as List<CastModel>,
              reviews: snapshot.data![2] as List<ReviewModel>,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
