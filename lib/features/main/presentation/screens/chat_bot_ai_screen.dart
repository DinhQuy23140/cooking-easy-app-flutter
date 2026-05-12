import 'package:cooking_easy/core/theme/screen_gradient.dart';
import 'package:cooking_easy/core/theme/shape_hero_header.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_title.dart';
import '../../../../core/theme/shape_cart_view.dart';

class ChatBotAiScreen extends StatefulWidget {
  const ChatBotAiScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatBotAiState();
  }
}

class _ChatBotAiState extends State<ChatBotAiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(gradient: ScreenGradient.gradient),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 52, 20, 20),
                decoration: BoxDecoration(
                  gradient: ShapeHeroHeader.shapeHeroHeader,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: Color(0x2AFFFFFF), width: 1),
                      ),
                      child: Center(
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Stack(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Color(0x1AFFFFFF),
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            border: Border.all(
                              color: Color(0x2AFFFFFF),
                              width: 1,
                            ),
                          ),
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Color(0xFF4CAF50),
                              borderRadius: BorderRadius.all(
                                Radius.circular(22),
                              ),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chef AI",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'sans-serif',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Your cooking assistant",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'sans-serif',
                              color: Color(0x80FFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0x2AFFFFFF), width: 1),
                      ),
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>
                      const [],
                  body: Container(),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Container(
                      height: 32,
                      padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                      decoration: ShapeCartView.shapeCartView.copyWith(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                          "🍽 Dinner ideas",
                          style: AppTextTitle.textHeader.copyWith(
                            fontSize: 12,
                            color: Color(0xFF2E5E2E),
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 32,
                      padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                      decoration: ShapeCartView.shapeCartView.copyWith(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                          "🍗 Cook with chicken",
                          style: AppTextTitle.textHeader.copyWith(
                            fontSize: 12,
                            color: Color(0xFF2E5E2E),
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 32,
                      padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                      decoration: ShapeCartView.shapeCartView.copyWith(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                          "🥗 Healthy breakfast",
                          style: AppTextTitle.textHeader.copyWith(
                            fontSize: 12,
                            color: Color(0xFF2E5E2E),
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 32,
                      padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                      decoration: ShapeCartView.shapeCartView.copyWith(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                          "⚡ Quick 15 min meals",
                          style: AppTextTitle.textHeader.copyWith(
                            fontSize: 12,
                            color: Color(0xFF2E5E2E),
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 24),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: ShapeCartView.shapeCartView,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Ask me anything about food...",
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 12,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: ShapeCartView.shapeCartView.copyWith(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  color: Color(0xFFEAF3DE),
                                ),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: ShapeHeroHeader.shapeHeroHeader,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      child: Icon(Icons.send, color: Colors.white),
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
}
