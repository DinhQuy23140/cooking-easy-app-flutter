import 'package:cooking_easy/features/main/presentation/state/api_state.dart';
import 'package:flutter/cupertino.dart';

import '../data/repository/recipeRepository.dart';
import '../domain/model/area.dart';
import '../domain/model/category.dart';
import '../domain/model/recipe.dart';

class Homeviewmodel extends ChangeNotifier {
  final Reciperepository repository;

  Homeviewmodel(this.repository);

  final ValueNotifier<ApiState<List<Area>>> areasState = ValueNotifier(
    ApiLoading<List<Area>>(),
  );

  final ValueNotifier<ApiState<List<Category>>> categoriesState = ValueNotifier(
    ApiLoading<List<Category>>(),
  );

  final ValueNotifier<ApiState<List<Recipe>>> recipesState = ValueNotifier(
    ApiLoading<List<Recipe>>(),
  );

  Future<void> getAreas() async {
    try {
      areasState.value = ApiLoading<List<Area>>();

      final result = await repository.getAreas();

      areasState.value = ApiSuccess<List<Area>>(result);
    } catch (e) {
      areasState.value = ApiError<List<Area>>(e.toString());
    }
  }

  Future<void> getCategories() async {
    try {
      categoriesState.value = ApiLoading<List<Category>>();

      final result = await repository.getCategories();

      categoriesState.value = ApiSuccess<List<Category>>(result);
    } catch(e) {
      categoriesState.value = ApiError<List<Category>>(e.toString());
    }
  }
}
