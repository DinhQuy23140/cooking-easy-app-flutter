import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_easy/core/theme/android_drawable_theme.dart';
import 'package:cooking_easy/core/theme/screen_gradient.dart';
import 'package:cooking_easy/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:cooking_easy/features/main/data/remote/firebase/fireStore/fireStoreUser.dart';
import 'package:cooking_easy/features/main/presentation/state/api_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cooking_easy/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/theme/shape_hero_header.dart';
import '../../../auth/presentation/navigation/auth_navigator.dart';
import '../../data/repository/userRepositoryImp.dart';
import '../../viewmodel/myProfileViewModel.dart';
import '../widget/custom_switch.dart';
import '../widget/log_out_dialog.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyProfileState();
  }
}

class MyProfileState extends State<MyProfileScreen> {
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
              Card(
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 52, 20, 22),
                  decoration: BoxDecoration(
                    gradient: ShapeHeroHeader.shapeHeroHeader,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "MY PROFILE",
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                color: Color(0x80FFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: AndroidDrawableTheme.shapeCircleGlass,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: AndroidDrawableTheme.shapeAvatarRing,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: Image.network(
                                "google.com",
                                loadingBuilder: (context, child, loading) {
                                  if (loading == null) {
                                    return child;
                                  }
                                  return const CircularProgressIndicator();
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.person_outline,
                                    color: Colors.grey,
                                    size: 24,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "UserName",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'sans-serif',
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "username@gmail.com",
                                style: TextStyle(
                                  color: Color(0x80FFFFFF),
                                  fontSize: 13,
                                  fontFamily: 'sans-serif',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "12",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'sans-serif',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Recipe",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'sans-serif',
                                    color: Color(0x80FFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "48",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'sans-serif',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Saved",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'sans-serif',
                                    color: Color(0x80FFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "5",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'sans-serif',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Upload",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'sans-serif',
                                    color: Color(0x80FFFFFF),
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
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(14),
                                decoration:
                                    AndroidDrawableTheme.shapeQuickActionCard,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: AndroidDrawableTheme
                                          .shapeIconPillGreen,
                                      child: Icon(Icons.receipt_long, size: 16),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "My Recipe",
                                      style: TextStyle(
                                        color: Color(0xFF2E5E2E),
                                        fontSize: 11,
                                        fontFamily: 'sans-serif',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(14),
                                decoration:
                                    AndroidDrawableTheme.shapeQuickActionCard,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: AndroidDrawableTheme
                                          .shapeIconPillGreen,
                                      child: Icon(
                                        Icons.favorite_border_outlined,
                                        size: 16,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "My Recipe",
                                      style: TextStyle(
                                        color: Color(0xFF2E5E2E),
                                        fontSize: 11,
                                        fontFamily: 'sans-serif',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(14),
                                decoration:
                                    AndroidDrawableTheme.shapeQuickActionCard,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: AndroidDrawableTheme
                                          .shapeIconPillGreen,
                                      child: Icon(
                                        Icons.cloud_upload_outlined,
                                        size: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Upload",
                                      style: TextStyle(
                                        color: Color(0xFF2E5E2E),
                                        fontSize: 11,
                                        fontFamily: 'sans-serif',
                                        fontWeight: FontWeight.w600,
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
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          _buiHeader(title: "MANAGE"),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 14),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    height: 58,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 36,
                                          height: 36,
                                          decoration: AndroidDrawableTheme
                                              .shapeIconPillGreen,
                                          child: Icon(
                                            Icons.person_outline,
                                            size: 18,
                                          ),
                                        ),
                                        const SizedBox(width: 14),
                                        Expanded(
                                          child: Text(
                                            "Profile",
                                            style: TextStyle(
                                              color: Color(0xFF222222),
                                              fontSize: 14,
                                              fontFamily: 'sans-serif',
                                            ),
                                          ),
                                        ),
                                        Icon(Icons.arrow_forward_ios, size: 16),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    height: 58,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 36,
                                          height: 36,
                                          decoration: AndroidDrawableTheme
                                              .shapeIconPillGreen,
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 18,
                                          ),
                                        ),
                                        const SizedBox(width: 14),
                                        Expanded(
                                          child: Text(
                                            "Favorite Recipes",
                                            style: TextStyle(
                                              color: Color(0xFF222222),
                                              fontSize: 14,
                                              fontFamily: 'sans-serif',
                                            ),
                                          ),
                                        ),
                                        Icon(Icons.arrow_forward_ios, size: 16),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _buiHeader(title: "SETTING"),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 14),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    height: 58,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 36,
                                          height: 36,
                                          decoration: AndroidDrawableTheme
                                              .shapeIconPillGreen,
                                          child: Icon(Icons.language, size: 18),
                                        ),
                                        const SizedBox(width: 14),
                                        Expanded(
                                          child: Text(
                                            "Language",
                                            style: TextStyle(
                                              color: Color(0xFF222222),
                                              fontSize: 14,
                                              fontFamily: 'sans-serif',
                                            ),
                                          ),
                                        ),
                                        Icon(Icons.arrow_forward_ios, size: 16),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    height: 58,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 36,
                                          height: 36,
                                          decoration: AndroidDrawableTheme
                                              .shapeIconPillGreen,
                                          child: Icon(
                                            Icons.dark_mode_outlined,
                                            size: 18,
                                          ),
                                        ),
                                        const SizedBox(width: 14),
                                        Expanded(
                                          child: Text(
                                            "Dark mode",
                                            style: TextStyle(
                                              color: Color(0xFF222222),
                                              fontSize: 14,
                                              fontFamily: 'sans-serif',
                                            ),
                                          ),
                                        ),
                                        CustomSwitch(
                                          value: false,
                                          onChanged: (value) {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _buiHeader(title: "Account"),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                final resut = await showLogoutDialog(context);
                                if (resut == true) {
                                  vm.logout();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 14),
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(14),
                                    ),
                                  ),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 14,
                                        ),
                                        height: 58,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 36,
                                              height: 36,
                                              decoration: AndroidDrawableTheme
                                                  .shapeIconPillGreen,
                                              child: Icon(
                                                Icons.login_outlined,
                                                color: Colors.redAccent,
                                                size: 18,
                                              ),
                                            ),
                                            const SizedBox(width: 14),
                                            Expanded(
                                              child: Text(
                                                "Logout",
                                                style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 14,
                                                  fontFamily: 'sans-serif',
                                                  fontWeight: FontWeight.w600,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverPadding(padding: EdgeInsetsGeometry.only(bottom: 32)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buiHeader({required String title}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 24, 20, 10),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 16,
            margin: EdgeInsets.only(right: 8),
            decoration: AndroidDrawableTheme.shapeAccentBar,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFF2E5E2E),
                fontSize: 12,
                fontFamily: 'sans-serif',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  final vm = Myprofileviewmodel(
    Userrepositoryimp(
      fireStoreUser: FireStoreUser(
        firebaseFirestore: FirebaseFirestore.instance,
      ),
      firebaseAuth: FirebaseAuth.instance,
    ),
  );

  void _navigateToLogin() {
    AuthNavigator.openLogin(
      context,
      repository: FirebaseAuthRepository(),
      finishCurrent: true,
      clearTask: true,
    );
  }

  @override
  void initState() {
    super.initState();
    vm.isLoading.addListener(() {
      final state = vm.isLoading.value;

      if (state is ApiSuccess) {
        _navigateToLogin();
      }
    });
  }
}
