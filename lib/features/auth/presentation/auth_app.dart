import 'package:flutter/material.dart';

import '../data/repositories/mock_auth_repository.dart';
import '../domain/repositories/auth_repository.dart';
import 'screens/splash_screen.dart';

/// Root widget for the auth feature.
///
/// Boots into [SplashScreen], which then routes to Login / EnterName / Main
/// via [AuthNavigator] once it knows the current login status.
class AuthApp extends StatefulWidget {
  const AuthApp({super.key});

  @override
  State<AuthApp> createState() => _AuthAppState();
}

class _AuthAppState extends State<AuthApp> {
  final AuthRepository _repository = MockAuthRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking Easy - Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: SplashScreen(repository: _repository),
    );
  }
}
