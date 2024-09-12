import 'package:top_20_movies/utils/constant.dart';

class CastModel {
  String name;
  String character;
  String? profilePath;
  CastModel(
      {required this.name, required this.character, required this.profilePath});
  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'],
      character: json['character'],
      profilePath: json['profile_path'] != null
          ? kBaseURL + kProfileSize + json['profile_path']
          : json['profile_path'],
    );
  }
}
