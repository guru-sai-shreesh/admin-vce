import 'dart:ffi';

class User {
  final String? id;
  final String? user_name;
  final String? name;
  final String? password;
  final String? imagePath;
  final String? email;
  final Char? gender;
  final String? about;
  final String? github_url;
  final String? linkdin_url;
  final DateTime? dateOfBirth;

  User(
      {this.id,
      this.user_name,
      this.name,
      this.password,
      this.imagePath,
      this.email,
      this.gender,
      this.about,
      this.github_url,
      this.linkdin_url,
      this.dateOfBirth});

  User copy(
          String? id, String? name, DateTime? dateOfBirth, String? imagePath) =>
      User(
        id: id,
        name: name,
        dateOfBirth: dateOfBirth,
        imagePath: imagePath,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        dateOfBirth: DateTime.tryParse(json['dateOfBirth']),
        imagePath: json['imagePath'],
        // pets: List<String>.from(json['pets']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'imagePath': imagePath,
        // 'pets': pets,
      };

  @override
  String toString() => 'User{id: $id, name: $name}';
}
