import 'package:flutter/material.dart';

import '../../../../core/theme/android_drawable_theme.dart';
import '../../../../core/theme/screen_gradient.dart';
import '../../../../core/theme/shape_circle_glass.dart';
import '../../../../core/theme/shape_hero_header.dart';

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
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>
                      const [],
                  body: Column(
                    children: [
                      Padding(
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
                            Icon(
                              Icons.refresh,
                              size: 28,
                              color: Color(0xFF2E5E2E),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      //feature
                      Container(
                        width: double.infinity,
                        height: 220,
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient:
                              AndroidDrawableTheme.gradientFeaturedOverlay,
                        ),
                        child: Stack(
                          children: [
                            Center(child: CircularProgressIndicator()),
                            Positioned(
                              left: 16,
                              right: 16,
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Spicy Arrabiata Penne",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(color: Color(0x99000000)),
                                        ],
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'sans-serif',
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            10,
                                            4,
                                            10,
                                            4,
                                          ),
                                          margin: EdgeInsets.fromLTRB(
                                            0,
                                            0,
                                            6,
                                            0,
                                          ),
                                          decoration: AndroidDrawableTheme
                                              .shapeCaloriesBadge
                                              .copyWith(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: const Color(
                                                    0x3000C897,
                                                  ),
                                                  width: 2,
                                                ),
                                              ),
                                          child: const Text(
                                            "Vegetarian",
                                            style: TextStyle(
                                              color: Color(0xFF43A047),
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                            10,
                                            4,
                                            10,
                                            4,
                                          ),
                                          decoration: AndroidDrawableTheme
                                              .shapeTagWhite,
                                          child: const Text(
                                            "Italian",
                                            style: TextStyle(
                                              color: Colors.white,
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
                      ),
                      //category
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
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
                            const Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF43A047),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'sans-serif',
                              ),
                            ),
                          ],
                        ),
                      ),
                      //   area
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
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
                            const Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF43A047),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'sans-serif',
                              ),
                            ),
                          ],
                        ),
                      ),
                      //   trending
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
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
                              decoration: AndroidDrawableTheme.shapeCaloriesBadge,
                              padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                              child: const Text(
                                "5 picks",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF43A047),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'sans-serif',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
