import 'dart:convert';

WorkApi WorkApiFromJson(String str) => WorkApi.fromJson(json.decode(str));

String WorkApiToJson(WorkApi data) => json.encode(data.toJson());

class WorkApi {
  final List<Datum> data;

  WorkApi({
    required this.data,
  }) {
    // Sort the data list by name in a case-insensitive manner
    data.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
  }

  factory WorkApi.fromJson(Map<String, dynamic> json) => WorkApi(
        data:
            List<Datum>.from(json["workrecive"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "workrecive": List<dynamic>.from(data.map((x) => x.toJson())),
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
