


class CategoryModel {
  String? title;
  String? image;

  CategoryModel({
    this.title,
    this.image,
  });

  // Extract a Category object from a Map object
  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    title = map['title'];
    image = map['image'];
  }

  // Convert a Category object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
    };
  }
}
