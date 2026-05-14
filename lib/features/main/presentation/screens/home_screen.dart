import 'package:cooking_easy/core/theme/screen_gradient.dart';
import 'package:cooking_easy/features/main/data/remote/api/ApiService.dart';
import 'package:cooking_easy/features/main/domain/model/area.dart';
import 'package:cooking_easy/features/main/domain/model/category.dart';
import 'package:cooking_easy/features/main/presentation/state/api_state.dart';
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
                          Row(
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
                                  const Text(
                                    "User name",
                                    style: TextStyle(
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
                                    const Text(
                                      "300+",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'sans-serif',
                                      ),
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
                                          return switch(state) {
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
                                            ApiSuccess<List<
                                                Category>>(data: final data) =>
                                                Text(
                                                  data?.length as String,
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
                                        }),
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
                                          ApiError<List<Area>>() =>
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
                  //   rv category
                  // Row(
                  //   children: [
                  //     Card(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //         side: BorderSide(
                  //           color: Color(0xFFE0E0E0),
                  //           width: 0.5,
                  //         ),
                  //       ),
                  //       color: Colors.white,
                  //       elevation: 2,
                  //       child: Column(
                  //         children: [
                  //           Container(
                  //             width: 50,
                  //             height: 50,
                  //             margin: EdgeInsets.fromLTRB(15, 15, 15, 6),
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(25),
                  //               ),
                  //               color: Color(0xFFF5F5F5),
                  //             ),
                  //             child: Icon(Icons.category_outlined),
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                  //             child: Text(
                  //               "Category",
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                 color: Color(0xFF1E2F23),
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.w400,
                  //                 fontFamily: 'sans-serif',
                  //                 letterSpacing: 1,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ValueListenableBuilder(
                    valueListenable: vm.categoriesState,
                    builder: (context, state, _) {
                      return switch (state) {
                        ApiLoading<List<Category>>() =>
                        const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                        ApiSuccess<List<Category>>(data: final categories) =>
                            GridView.builder(
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                              ),
                              itemBuilder: (context, index) {
                                final category = categories?[index];
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: Color(0xFFE0E0E0),
                                      width: 0.5,
                                    ),
                                  ),
                                  color: Colors.white,
                                  elevation: 2,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        margin: EdgeInsets.fromLTRB(
                                            15, 15, 15, 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ),
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Icon(Icons.category_outlined),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            5, 0, 5, 10),
                                        child: Text(
                                          "Category",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF1E2F23),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'sans-serif',
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                        ApiError<List<Category>>(message: final msg) =>
                            Center(
                              child: Text(msg),
                            ),
                      };
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      20,
                      20,
                      12,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Color(0xFF4CAF50),
                          ),
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
                        ApiLoading<List<Area>>() =>
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        ApiSuccess<List<Area>>(data: final data) =>
                            Builder(
                              builder: (context) {
                                final areas = data ?? <Area>[];
                                if (areas.isEmpty) {
                                  return const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Center(child: Text('No cuisines')),
                                  );
                                }
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20, 0, 20, 0),
                                  child: !isOpenCuisine
                                      ? buidAreaWrap(areas.sublist(0, 8))
                                      : buidAreaWrap(areas),
                                );
                              },
                            ),
                        ApiError<List<Area>>(message: final msg) =>
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Center(
                                child: Text(
                                  msg,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Color(0xFFB71C1C)),
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
            (area) =>
            InkWell(
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

  final vm = Homeviewmodel(Reciperepository(ApiService()));
  bool isOpenCuisine = false;
  bool isOpenCategory = false;

  @override
  void initState() {
    super.initState();
    vm.getCategories();
    vm.getAreas();
  }
}
