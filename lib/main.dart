import 'package:cooking_easy/features/auth/presentation/auth_app.dart';
import 'package:cooking_easy/firebase_bootstrap.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebaseAndGoogleSignIn();
  runApp(const MaterialApp(home: AuthApp()));
}
