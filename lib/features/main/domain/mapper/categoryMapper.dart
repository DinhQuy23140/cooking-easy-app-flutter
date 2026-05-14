
import 'package:cooking_easy/features/main/data/dto/CategoryDto.dart';

import '../model/category.dart';

class Categorymapper {
  static List<Category> toListCategory(List<Categorydto> categories) {
    return categories.map((e) => toCategory(e)).toList();
  }
  
  static Category toCategory(Categorydto categoryDto) {
    return Category(
      idCategory: categoryDto.idCategory,
      strCategory: categoryDto.strCategory,
      strCategoryThumb: categoryDto.strCategoryThumb,
      strCategoryDescription: categoryDto.strCategoryDescription,
    );
  }
}