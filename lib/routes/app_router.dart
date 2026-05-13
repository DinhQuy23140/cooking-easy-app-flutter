import 'package:cooking_easy/features/auth/domain/repositories/auth_repository.dart';
import 'package:cooking_easy/features/auth/presentation/screens/login_screen.dart';
import 'package:cooking_easy/features/auth/presentation/screens/register_screen.dart';
import 'package:cooking_easy/features/main/presentation/screens/enter_name_screen.dart';
import 'package:cooking_easy/features/main/presentation/screens/home_screen.dart';
import 'package:cooking_easy/features/main/presentation/screens/pick_avatar_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();

  static Future<void> openLogin(
    BuildContext context, {
    required AuthRepository repository,
    bool clearTask = false,
    bool finishCurrent = false,
  }) {
    return _launch<void>(
      context,
      builder: (_) => LoginScreen(repository: repository),
      clearTask: clearTask,
      finishCurrent: finishCurrent,
    );
  }

  static Future<void> openRegister(
    BuildContext context, {
    required AuthRepository repository,
    bool finishCurrent = false,
  }) {
    return _launch<void>(
      context,
      builder: (_) => RegisterScreen(repository: repository),
      clearTask: false,
      finishCurrent: finishCurrent,
    );
  }

  static Future<void> openEnterName(
    BuildContext context, {
    bool clearTask = false,
    bool finishCurrent = false,
  }) {
    return _launch<void>(
      context,
      builder: (_) => const EnterNameScreen(),
      clearTask: clearTask,
      finishCurrent: finishCurrent,
    );
  }

  static Future<void> openPickAvatar(
    BuildContext context, {
    bool finishCurrent = false,
  }) {
    return _launch<void>(
      context,
      builder: (_) => const PickAvatarScreen(),
      clearTask: false,
      finishCurrent: finishCurrent,
    );
  }

  static Future<void> openMain(
    BuildContext context, {
    bool clearTask = true,
    bool finishCurrent = true,
  }) {
    return _launch<void>(
      context,
      builder: (_) => const HomeScreen(),
      clearTask: clearTask,
      finishCurrent: finishCurrent,
    );
  }

  static Future<T?> _launch<T extends Object?>(
    BuildContext context, {
    required WidgetBuilder builder,
    required bool clearTask,
    required bool finishCurrent,
  }) {
    final navigator = Navigator.of(context);
    final route = MaterialPageRoute<T>(builder: builder);
    if (clearTask) return navigator.pushAndRemoveUntil<T>(route, (_) => false);
    if (finishCurrent) return navigator.pushReplacement<T, Object?>(route);
    return navigator.push<T>(route);
  }
}
