// To parse this JSON data, do
//
//     final listResponse = listResponseFromJson(jsonString);

import 'dart:convert';

import 'imageList.dart';

ListResponse listResponseFromJson(String str) => ListResponse.fromJson(json.decode(str));

String listResponseToJson(ListResponse data) => json.encode(data.toJson());

class ListResponse {
  ListResponse({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  List<Product>? products;
  int? total;
  int? skip;
  int? limit;
  factory ListResponse.fromJson(Map<String, dynamic> json) => ListResponse(
    products: List<Product>.from(
        json["products"].map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };

}


class PageInfo {
  PageInfo({
    this.endCursor,
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
  });

  String? endCursor;
  bool hasNextPage;
  bool hasPreviousPage;
  String? startCursor;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    endCursor: json["endCursor"],
    hasNextPage: json["hasNextPage"] as bool? ?? false,
    hasPreviousPage: json["hasPreviousPage"] as bool? ?? false,
    startCursor: json["startCursor"],
  );

  Map<String, dynamic> toJson() => {
    "endCursor": endCursor,
    "hasNextPage": hasNextPage,
    "hasPreviousPage": hasPreviousPage,
    "startCursor": startCursor,
  };
}
// // To parse this JSON data, do
// //
// //     final listResponse = listResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// ListResponse listResponseFromJson(String str) => ListResponse.fromJson(json.decode(str));
//
// String listResponseToJson(ListResponse data) => json.encode(data.toJson());
//
// class ListResponse {
//   ListResponse({
//     required this.listItems,
//   });
//
//   ListItems listItems;
//
//   factory ListResponse.fromJson(Map<String, dynamic> json) => ListResponse(
//     //listItems: ListItems.fromJson(json["listItems"]),
//     listItems: ListItems.fromJson(json[checkJsonKey(json)]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "listItems": listItems.toJson(),
//   };
// }
//
// checkJsonKey(Map<String, dynamic> json){
//   if (json.containsKey("listItems")) {
//     return "listItems";
//   } else if(json.containsKey("getCategoryList")){
//     return "getCategoryList";
//   }
// }
//
// class ListItems {
//   ListItems({
//     required this.pageInfo,
//     required this.totalCount,
//     required this.edges,
//   });
//
//   PageInfo pageInfo;
//   int totalCount;
//   List<dynamic> edges;
//
//   factory ListItems.fromJson(Map<String, dynamic> json) => ListItems(
//     pageInfo: PageInfo.fromJson(json["pageInfo"]),
//     totalCount: json["totalCount"] as int? ?? 0,
//     edges: List<dynamic>.from(json["edges"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "pageInfo": pageInfo.toJson(),
//     "edges": List<dynamic>.from(edges.map((x) => x)),
//   };
// }
//
// class PageInfo {
//   PageInfo({
//     this.endCursor,
//     required this.hasNextPage,
//     required this.hasPreviousPage,
//     this.startCursor,
//   });
//
//   String? endCursor;
//   bool hasNextPage;
//   bool hasPreviousPage;
//   String? startCursor;
//
//   factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
//     endCursor: json["endCursor"],
//     hasNextPage: json["hasNextPage"] as bool? ?? false,
//     hasPreviousPage: json["hasPreviousPage"] as bool? ?? false,
//     startCursor: json["startCursor"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "endCursor": endCursor,
//     "hasNextPage": hasNextPage,
//     "hasPreviousPage": hasPreviousPage,
//     "startCursor": startCursor,
//   };
// }
