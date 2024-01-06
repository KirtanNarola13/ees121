import 'dart:convert';

CategoryApi categoryApiFromJson(String str) =>
    CategoryApi.fromJson(json.decode(str));

String categoryApiToJson(CategoryApi data) => json.encode(data.toJson());

class CategoryApi {
  final List<Datum> data;

  CategoryApi({
    required this.data,
  }) {
    // Sort the data list by name in a case-insensitive manner
    data.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
  }

  factory CategoryApi.fromJson(Map<String, dynamic> json) => CategoryApi(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String name;
  final String img;

  Datum({
    required this.name,
    required this.img,
  });

  factory Datum.fromJson(Map<String, dynamic> json) =>
      Datum(name: json["name"], img: json["logofile"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "logofile": img,
      };
}
