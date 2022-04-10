// To parse this JSON data, do
//
//     final cryptoInfo = cryptoInfoFromJson(jsonString);

import 'dart:convert';

CryptoInfo cryptoInfoFromJson(String str) => CryptoInfo.fromJson(json.decode(str));

String cryptoInfoToJson(CryptoInfo data) => json.encode(data.toJson());

class CryptoInfo {
  CryptoInfo({
    this.bpi,
    this.disclaimer,
    this.time,
  });

  Map<String, double>? bpi;
  String? disclaimer;
  Time? time;

  factory CryptoInfo.fromJson(Map<String, dynamic> json) => CryptoInfo(
    bpi: Map.from(json["bpi"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    disclaimer: json["disclaimer"],
    time: Time.fromJson(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "bpi": Map.from(bpi!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "disclaimer": disclaimer,
    "time": time!.toJson(),
  };
}

class Time {
  Time({
    this.updated,
    this.updatedIso,
  });

  String? updated;
  DateTime? updatedIso;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    updated: json["updated"],
    updatedIso: DateTime.parse(json["updatedISO"]),
  );

  Map<String, dynamic> toJson() => {
    "updated": updated,
    "updatedISO": updatedIso!.toIso8601String(),
  };
}
