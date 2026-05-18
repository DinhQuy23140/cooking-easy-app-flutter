import 'package:cooking_easy/features/main/data/dto/CategoryDto.dart';
import 'package:cooking_easy/features/main/data/dto/RecipeDto.dart';
import 'package:cooking_easy/features/main/data/remote/api/ApiService.dart';
import 'package:cooking_easy/features/main/domain/mapper/recipeMapper.dart';
import 'package:cooking_easy/features/main/domain/model/category.dart';
import 'package:cooking_easy/features/main/domain/model/recipe.dart';
import '../../domain/mapper/areaMapper.dart';
import '../../domain/mapper/categoryMapper.dart';
import '../../domain/model/area.dart';
import '../dto/AreaResponseDto.dart';

class Reciperepository {
  final ApiService apiService;

  Reciperepository(this.apiService);

  Future<List<Area>?> getAreas() async {
    final response = await apiService.getAreas();
    final raw = response.data;
    if (raw is! Map) {
      throw FormatException(
        'Areas API expected a JSON object, got ${raw.runtimeType}',
      );
    }
    final map = Map<String, dynamic>.from(raw);
    final areasDto = AreaResponseDto.fromJson(map).meals;
    return Areamapper.toListArea(areasDto);
  }

  Future<List<Category>> getCategories() async {
    final response = await apiService.getCategories();
    final raw = response.data;
    if (raw is! Map) {
      throw FormatException(
        'Categories API expected a JSON object, got ${raw.runtimeType}',
      );
    }
    final map = Map<String, dynamic>.from(raw);
    final categoriesDto = CategoryResponseDto.fromJson(map).categories;
    return Categorymapper.toListCategory(categoriesDto);
  }

  Future<List<Recipe>> getRecipes() async {
    final recipes = <Recipe>[];

    for (int i = 'a'.codeUnitAt(0); i <= 'a'.codeUnitAt(0); i++) {
      final letter = String.fromCharCode(i);

      final result = await getRecipesByLetter(letter);

      recipes.addAll(result);
    }

    return recipes;
  }

  Future<List<Recipe>> getRecipesByLetter(String letter) async {
    final response = await apiService.getRecipeByFirstLetter(letter);

    final raw = response.data;
    if (raw is! Map) {
      return [];
    }
    final map = Map<String, dynamic>.from(raw);

    final recipesDto = RecipeResponseDto.fromJson(map).meals;

    if (recipesDto == null) {
      return [];
    }

    return RecipeMapper.toRecipeList(recipesDto);
  }

  Future<Recipe> getRandomRecipe() async {
    final response = await apiService.getRandomRecipe();
    final rawData = response.data;
    if(rawData is! Map) {
      return Recipe();
    }
    final map = Map<String, dynamic>.from(rawData);
    final recipeDto = RecipeResponseDto.fromJson(map).meals;
    if(recipeDto == null) {
      return Recipe();
    }
    return RecipeMapper.toRecipe(recipeDto[0]);
  }
}
