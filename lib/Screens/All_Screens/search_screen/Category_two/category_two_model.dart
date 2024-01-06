// To parse this JSON data, do
//
//     final categoryApi = categoryApiFromJson(jsonString);

import 'dart:convert';

CategoryTwoApi categoryTwoApiFromJson(String str) =>
    CategoryTwoApi.fromJson(json.decode(str));

String categoryTwoApiToJson(CategoryTwoApi data) => json.encode(data.toJson());

class CategoryTwoApi {
  final List<CategoryUser> data;

  CategoryTwoApi({
    required this.data,
  });

  factory CategoryTwoApi.fromJson(Map<String, dynamic> json) => CategoryTwoApi(
        data: List<CategoryUser>.from(
            json["data"].map((x) => CategoryUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryUser {
  final String fullname;
  final String selfifile;

  CategoryUser({
    required this.fullname,
    required this.selfifile,
  });

  factory CategoryUser.fromJson(Map<String, dynamic> json) => CategoryUser(
      fullname: (json["fullname"] == null) ? "" : json["fullname"],
      selfifile: (json["selfifile"] == null) ? "noimg.png" : json["selfifile"]);

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "selfifile": selfifile,
      };
}
