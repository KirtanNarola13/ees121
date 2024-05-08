class CategoryModel {
  int? id;
  String title;
  String img;

  CategoryModel({
    this.id,
    required this.title,
    required this.img,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'] ?? '', // Handle null values for title
      img: json['image'] ?? '', // Handle null values for img
    );
  }
}
