import 'package:top_20_movies/utils/constant.dart';

class ReviewModel {
  final String author;
  final String? image;
  final double? rating;
  final String content;
  final String createdAt;
  final String updatedAt;

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    String createdAt = json['created_at'];
    createdAt = createdAt.substring(0, 10);
    String updatedAt = json['updated_at'];
    updatedAt = updatedAt.substring(0, 10);

    return ReviewModel(
        author: json['author'],
        image: json['author_details']['avatar_path'] != null
            ? kBaseURL + kProfileSize + json['author_details']['avatar_path']
            : json['author_details']['avatar_path'],
        rating: json['author_details']['rating'],
        content: json['content'],
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const ReviewModel(
      {required this.author,
      required this.image,
      required this.rating,
      required this.content,
      required this.createdAt,
      required this.updatedAt});
}
