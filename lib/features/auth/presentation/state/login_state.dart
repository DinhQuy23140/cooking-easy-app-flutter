import 'package:cooking_easy/features/auth/domain/entities/auth_user.dart';

/// Mirrors `LoginState.kt` (sealed class).
sealed class LoginState {
  const LoginState();
}

class LoginIdle extends LoginState {
  const LoginIdle();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess(this.user, {this.isNewUser = false});

  final AuthUser user;
  final bool isNewUser;
}

class LoginResetSuccess extends LoginState {
  const LoginResetSuccess();
}

class LoginError extends LoginState {
  const LoginError(this.message);

  final String message;
}
