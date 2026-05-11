import 'package:flutter/material.dart';

import '../../../main/presentation/screens/enter_name_screen.dart';
import '../../../main/presentation/screens/main_screen.dart';
import '../../../main/presentation/screens/pick_avatar_screen.dart';
import '../../domain/repositories/auth_repository.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

/// Flutter port of `AuthNavigator.kt`.
///
/// The Android implementation uses `NavDeepLinkBuilder` to launch a new
/// `Activity` with a synthesized backstack, optionally finishing the current
/// activity (`finishCurrent`) or the whole task (`clearTask`).
///
/// In Flutter we map those semantics onto `Navigator`:
///  * `clearTask`     → `pushAndRemoveUntil` that drops every previous route.
///  * `finishCurrent` → `pushReplacement` (drops only the caller).
///  * neither         → plain `push`.
class AuthNavigator {
  const AuthNavigator._();

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
      builder: (_) => const MainScreen(),
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

    if (clearTask) {
      return navigator.pushAndRemoveUntil<T>(route, (_) => false);
    }
    if (finishCurrent) {
      return navigator.pushReplacement<T, Object?>(route);
    }
    return navigator.push<T>(route);
  }
}
