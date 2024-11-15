class UserModel {
  int? id;
  String? name;
  String? username;
  String? hash;
  String? avatar;
  String? language;
  String? region;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.hash,
      this.avatar,
      this.language,
      this.region});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      hash: json['avatar']['gravatar']['hash'],
      avatar: json['avatar']['tmdb']['avatar_path'],
      language: json['iso_639_1'],
      region: json['iso_3166_1'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'avatar': {
          'gravatar': {'hash': hash},
          'tmdb': {'avatar_path': avatar}
        },
        'language': language,
        'region': region,
      };
}
