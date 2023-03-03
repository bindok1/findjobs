class CategoryModel {
  String? id;
  String? name;
  String? imageUrl;
  int? createdAt;
  int? updatedAt;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.createdAt,
      required this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
