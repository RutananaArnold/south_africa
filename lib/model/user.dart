// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class User {
  User({
    required this.token,
    required this.userId,
    required this.username,
    required this.userImage,
  });

  String token;
  String userId;
  String username;
  String userImage;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"],
        userId: json["user_id"],
        username: json["username"],
        userImage: json["user_image"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_id": userId,
        "username": username,
        "user_image": userImage,
      };
}
