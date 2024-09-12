class SpokenLanguagesModel {
  final String name;
  final String iso6391;
  final String englishName;
  const SpokenLanguagesModel(
      {required this.name, required this.iso6391, required this.englishName});
  factory SpokenLanguagesModel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguagesModel(
        name: json['name'],
        iso6391: json['iso_639_1'],
        englishName: json['english_name']);
  }
}
