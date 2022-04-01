// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.authorContent,
    this.avatar,
    this.createdAt,
    this.updatedAt,
    required this.email,
    required this.id,
    this.emailVerifiedAt,
    required this.isEmailVerified,
    required this.name,
    this.phone,
    required this.username,
    this.walletAddress,
  });

  String? authorContent;
  String? avatar;
  DateTime? createdAt;
  DateTime? updatedAt;
  String email;
  int id;
  DateTime? emailVerifiedAt;
  bool isEmailVerified;
  String name;
  String? phone;
  String username;
  String? walletAddress;

  factory User.fromJson(Map<String, dynamic> json) => User(
    authorContent: json["author_content"],
    avatar: json["avatar"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    email: json["email"] as String? ?? "",
    id: json["id"] as int? ?? 0,
    emailVerifiedAt: json["emailVerifiedAt"] == null ? null : DateTime.parse(json["emailVerifiedAt"]),
    isEmailVerified: json["isEmailVerified"] as bool? ?? false,
    name: json["name"] as String? ?? "",
    phone: json["phone"],
    username: json["username"] as String? ?? "",
    walletAddress: json["walletAddress"],
  );

  Map<String, dynamic> toJson() => {
    "author_content": authorContent,
    "avatar": avatar,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "email": email,
    "id": id,
    "emailVerifiedAt": emailVerifiedAt,
    "isEmailVerified": isEmailVerified,
    "name": name,
    "phone": phone,
    "username": username,
    "walletAddress": walletAddress,
  };
}
