import 'package:top_20_movies/utils/constant.dart';

class ProductionCompanyModel {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;
  const ProductionCompanyModel(
      {required this.id,
      required this.name,
      required this.logoPath,
      required this.originCountry});
  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'],
      name: json['name'],
      logoPath: json['logo_path'] != null
          ? kBaseURL + kLogoSize + json['logo_path']
          : json['logo_path'],
      originCountry: json['origin_country'],
    );
  }
}
