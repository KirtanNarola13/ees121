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
  final String category;
  final String company;
  final String userAverageRating;
  final String providerAverageRating;
  final String userid;

  CategoryUser({
    required this.fullname,
    required this.selfifile,
    required this.category,
    required this.company,
    required this.userAverageRating,
    required this.providerAverageRating,
    required this.userid,
  });

  factory CategoryUser.fromJson(Map<String, dynamic> json) => CategoryUser(
        fullname: (json["fullname"] == null) ? "" : json["fullname"],
        selfifile:
            (json["selfifile"] == null) ? "noimg.png" : json["selfifile"],
        category: (json["category"] == null) ? "" : json["category"],
        company: (json["organization_name"] == null)
            ? ""
            : json["organization_name"],
        userAverageRating:
            (json["user_avg_rating"] == null) ? 0 : json["user_avg_rating"],
        providerAverageRating: (json["provider_avg_rating"] == null)
            ? 0
            : json["provider_avg_rating"],
        userid: (json["userid"] == null) ? "" : json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "selfifile": selfifile,
        "category": category,
        "organization_name": company,
        "user_avg_rating": userAverageRating,
        "provider_avg_rating": providerAverageRating,
        "userid": userid,
      };
}
