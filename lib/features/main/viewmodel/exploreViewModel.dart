import 'package:cooking_easy/features/main/data/repository/recipeRepository.dart';
import 'package:cooking_easy/features/main/domain/model/recipe.dart';
import 'package:flutter/cupertino.dart';

import '../domain/model/area.dart';
import '../domain/model/category.dart';
import '../presentation/state/api_state.dart';

class Exploreviewmodel {
  Reciperepository recipeRepository;

  Exploreviewmodel(this.recipeRepository);

  final ValueNotifier<ApiState<Recipe>> randomRecipeState = ValueNotifier(
    ApiLoading<Recipe>(),
  );
  final ValueNotifier<ApiState<List<Category>>> categoryState = ValueNotifier(
    ApiLoading<List<Category>>(),
  );
  final ValueNotifier<ApiState<List<Area>>> areaState = ValueNotifier(
    ApiLoading<List<Area>>(),
  );
  final ValueNotifier<ApiState<List<Recipe>>> recipeState = ValueNotifier(
    ApiLoading<List<Recipe>>(),
  );

  Future<void> getRandomRecipe() async {
    try {
      randomRecipeState.value = ApiLoading();
      final recipe = await recipeRepository.getRandomRecipe();
      randomRecipeState.value = ApiSuccess(recipe);
    } catch (e) {
      randomRecipeState.value = ApiError(e.toString());
    }
  }

  Future<void> getListCategory() async {
    try {
      categoryState.value = ApiLoading();
      final response = await recipeRepository.getCategories();
      categoryState.value = ApiSuccess(response);
    } catch (e) {
      categoryState.value = ApiError(e.toString());
    }
  }

  Future<void> getListArea() async {
    try {
      areaState.value = ApiLoading();
      final response = await recipeRepository.getAreas();
      areaState.value = ApiSuccess(response);
    } catch (e) {
      areaState.value = ApiError(e.toString());
    }
  }

  Future<void> getListRandomRecipe() async {
    recipeState.value = ApiLoading();

    try {
      final futures = List.generate(
        10,

        (_) => recipeRepository.getRandomRecipe(),
      );

      final recipes = await Future.wait(futures);

      recipeState.value = ApiSuccess(recipes);
    } catch (e) {
      recipeState.value = ApiError(e.toString());
    }
  }
}
