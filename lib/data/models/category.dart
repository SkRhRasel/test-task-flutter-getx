// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.title,
    required this.status,
    required this.image,
    required this.id,
    this.createdAt,
    this.updatedAt,
  });

  String title;
  String status;
  String image;
  int id;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    title: json["title"] as String? ?? "",
    status: json["status"] as String? ?? "",
    image: json["image"] as String? ?? "",
    id: json["id"] as int? ?? 0,
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "status": status,
    "image": image,
    "id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
