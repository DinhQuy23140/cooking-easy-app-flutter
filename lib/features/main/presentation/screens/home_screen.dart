import 'package:cooking_easy/core/theme/screen_gradient.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: ScreenGradient.gradient
          ),
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
                          borderRadius: BorderRadius.all(Radius.circular(16)),
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
                                const Text(
                                  "20+",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'sans-serif',
                                  ),
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
                                const Text(
                                  "27+",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'sans-serif',
                                  ),
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
              //   rv category
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
              //   rv cuisine
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
              //   RV POPULAR RECIPES
            ],
          ),
        ),
      ),
    );
  }
}
