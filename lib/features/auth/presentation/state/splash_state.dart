/// Mirrors the `SplashState` sealed class referenced by `SplashActivity.kt`.
sealed class SplashState {
  const SplashState();
}

class SplashIdle extends SplashState {
  const SplashIdle();
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashNavigateToLogin extends SplashState {
  const SplashNavigateToLogin();
}

class SplashNavigateToEnterName extends SplashState {
  const SplashNavigateToEnterName();
}

class SplashNavigateToMain extends SplashState {
  const SplashNavigateToMain();
}
