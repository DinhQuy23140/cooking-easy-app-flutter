import 'package:flutter/material.dart';

/// Flutter port of `ForgotPasswordActivity.kt`.
///
/// The Kotlin activity is currently a stub that only inflates a layout, so the
/// Flutter equivalent is also a placeholder — the actual reset-password flow
/// is handled inline by `LoginScreen` via `showForgotPasswordDialog`.
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: const Center(child: Text('TODO: Forgot password screen')),
    );
  }
}
