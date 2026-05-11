import 'package:flutter/foundation.dart';

import '../../domain/repositories/auth_repository.dart';
import '../state/login_state.dart';

/// Flutter port of `LoginViewModel.kt`.
class LoginViewModel {
  LoginViewModel(this._authRepository);

  final AuthRepository _authRepository;

  final ValueNotifier<LoginState> loginState = ValueNotifier<LoginState>(
    const LoginIdle(),
  );

  final ValueNotifier<LoginState> resetPasswordState = ValueNotifier<LoginState>(
    const LoginIdle(),
  );

  static final RegExp _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  Future<void> login({required String email, required String password}) async {
    if (!_validate(email: email, password: password)) {
      return;
    }

    loginState.value = const LoginLoading();
    try {
      final user = await _authRepository.login(email: email, password: password);
      loginState.value = LoginSuccess(user, isNewUser: user.isNewUser);
    } catch (e) {
      loginState.value = LoginError(_messageOf(e, fallback: 'Login failed'));
    }
  }

  Future<void> loginWithGoogle({String? idToken}) async {
    loginState.value = const LoginLoading();
    try {
      final user = await _authRepository.loginWithGoogle();
      loginState.value = LoginSuccess(user, isNewUser: user.isNewUser);
    } catch (e) {
      loginState.value = LoginError(
        _messageOf(e, fallback: 'Google sign-in failed'),
      );
    }
  }

  Future<void> resetPassword(String email) async {
    if (email.trim().isEmpty) {
      resetPasswordState.value = const LoginError('Please enter your email');
      return;
    }

    resetPasswordState.value = const LoginLoading();
    try {
      await _authRepository.resetPassword(email.trim());
      resetPasswordState.value = const LoginResetSuccess();
    } catch (e) {
      resetPasswordState.value = LoginError(
        _messageOf(e, fallback: 'Reset password failed'),
      );
    }
  }

  void resetState() {
    loginState.value = const LoginIdle();
    resetPasswordState.value = const LoginIdle();
  }

  void dispose() {
    loginState.dispose();
    resetPasswordState.dispose();
  }

  bool _validate({required String email, required String password}) {
    if (email.trim().isEmpty) {
      loginState.value = const LoginError('Email is required');
      return false;
    }
    if (!_emailRegex.hasMatch(email.trim())) {
      loginState.value = const LoginError('Invalid email format');
      return false;
    }
    if (password.isEmpty) {
      loginState.value = const LoginError('Password is required');
      return false;
    }
    if (password.length < 6) {
      loginState.value = const LoginError(
        'Password must be at least 6 characters',
      );
      return false;
    }
    return true;
  }

  String _messageOf(Object error, {required String fallback}) {
    final raw = error is Exception
        ? error.toString().replaceFirst('Exception: ', '')
        : error.toString();
    return raw.isEmpty ? fallback : raw;
  }
}
