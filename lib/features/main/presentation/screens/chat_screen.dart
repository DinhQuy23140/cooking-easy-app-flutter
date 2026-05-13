import 'package:cooking_easy/core/theme/android_drawable_theme.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/screen_gradient.dart';
import '../../../../core/theme/shape_hero_header.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatState();
  }
}

class _ChatState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: ScreenGradient.gradient),
          child: Column(
            children: [
              //header
              Container(
                padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
                decoration: AndroidDrawableTheme.shapeHeroHeader,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Chats",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "Friends & chefs",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 42,
                          height: 42,
                          decoration: AndroidDrawableTheme.shapeCircleGlass,
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 6,),
                        Container(
                          width: 42,
                          height: 42,
                            decoration: AndroidDrawableTheme.shapeCircleGlass,
                            child: const Icon(Icons.edit, color: Colors.white, size: 24,))
                      ],
                    ),
                    const SizedBox(height: 14,),
                    Container(
                      height: 44,
                      decoration: AndroidDrawableTheme.shapeChatSearchPill,
                      padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                      child: Row(
                        children: [
                          Icon(Icons.search_sharp, size: 24,),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                hintText: "Search chats...",
                                hintStyle: TextStyle(
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 15
                              ),
                            ),
                          )
                        ],
                      ),
                    )
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
