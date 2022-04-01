
import 'dart:convert';

/// *** Common Server Response *** ///

ServerResponse responseFromJson(String str) => ServerResponse.fromJson(json.decode(str));

String responseToJson(ServerResponse data) => json.encode(data.toJson());

class ServerResponse {
  ServerResponse({
    required this.success,
    required this.message,
    this.data,
  });

  bool success;
  String message;
  dynamic data;

  factory ServerResponse.fromJson(Map<String, dynamic> json) => ServerResponse(
    success: json["success"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,
  };
}








