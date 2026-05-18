import 'package:cooking_easy/features/main/domain/model/area.dart';
import 'package:cooking_easy/features/main/domain/model/category.dart';
import 'package:cooking_easy/features/main/presentation/state/api_state.dart';
import 'package:cooking_easy/features/main/presentation/widget/category_card.dart';
import 'package:cooking_easy/features/main/presentation/widget/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/theme/android_drawable_theme.dart';
import '../../../../core/theme/screen_gradient.dart';
import '../../../../core/theme/shape_circle_glass.dart';
import '../../../../core/theme/shape_hero_header.dart';
import '../../data/remote/api/ApiService.dart';
import '../../data/repository/recipeRepository.dart';
import '../../domain/model/recipe.dart';
import '../../viewmodel/exploreViewModel.dart';
import '../widget/area_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExploreState();
  }
}

class _ExploreState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: ScreenGradient.gradient),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: ShapeHeroHeader.shapeHeroHeader,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 52, 20, 22),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "DISCOVER",
                                  style: TextStyle(
                                    color: Color(0x80FFFFFF),
                                    fontSize: 11,
                                    fontFamily: 'sans-serif',
                                    letterSpacing: 1,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  "Eplore Recipes",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 22,
                                    fontFamily: 'sans-serif',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFEAF3DE),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Color(0xFF000000),
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: ShapeCircleGlass.shapeCircleGlass,
                            child: const Icon(
                              Icons.notifications_active_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Color(0x1AFFFFFF),
                          border: Border.all(
                            color: Color(0x33FFFFFF),
                            width: 1,
                          ),
                        ),
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search recipes...",
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Icon(Icons.search, color: Colors.white),
                              const SizedBox(width: 15),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                        child: Row(
                          children: [
                            Container(
                              width: 3,
                              height: 16,
                              decoration: BoxDecoration(
                                gradient: ShapeHeroHeader.shapeHeroHeader,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: const Text(
                                "FEATURE TODAY",
                                style: TextStyle(
                                  color: Color(0xFF2E5E2E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'sans-serif',
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                vm.getRandomRecipe();
                              },
                              child: ValueListenableBuilder(
                                valueListenable: vm.randomRecipeState,
                                builder: (context, state, _) {
                                  return state is ApiLoading
                                      ? SpinKitFadingCircle(
                                          color: Colors.green,
                                          size: 20,
                                        )
                                      : const Icon(
                                          Icons.refresh,
                                          size: 28,
                                          color: Color(0xFF2E5E2E),
                                        );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //feature
                    SliverToBoxAdapter(
                      child: ValueListenableBuilder(
                        valueListenable: vm.randomRecipeState,
                        builder: (context, state, _) {
                          return switch (state) {
                            ApiLoading<Recipe>() => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 48),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            ApiSuccess<Recipe>(data: final recipe) =>
                              recipe != null
                                  ? createWidgetFeature(recipe)
                                  : Text("Not found recipe"),
                            ApiError<Recipe>(message: String msg) => Text(msg),
                          };
                        },
                      ),
                    ),
                    //category
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                        child: Row(
                          children: [
                            Container(
                              width: 3,
                              height: 16,
                              decoration: BoxDecoration(
                                gradient: ShapeHeroHeader.shapeHeroHeader,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: const Text(
                                "POPULAR CATEGORIES",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF2E5E2E),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'sans-serif',
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isShowCategory = !isShowCategory;
                                });
                              },
                              child: Text(
                                isShowCategory ? "Hide" : "See all",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF43A047),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'sans-serif',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ValueListenableBuilder(
                        valueListenable: vm.categoryState,
                        builder: (context, state, _) {
                          return switch (state) {
                            ApiLoading<List<Category>>() => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            ApiSuccess<List<Category>>(
                              data: final categories,
                            ) =>
                              categories != null && categories.isNotEmpty
                                  ? createListCategory(categories)
                                  : const Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Center(
                                        child: Text('Not found category'),
                                      ),
                                    ),
                            ApiError<List<Category>>(message: String msg) =>
                              Text(msg),
                          };
                        },
                      ),
                    ),
                    //   area
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
                        child: Row(
                          children: [
                            Container(
                              width: 3,
                              height: 16,
                              decoration: BoxDecoration(
                                gradient: ShapeHeroHeader.shapeHeroHeader,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: const Text(
                                "EXPLORE BY AREA",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF2E5E2E),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'sans-serif',
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isShowArea = !isShowArea;
                                });
                              },
                              child: Text(
                                isShowArea ? "Hide" : "See all",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF43A047),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'sans-serif',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ValueListenableBuilder(
                        valueListenable: vm.areaState,
                        builder: (context, state, _) {
                          return switch (state) {
                            ApiLoading<List<Area>>() =>
                              const CircularProgressIndicator(),
                            ApiSuccess<List<Area>>(data: final areas) =>
                              areas != null && areas.isNotEmpty
                                  ? createListArea(areas)
                                  : Text("Area not found"),
                            ApiError<List<Area>>() => Center(
                              child: Text(state.message),
                            ),
                          };
                        },
                      ),
                    ),
                    //   trending
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 6, 20, 0),
                        child: Row(
                          children: [
                            Container(
                              width: 3,
                              height: 16,
                              decoration: BoxDecoration(
                                gradient: ShapeHeroHeader.shapeHeroHeader,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: const Text(
                                "TRENDING",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF2E5E2E),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'sans-serif',
                                ),
                              ),
                            ),
                            Container(
                              decoration:
                                  AndroidDrawableTheme.shapeCaloriesBadge,
                              padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                              child: ValueListenableBuilder(
                                valueListenable: vm.recipeState,
                                builder: (context, state, _) {
                                  return switch (state) {
                                    ApiLoading<List<Recipe>>() =>
                                      const CircularProgressIndicator(),
                                    ApiSuccess<List<Recipe>>(
                                      data: final recipes,
                                    ) =>
                                      recipes != null && recipes.isNotEmpty
                                          ? Text(
                                              "${recipes.length} picks",
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: Color(0xFF43A047),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'sans-serif',
                                              ),
                                            )
                                          : Text("Recipe not found"),
                                    ApiError<List<Recipe>>(
                                      message: final message,
                                    ) =>
                                      Text(message),
                                  };
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
                    SliverToBoxAdapter(
                      child: ValueListenableBuilder(
                        valueListenable: vm.recipeState,
                        builder: (context, state, _) {
                          return switch (state) {
                            ApiLoading<List<Recipe>>() =>
                              const CircularProgressIndicator(),
                            // TODO: Handle this case.
                            ApiSuccess<List<Recipe>>(data: final recipes) =>
                              recipes != null && recipes.isNotEmpty
                                  ? createListRandomRecipe(recipes)
                                  : Text("Recipe not found"),
                            ApiError<List<Recipe>>(message: final message) =>
                              Text(message),
                          };
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createWidgetFeature(Recipe recipe) {
    return Container(
      width: double.infinity,
      height: 220,
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: AndroidDrawableTheme.gradientFeaturedOverlay,
      ),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                recipe.strMealThumb,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: progress.expectedTotalBytes != null
                          ? progress.cumulativeBytesLoaded /
                                progress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.strMeal,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      shadows: [Shadow(color: Color(0x99000000))],
                      fontWeight: FontWeight.w600,
                      fontFamily: 'sans-serif',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                        margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                        decoration: AndroidDrawableTheme.shapeCaloriesBadge
                            .copyWith(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0x3000C897),
                                width: 2,
                              ),
                            ),
                        child: Text(
                          recipe.strCategory,
                          style: TextStyle(
                            color: Color(0xFF43A047),
                            fontSize: 11,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                        decoration: AndroidDrawableTheme.shapeTagWhite.copyWith(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0x3000C897),
                            width: 2,
                          )
                        ),
                        child: Text(
                          recipe.strArea,
                          style: TextStyle(
                            color: Color(0xFF2E5E2E),
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Cook Now",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF2E5E2E),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Color(0xFF2E5E2E),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createListCategory(List<Category> categories) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryCard(category: category, onTap: () {});
        },
      ),
    );
  }

  Widget createListArea(List<Area> listArea) {
    return SingleChildScrollView(
      scrollDirection: isShowArea ? Axis.vertical : Axis.horizontal,
      padding: const EdgeInsets.all(8),
      child: isShowArea
          ? Wrap(
              spacing: 12,
              runSpacing: 12,
              children: listArea
                  .map((area) => AreaCard(area: area, onTap: () {}))
                  .toList(),
            )
          : Row(
              children: listArea
                  .map(
                    (area) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: AreaCard(area: area, onTap: () {}),
                    ),
                  )
                  .toList(),
            ),
    );
  }

  Widget createListRandomRecipe(List<Recipe> recipes) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        itemCount: recipes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeCard(recipe: recipe, onTap: () {});
        },
      ),
    );
  }

  final vm = Exploreviewmodel(Reciperepository(ApiService()));
  bool isLoadingRefresh = false;
  bool isShowCategory = false;
  bool isShowArea = false;
  bool isShowRecipe = false;

  @override
  void initState() {
    super.initState();
    vm.getRandomRecipe();
    vm.getListCategory();
    vm.getListArea();
    vm.getListRandomRecipe();
  }
}
