import 'package:cooking_easy/features/main/presentation/screens/add_recipe_screen.dart';
import 'package:cooking_easy/features/main/presentation/screens/explore_screen.dart';
import 'package:cooking_easy/features/main/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

/// Flutter placeholder for `MainActivity`.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> pages = [const HomeScreen(), const ExploreScreen(), const ChatScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.explore), label: "Explore"),
          NavigationDestination(
            icon: Icon(Icons.message_outlined),
            label: "Chat",
          ),
          NavigationDestination(icon: Icon(Icons.assistant), label: "AI"),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: "My profile",
          ),
        ],
      ),
    );
  }
}
