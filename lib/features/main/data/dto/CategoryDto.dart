class CategoryResponseDto {
  List<Categorydto> categories;

  CategoryResponseDto({required this.categories});

  factory CategoryResponseDto.fromJson(Map<String, dynamic> json) {
    final raw = json['categories'];
    final list = raw is List ? raw : const <dynamic>[];
    return CategoryResponseDto(
      categories: list
          .map(
            (dynamic e) => Categorydto.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList(),
    );
  }

}

class Categorydto {
  String idCategory;
  String strCategory;
  String strCategoryDescription;
  String strCategoryThumb;

  Categorydto(
      {required this.idCategory, required this.strCategory, required this.strCategoryDescription,
        required this.strCategoryThumb});

  factory Categorydto.fromJson(Map<String, dynamic> json) {
    return Categorydto(idCategory: json['idCategory'],
        strCategory: json['strCategory'],
        strCategoryDescription: json['strCategoryDescription'],
        strCategoryThumb: json['strCategoryThumb']);
  }
}