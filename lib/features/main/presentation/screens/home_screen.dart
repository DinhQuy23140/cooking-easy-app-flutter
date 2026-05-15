import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_easy/core/theme/screen_gradient.dart';
import 'package:cooking_easy/features/main/data/remote/api/ApiService.dart';
import 'package:cooking_easy/features/main/data/remote/firebase/fireStore/fireStoreUser.dart';
import 'package:cooking_easy/features/main/data/repository/userRepositoryImp.dart';
import 'package:cooking_easy/features/main/domain/model/area.dart';
import 'package:cooking_easy/features/main/domain/model/category.dart';
import 'package:cooking_easy/features/main/domain/model/recipe.dart';
import 'package:cooking_easy/features/main/domain/model/user.dart';
import 'package:cooking_easy/features/main/presentation/state/api_state.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import '../../data/repository/recipeRepository.dart';
import '../../viewmodel/homeViewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fills any gap if a descendant still shrink-wraps; matches gradient end tone.
      backgroundColor: const Color(0xFFA2CB8B),
      body: SafeArea(
        bottom: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(gradient: ScreenGradient.gradient),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,

                        colors: [
                          Color(0xFF4CAF50),
                          Color(0xFF66BB6A),
                          Color(0xFF81C784),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: vm.userProfileState,
                            builder: (context, state, _) {
                              return switch (state) {
                                ApiLoading<User>() =>
                                  buildProfile('...', ''),
                                ApiSuccess<User>(data: final data) =>
                                  buildProfile(
                                    _displayName(data),
                                    data?.avatarUrl ?? '',
                                  ),
                                ApiError<User>(message: final msg) =>
                                  buildProfile(_profileErrorLabel(msg), ''),
                              };
                            },
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "What would you like\nto cook today?",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color(0xCCFFFFFF),
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'sans-serif',
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0x1AFFFFFF),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              border: Border.all(
                                color: Color(0x33FFFFFF),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: const Row(
                                children: [
                                  Icon(Icons.search_sharp, color: Colors.white),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "Search recipes...",
                                    style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'sans-serif',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    ValueListenableBuilder(
                                      valueListenable: vm.recipesState,
                                      builder: (context, state, _) {
                                        return switch (state) {
                                          ApiLoading<List<Recipe>>() =>
                                            const Text(
                                              "....",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'sans-serif',
                                              ),
                                            ),
                                          ApiSuccess<List<Recipe>>(
                                            data: final data,
                                          ) =>
                                            Text(
                                              "${data?.length ?? 0}+",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'sans-serif',
                                              ),
                                            ),
                                          ApiError<List<Recipe>>() =>
                                            const Text(
                                              "0+",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'sans-serif',
                                              ),
                                            ),
                                        };
                                      },
                                    ),
                                    const Text(
                                      "Recipe",
                                      style: TextStyle(
                                        color: Color(0x80FFFFFF),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'sans-serif',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    ValueListenableBuilder(
                                      valueListenable: vm.categoriesState,
                                      builder: (context, state, _) {
                                        return switch (state) {
                                          ApiLoading<List<Category>>() =>
                                            const Text(
                                              "....",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'sans-serif',
                                              ),
                                            ),
                                          ApiSuccess<List<Category>>(
                                            data: final data,
                                          ) =>
                                            Text(
                                              "${data?.length ?? 0}+",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'sans-serif',
                                              ),
                                            ),
                                          ApiError<List<Category>>() =>
                                            const Text(
                                              "0",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'sans-serif',
                                              ),
                                            ),
                                        };
                                      },
                                    ),
                                    const Text(
                                      "Categories",
                                      style: TextStyle(
                                        color: Color(0x80FFFFFF),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'sans-serif',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    ValueListenableBuilder(
                                      valueListenable: vm.areasState,
                                      builder: (context, state, _) {
                                        return switch (state) {
                                          ApiLoading<List<Area>>() =>
                                            const Text(
                                              "....",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'sans-serif',
                                              ),
                                            ),
                                          ApiSuccess<List<Area>>(
                                            data: final areas,
                                          ) =>
                                            Text(
                                              "${areas?.length}+",

                                              style: const TextStyle(
                                                color: Colors.white,

                                                fontSize: 18,

                                                fontWeight: FontWeight.w600,

                                                fontFamily: 'sans-serif',
                                              ),
                                            ),
                                          ApiError<List<Area>>() => const Text(
                                            "0",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'sans-serif',
                                            ),
                                          ),
                                        };
                                      },
                                    ),
                                    const Text(
                                      "Cuisines",
                                      style: TextStyle(
                                        color: Color(0x80FFFFFF),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'sans-serif',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          height: 16,
                          decoration: BoxDecoration(color: Color(0xFF4CAF50)),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "CATEGORIES",
                          style: TextStyle(
                            color: Color(0xFF2E5E2E),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'sans-serif',
                            letterSpacing: 1,
                          ),
                        ),
                        Expanded(child: Text("")),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isOpenCategory = !isOpenCategory;
                            });
                          },
                          child: Text(
                            !isOpenCategory ? "See all" : "Hide",
                            style: const TextStyle(
                              color: Color(0xFF43A047),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'sans-serif',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: vm.categoriesState,
                    builder: (context, state, _) {
                      return switch (state) {
                        ApiLoading<List<Category>>() => const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                        ApiSuccess<List<Category>>(data: final categories) =>
                          Builder(
                            builder: (context) {
                              final list = categories ?? <Category>[];
                              if (list.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Center(child: Text('No categories')),
                                );
                              }
                              return !isOpenCategory
                                  ? buildListCategories(list.sublist(0, 8))
                                  : buildListCategories(list);
                            },
                          ),
                        ApiError<List<Category>>(message: final msg) => Center(
                          child: Text(msg),
                        ),
                      };
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          height: 16,
                          decoration: BoxDecoration(color: Color(0xFF4CAF50)),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "CUISINE",
                          style: TextStyle(
                            color: Color(0xFF2E5E2E),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'sans-serif',
                            letterSpacing: 1,
                          ),
                        ),
                        Expanded(child: Text("")),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isOpenCuisine = !isOpenCuisine;
                            });
                          },
                          child: Text(
                            !isOpenCuisine ? "See all" : "Hide",
                            style: const TextStyle(
                              color: Color(0xFF43A047),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'sans-serif',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Cuisine chips: Wrap (flows by width; no nested scroll).
                  ValueListenableBuilder<ApiState<List<Area>>>(
                    valueListenable: vm.areasState,
                    builder: (context, state, _) {
                      return switch (state) {
                        ApiLoading<List<Area>>() => const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        ApiSuccess<List<Area>>(data: final data) => Builder(
                          builder: (context) {
                            final areas = data ?? <Area>[];
                            if (areas.isEmpty) {
                              return const Padding(
                                padding: EdgeInsets.all(16),
                                child: Center(child: Text('No cuisines')),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: !isOpenCuisine
                                  ? buidAreaWrap(areas.sublist(0, 8))
                                  : buidAreaWrap(areas),
                            );
                          },
                        ),
                        ApiError<List<Area>>(message: final msg) => Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Text(
                              msg,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Color(0xFFB71C1C)),
                            ),
                          ),
                        ),
                      };
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          height: 16,
                          decoration: BoxDecoration(color: Color(0xFF4CAF50)),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "POPULAR RECIPES",
                          style: TextStyle(
                            color: Color(0xFF2E5E2E),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'sans-serif',
                            letterSpacing: 1,
                          ),
                        ),
                        Expanded(child: Text("")),
                        const Text(
                          "See all",
                          style: TextStyle(
                            color: Color(0xFF43A047),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'sans-serif',
                          ),
                        ),
                      ],
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: vm.recipesState,
                    builder: (context, state, _) {
                      return switch (state) {
                        ApiLoading<List<Recipe>>() => Padding(
                          padding: const EdgeInsets.all(18),
                          child: Center(
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ApiSuccess<List<Recipe>>(data: final data) => Builder(
                          builder: (BuildContext context) {
                            final recipes = data ?? <Recipe>[];
                            if (recipes.isEmpty) {
                              return const Text("No recipes found");
                            }
                            return buidlListRecipe(recipes);
                          },
                        ),
                        ApiError<List<Recipe>>(message: final msg) => Text(msg),
                      };
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buidAreaWrap(List<Area> areas) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      alignment: WrapAlignment.start,
      children: areas
          .map(
            (area) => InkWell(
              onTap: () {
                // Handle area selection
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Color(0xFFD9E5D4), width: 1),
                ),
                color: Colors.white,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Text(
                    area.strArea,
                    style: TextStyle(
                      color: Color(0xFF2F3C2F),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget buildListCategories(List<Category> categories) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          mainAxisExtent: 110,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
            ),
            color: Colors.white,
            elevation: 2,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(15, 15, 15, 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(color: Color(0xFFF5F5F5)),
                    color: Color(0xFFF5F5F5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      category.strCategoryThumb,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error),
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) {
                          return child;
                        }
                        return CircularProgressIndicator(
                          value: progress.expectedTotalBytes != null
                              ? progress.cumulativeBytesLoaded /
                                    progress.expectedTotalBytes!
                              : null,
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                  child: Text(
                    category.strCategory,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1E2F23),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'sans-serif',
                      letterSpacing: 1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buidlListRecipe(List<Recipe> recipes) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: recipes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          mainAxisExtent: 270,
        ),
        itemBuilder: (BuildContext context, int index) {
          final recipe = recipes[index];
          return Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(color: Color(0x332E5E2E), width: 0.5),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 122,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          child: Image.network(
                            recipe.strMealThumb,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return CircularProgressIndicator(
                                color: Colors.white,
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0x00FFFFFF), Color(0xCCFFFFFF)],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: Material(
                          elevation: 2,
                          shape: CircleBorder(),
                          child: InkWell(
                            onTap: () {},
                            customBorder: CircleBorder(),
                            child: SizedBox(
                              width: 34,
                              height: 34,
                              child: Icon(
                                Icons.favorite_outline,
                                size: 22,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Material(
                          elevation: 2,
                          shape: CircleBorder(),
                          child: InkWell(
                            onTap: () {},
                            customBorder: CircleBorder(),
                            child: SizedBox(
                              width: 32,
                              height: 32,
                              child: Icon(
                                Icons.video_collection,
                                color: Colors.red,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 5),
                  child: Column(
                    children: [
                      Text(
                        "Jerk chicken with rice &amp; peas — long title that should ellipsize cleanly",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'sans-serif',
                          color: Color(0xFF1B1F1C),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.cookie_outlined,
                            color: Colors.green,
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              "Chicken • Jamaican · Spicy · Dinner",
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                color: Color(0xFF4A5D4A),
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 1,
                        decoration: BoxDecoration(color: Color(0x12000000)),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFE0E0E0),
                            ),
                            child: Icon(Icons.person_outline, size: 14),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              " Admin",
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                color: Color(0xFF2E5E2E),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _displayName(User? user) {
    final name = user?.fullName?.trim();
    if (name != null && name.isNotEmpty) return name;
    final email = user?.email.trim();
    if (email != null && email.isNotEmpty) return email;
    return 'User';
  }

  String _profileErrorLabel(String msg) {
    if (msg.contains('Not signed in')) return 'Guest';
    if (msg.contains('not found')) return 'Set up profile';
    return 'Unavailable';
  }

  Widget buildProfile(String userName, String strImg) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0x33FFFFFF),
            border: Border.all(
              color: Color(0x66FFFFFF),
              width: 2,
            ),
          ),
          child: Icon(Icons.person_2_outlined, size: 18),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Good Morning 👋",
              style: TextStyle(
                color: Color(0x80FFFFFF),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'sans-serif',
              ),
            ),
            Text(
              userName,
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'sans-serif',
              ),
            ),
          ],
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.transparent,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0x1AFFFFFF),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(
              color: Color(0x2AFFFFFF),
              width: 1,
            ),
          ),
          child: Icon(
            Icons.favorite_border_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0x1AFFFFFF),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(
              color: Color(0x2AFFFFFF),
              width: 1,
            ),
          ),
          child: Icon(
            Icons.notifications_active,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }

  final vm = Homeviewmodel(
    Reciperepository(ApiService()),
    Userrepositoryimp(
      fireStoreUser: FireStoreUser(
        firebaseFirestore: FirebaseFirestore.instance,
      ),
      firebaseAuth: FirebaseAuth.instance,
    ),
  );
  bool isOpenCuisine = false;
  bool isOpenCategory = false;

  @override
  void initState() {
    super.initState();
    vm.getUserProfile();
    vm.getCategories();
    vm.getAreas();
    vm.getRecipes();
  }
}
