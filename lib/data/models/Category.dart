
class Category {
  String strCategory;
  int idCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  Category({
    required this.strCategory,
    required this.idCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      strCategory: json['strCategory'] ?? '',
      idCategory: int.tryParse(json['idCategory'].toString()) ?? 0,
      strCategoryThumb: json['strCategoryThumb'] ?? '',
      strCategoryDescription: json['strCategoryDescription'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strCategory': strCategory,
      'idCategory': idCategory,
      'strCategoryThumb': strCategoryThumb,
      'strCategoryDescription': strCategoryDescription,
    };
  }

}
