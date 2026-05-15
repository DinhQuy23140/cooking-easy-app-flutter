import 'package:cooking_easy/features/main/domain/model/user.dart';
import 'package:cooking_easy/features/main/domain/repository/userRepository.dart';
import 'package:cooking_easy/features/main/presentation/state/api_state.dart';
import 'package:flutter/cupertino.dart';

import '../data/repository/recipeRepository.dart';
import '../domain/model/area.dart';
import '../domain/model/category.dart';
import '../domain/model/recipe.dart';

class Homeviewmodel extends ChangeNotifier {
  final Reciperepository repository;
  final UserRepository userRepository;

  Homeviewmodel(this.repository, this.userRepository);

  final ValueNotifier<ApiState<List<Area>>> areasState = ValueNotifier(
    ApiLoading<List<Area>>(),
  );

  final ValueNotifier<ApiState<List<Category>>> categoriesState = ValueNotifier(
    ApiLoading<List<Category>>(),
  );

  final ValueNotifier<ApiState<List<Recipe>>> recipesState = ValueNotifier(
    ApiLoading<List<Recipe>>(),
  );

  final ValueNotifier<ApiState<User>> userProfileState = ValueNotifier(
    ApiLoading<User>(),
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
    } catch (e) {
      categoriesState.value = ApiError<List<Category>>(e.toString());
    }
  }

  Future<void> getRecipes() async {
    try {
      recipesState.value = ApiLoading();
      final result = await repository.getRecipes();
      recipesState.value = ApiSuccess(result);
    } catch (e) {
      recipesState.value = ApiError(e.toString());
    }
  }

  Future<void> getUserProfile() async {
    try {
      userProfileState.value = ApiLoading<User>();
      final uid = await userRepository.getCurrentUserUUID();
      final result = await userRepository.getUserProfile(uid: uid);
      userProfileState.value = ApiSuccess<User>(result);
    } on StateError catch (e) {
      userProfileState.value = ApiError<User>(e.message);
    } catch (e) {
      userProfileState.value = ApiError<User>(_userProfileErrorMessage(e));
    }
  }

  String _userProfileErrorMessage(Object e) {
    final text = e.toString();
    if (text.contains('permission-denied')) {
      return 'Cannot load profile (permission denied)';
    }
    if (text.contains('network') || text.contains('unavailable')) {
      return 'Cannot load profile (network error)';
    }
    return 'Cannot load profile';
  }
}
