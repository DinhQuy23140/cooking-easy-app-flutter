import 'package:cooking_easy/features/auth/domain/repositories/auth_repository.dart';
import 'package:cooking_easy/features/auth/presentation/state/register_state.dart';
import 'package:flutter/foundation.dart';

/// Flutter port of `RegisterViewModel.kt`.
class RegisterViewModel {
  RegisterViewModel(this._authRepository);

  final AuthRepository _authRepository;

  final ValueNotifier<RegisterState> registerState =
      ValueNotifier<RegisterState>(const RegisterIdle());

  static final RegExp _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (!_validate(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    )) {
      return;
    }

    registerState.value = const RegisterLoading();
    try {
      final user = await _authRepository.register(
        email: email,
        password: password,
      );
      registerState.value = RegisterSuccess(user);
    } catch (e) {
      registerState.value = RegisterError(
        _mapFirebaseError(_messageOf(e, fallback: 'Registration failed')),
      );
    }
  }

  Future<void> registerWithGoogle({String? idToken}) async {
    registerState.value = const RegisterLoading();
    try {
      final user = await _authRepository.loginWithGoogle();
      registerState.value = RegisterSuccess(user);
    } catch (e) {
      registerState.value = RegisterError(
        _messageOf(e, fallback: 'Google sign-up failed'),
      );
    }
  }

  void resetState() {
    registerState.value = const RegisterIdle();
  }

  void dispose() {
    registerState.dispose();
  }

  bool _validate({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    if (email.trim().isEmpty) {
      registerState.value = const RegisterError('Email is required');
      return false;
    }
    if (!_emailRegex.hasMatch(email.trim())) {
      registerState.value = const RegisterError('Invalid email format');
      return false;
    }
    if (password.isEmpty) {
      registerState.value = const RegisterError('Password is required');
      return false;
    }
    if (password.length < 6) {
      registerState.value = const RegisterError(
        'Password must be at least 6 characters',
      );
      return false;
    }
    if (confirmPassword.isEmpty) {
      registerState.value = const RegisterError('Please confirm your password');
      return false;
    }
    if (password != confirmPassword) {
      registerState.value = const RegisterError('Passwords do not match');
      return false;
    }
    return true;
  }

  String _mapFirebaseError(String? message) {
    if (message == null || message.isEmpty) {
      return 'Registration failed';
    }
    if (message.contains('email address is already in use')) {
      return 'This email is already registered';
    }
    if (message.contains('email address is badly formatted')) {
      return 'Invalid email format';
    }
    if (message.contains('network error')) {
      return 'No internet connection';
    }
    return message;
  }

  String _messageOf(Object error, {required String fallback}) {
    final raw = error is Exception
        ? error.toString().replaceFirst('Exception: ', '')
        : error.toString();
    return raw.isEmpty ? fallback : raw;
  }
}
