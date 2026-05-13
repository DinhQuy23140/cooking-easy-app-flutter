import 'package:cooking_easy/core/theme/app_text_title.dart';
import 'package:cooking_easy/core/theme/screen_gradient.dart';
import 'package:cooking_easy/core/theme/shape_accent_bar.dart';
import 'package:cooking_easy/core/theme/shape_cart_view.dart';
import 'package:cooking_easy/core/theme/shape_circle_glass.dart';
import 'package:cooking_easy/core/theme/shape_hero_header.dart';
import 'package:cooking_easy/core/theme/shape_input_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddRecipeState();
  }
}

class _AddRecipeState extends State<AddRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: ScreenGradient.gradient),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: ShapeHeroHeader.shapeHeroHeader,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 52, 20, 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "COOKING",
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'sans-serif',
                              color: Color(0x80FFFFFF),
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "New Recipe",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'sans-serif',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Divider(thickness: 1, color: Colors.transparent),
                      ),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: ShapeCircleGlass.shapeCircleGlass,
                        child: Icon(Icons.cancel, color: Colors.redAccent),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>
                      const [],
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 32),
                      child: Column(
                        children: [
                          Container(
                            decoration: ShapeCartView.shapeCartView,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 3,
                                        height: 16,
                                        decoration:
                                            ShapeAccentBar.shapeAccentBar,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "MEAL IMAGE",
                                        style: AppTextTitle.textHeader,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  DottedBorder(
                                    color: Color(0xFFA5D6A7),
                                    strokeWidth: 2,
                                    dashPattern: [8, 4],
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(12),
                                    child: Container(
                                      height: 150,
                                      width: double.infinity,
                                      color: Color(0xFFEAF3DE),
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.camera_alt,
                                              color: Color(0xFF2E5E2E),
                                              size: 36,
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              "Tap to add photo",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'sans-serif',
                                                color: Color(0x4D2E5E2E),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: ShapeCartView.shapeCartView,
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 3,
                                        height: 16,
                                        decoration:
                                            ShapeAccentBar.shapeAccentBar,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "BASIC INFO",
                                        style: AppTextTitle.textHeader,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    "Meal Name *",
                                    style: AppTextTitle.textHeader,
                                  ),
                                  const SizedBox(height: 6),
                                  SizedBox(
                                    height: 48,
                                    child: TextField(
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'sans-serif',
                                        color: Color(0xFF42E5E2E),
                                      ),
                                      decoration: ShapeInputField
                                          .shapeInputField
                                          .copyWith(
                                            hintText:
                                                "e.g. Spicy Arrabiata Penne",
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Category",
                                              style: AppTextTitle.textHeader,
                                            ),
                                            const SizedBox(height: 6),
                                            TextField(
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff2E5E2E),
                                              ),
                                              decoration: ShapeInputField
                                                  .shapeInputField
                                                  .copyWith(
                                                    hintText: "e.g. Pasta",
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Area",
                                              style: AppTextTitle.textHeader,
                                            ),
                                            const SizedBox(height: 6),
                                            TextField(
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff2E5E2E),
                                              ),
                                              decoration: ShapeInputField
                                                  .shapeInputField
                                                  .copyWith(
                                                    hintText: "e.g. Italian",
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Text("Tags", style: AppTextTitle.textHeader),
                                  const SizedBox(height: 6),
                                  SizedBox(
                                    height: 48,
                                    child: TextField(
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff2E5E2E),
                                      ),
                                      decoration: ShapeInputField
                                          .shapeInputField
                                          .copyWith(
                                            hintText: "e.g. Pasta, Curry",
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    "YouTobe Link",
                                    style: AppTextTitle.textHeader,
                                  ),
                                  const SizedBox(height: 6),
                                  SizedBox(
                                    height: 48,
                                    child: TextField(
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF2E5E2E),
                                      ),
                                      decoration: ShapeInputField
                                          .shapeInputField
                                          .copyWith(
                                            hintText: "https://youtube.com/...",
                                            prefixIcon: Icon(
                                              Icons.eighteen_mp_outlined,
                                            ),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: ShapeCartView.shapeCartView,
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 3,
                                        height: 16,
                                        decoration:
                                            ShapeAccentBar.shapeAccentBar,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "INGREDIENTS",
                                          style: AppTextTitle.textHeader,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0x1500C897),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          border: Border.all(
                                            color: Color(0x3000C897),
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                            10,
                                            3,
                                            10,
                                            3,
                                          ),
                                          child: Text(
                                            "0 items",
                                            style: AppTextTitle.textHeader
                                                .copyWith(fontSize: 11),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Ingredient",
                                          style: AppTextTitle.textHeader
                                              .copyWith(
                                                fontSize: 11,
                                                color: Color(0x4D2E5E2E),
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          "Measure",
                                          style: AppTextTitle.textHeader
                                              .copyWith(
                                                fontSize: 11,
                                                color: Color(0x4D2E5E2E),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  //   rv ingredient
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          side: BorderSide(
                                            color: Color(0xFFA2CB8B),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                      icon: Icon(
                                        Icons.add,
                                        color: Color(0xFF43A047),
                                      ),
                                      onPressed: () {},
                                      label: Text(
                                        "Add Ingredient",
                                        style: TextStyle(
                                          color: Color(0xFF43A047),
                                          fontSize: 13,
                                          fontFamily: 'sans-serif',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: ShapeCartView.shapeCartView,
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 3,
                                        height: 16,
                                        decoration:
                                            ShapeAccentBar.shapeAccentBar,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "INSTRUCTIONS",
                                          style: AppTextTitle.textHeader,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0x1500C897),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          border: Border.all(
                                            color: Color(0x3000C897),
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                            10,
                                            3,
                                            10,
                                            3,
                                          ),
                                          child: Text(
                                            "0 steps",
                                            style: AppTextTitle.textHeader
                                                .copyWith(fontSize: 11),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 36,
                                        child: Text(
                                          "Step",
                                          style: AppTextTitle.textHeader
                                              .copyWith(
                                                fontSize: 11,
                                                color: Color(0x4D2E5E2E),
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Description",
                                          style: AppTextTitle.textHeader
                                              .copyWith(
                                                fontSize: 11,
                                                color: Color(0x4D2E5E2E),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  //   rv ingredient
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          side: BorderSide(
                                            color: Color(0xFFA2CB8B),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                      icon: Icon(
                                        Icons.add,
                                        color: Color(0xFF43A047),
                                      ),
                                      onPressed: () {},
                                      label: Text(
                                        "Add Ingredient",
                                        style: TextStyle(
                                          color: Color(0xFF43A047),
                                          fontSize: 13,
                                          fontFamily: 'sans-serif',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: ShapeCartView.shapeCartView,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 3,
                                        height: 16,
                                        decoration:
                                            ShapeAccentBar.shapeAccentBar,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "COOKING VIDEO",
                                        style: AppTextTitle.textHeader,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  DottedBorder(
                                    color: Color(0xFFA5D6A7),
                                    strokeWidth: 2,
                                    dashPattern: [8, 4],
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(12),
                                    child: Container(
                                      height: 150,
                                      width: double.infinity,
                                      color: Color(0xFFEAF3DE),
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.video_camera_back,
                                              color: Color(0xFF2E5E2E),
                                              size: 36,
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              "Tap to select video",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'sans-serif',
                                                color: Color(0x4D2E5E2E),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Text(
                                              "MP4, MOV up to 100MB",
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'sans-serif',
                                                color: Color(0x4D2E5E2E),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Save Draft",
                                      style: AppTextTitle.textHeader,
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                      side: BorderSide(
                                        color: Color(0xFFA2CB8B),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.add, color: Colors.white),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF43A047),
                                    ),
                                    label: Text(
                                      "Publish",
                                      style: AppTextTitle.textHeader.copyWith(
                                        color: Colors.white,
                                      ),
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
      ),
    );
  }
}
