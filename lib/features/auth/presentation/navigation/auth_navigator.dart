import 'package:cooking_easy/features/auth/domain/repositories/auth_repository.dart';
import 'package:cooking_easy/routes/app_router.dart';
import 'package:flutter/material.dart';

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
    return AppRouter.openLogin(
      context,
      repository: repository,
      clearTask: clearTask,
      finishCurrent: finishCurrent,
    );
  }

  static Future<void> openRegister(
    BuildContext context, {
    required AuthRepository repository,
    bool finishCurrent = false,
  }) {
    return AppRouter.openRegister(
      context,
      repository: repository,
      finishCurrent: finishCurrent,
    );
  }

  static Future<void> openEnterName(
    BuildContext context, {
    bool clearTask = false,
    bool finishCurrent = false,
  }) {
    return AppRouter.openEnterName(
      context,
      clearTask: clearTask,
      finishCurrent: finishCurrent,
    );
  }

  static Future<void> openPickAvatar(
    BuildContext context, {
    bool finishCurrent = false,
  }) {
    return AppRouter.openPickAvatar(context, finishCurrent: finishCurrent);
  }

  static Future<void> openMain(
    BuildContext context, {
    bool clearTask = true,
    bool finishCurrent = true,
  }) {
    return AppRouter.openMain(
      context,
      clearTask: clearTask,
      finishCurrent: finishCurrent,
    );
  }
}
