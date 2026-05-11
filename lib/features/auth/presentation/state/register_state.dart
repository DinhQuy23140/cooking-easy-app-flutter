import '../../domain/entities/auth_user.dart';

/// Mirrors `RegisterState.kt` (sealed class).
sealed class RegisterState {
  const RegisterState();
}

class RegisterIdle extends RegisterState {
  const RegisterIdle();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess(this.user);

  final AuthUser user;
}

class RegisterError extends RegisterState {
  const RegisterError(this.message);

  final String message;
}
