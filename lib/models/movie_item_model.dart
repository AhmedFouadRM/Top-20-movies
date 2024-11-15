import 'package:top_20_movies/models/spoken_languages_model.dart';
import 'package:top_20_movies/utils/constant.dart';

class MovieItemModel {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final String? originalLanguage;
  final double voteAverage;
  final int? voteCount;
  final String genres;
  final String? tagline;
  final String? homepage;
  final double? popularity;
  final String? status;
  final List<String>? productionCompanies;
  final List<SpokenLanguagesModel>? spokenLanguages;
  final int? runtime;
  final int? budget;
  final int? revenue;

  const MovieItemModel(
      {required this.id,
      required this.title,
      required this.overview,
      this.posterPath,
      this.backdropPath,
      this.releaseDate,
      this.originalLanguage,
      required this.voteAverage,
      this.voteCount,
      required this.genres,
      this.tagline,
      this.homepage,
      this.popularity,
      this.status,
      this.productionCompanies,
      this.spokenLanguages,
      this.runtime,
      this.budget,
      this.revenue});
  factory MovieItemModel.fromSimpleJson(Map<String, dynamic> json) {
    List<dynamic> genreIds = json['genre_ids'];
    List<int> genres = genreIds.cast<int>();
    return MovieItemModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] != null
          ? kBaseURL + kPosterSize + json['poster_path']
          : null,
      backdropPath: json['backdrop_path'] != null
          ? kBaseURL + kBackdropSize + json['backdrop_path']
          : json['backdrop_path'],
      releaseDate: json['release_date'],
      originalLanguage: json['original_language'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      genres: genres.join(', '),
      popularity: json['popularity'],
      status: json['status'],
    );
  }
  factory MovieItemModel.fromDetailedJson(Map<String, dynamic> json) {
    List<dynamic> genresJson = json['genres'];
    List<String> genres =
        genresJson.map((genre) => genre['name']).toList().cast<String>();

    List<dynamic> productionCompaniesJson = json['production_companies'];

    List<String> productionCompanies = [];
    for (var companieJson in productionCompaniesJson) {
      if (companieJson['logo_path'] != null) {
        productionCompanies
            .add(kBaseURL + kLogoSize + companieJson['logo_path']);
      }
    }

    List<dynamic> spokenLanguagesJson = json['spoken_languages'];
    List<SpokenLanguagesModel> spokenLanguages = spokenLanguagesJson
        .map((e) => SpokenLanguagesModel.fromJson(e))
        .toList();
    return MovieItemModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] != null
          ? kBaseURL + kPosterSize + json['poster_path']
          : null,
      backdropPath: json['backdrop_path'] != null
          ? kBaseURL + kBackdropSize + json['backdrop_path']
          : json['backdrop_path'],
      releaseDate: json['release_date'],
      originalLanguage: json['original_language'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      genres: genres.join(', '),
      tagline: json['tagline'],
      homepage: json['homepage'],
      popularity: json['popularity'],
      status: json['status'],
      productionCompanies: productionCompanies,
      spokenLanguages: spokenLanguages,
      runtime: json['runtime'],
      budget: json['budget'],
      revenue: json['revenue'],
    );
  }
}
