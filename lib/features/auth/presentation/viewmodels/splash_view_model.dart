import 'package:cooking_easy/features/auth/domain/repositories/auth_repository.dart';
import 'package:cooking_easy/features/auth/presentation/state/splash_state.dart';
import 'package:flutter/foundation.dart';

/// Flutter port of the (Hilt-injected) `SplashViewModel` referenced by
/// `SplashActivity.kt`. It checks the current login status and emits a
/// navigation target.
class SplashViewModel {
  SplashViewModel(this._authRepository);

  final AuthRepository _authRepository;

  final ValueNotifier<SplashState> state = ValueNotifier<SplashState>(
    const SplashIdle(),
  );

  Future<void> checkLoginStatus() async {
    state.value = const SplashLoading();
    try {
      final user = await _authRepository.getCurrentUser();
      if (user == null) {
        state.value = const SplashNavigateToLogin();
        return;
      }
      state.value = user.isNewUser
          ? const SplashNavigateToEnterName()
          : const SplashNavigateToMain();
    } catch (_) {
      state.value = const SplashNavigateToLogin();
    }
  }

  void dispose() {
    state.dispose();
  }
}
