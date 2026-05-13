import 'package:cooking_easy/features/auth/domain/repositories/auth_repository.dart';
import 'package:cooking_easy/features/auth/presentation/navigation/auth_navigator.dart';
import 'package:cooking_easy/features/auth/presentation/state/login_state.dart';
import 'package:cooking_easy/features/auth/presentation/viewmodels/login_view_model.dart';
import 'package:cooking_easy/features/auth/presentation/widgets/forgot_password_dialog.dart';
import 'package:flutter/material.dart';

/// Flutter port of `LoginActivity.kt` (uses [LoginViewModel] internally).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.repository});

  final AuthRepository repository;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginViewModel _viewModel;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel(widget.repository);
    _viewModel.loginState.addListener(_onLoginStateChanged);
    _viewModel.resetPasswordState.addListener(_onResetPasswordStateChanged);
  }

  @override
  void dispose() {
    _viewModel.loginState.removeListener(_onLoginStateChanged);
    _viewModel.resetPasswordState.removeListener(_onResetPasswordStateChanged);
    _viewModel.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginStateChanged() {
    if (!mounted) return;
    final state = _viewModel.loginState.value;

    switch (state) {
      case LoginIdle():
      case LoginLoading():
        break;
      case LoginSuccess(:final isNewUser):
        if (isNewUser) {
          _navigateToEnterName();
        } else {
          _navigateToMain();
        }
      case LoginResetSuccess():
        _showMessage('Reset link sent! Please check your email.');
        _viewModel.resetState();
      case LoginError(:final message):
        _showError(message);
        _viewModel.resetState();
    }
  }

  void _onResetPasswordStateChanged() {
    if (!mounted) return;
    final state = _viewModel.resetPasswordState.value;

    switch (state) {
      case LoginIdle():
      case LoginLoading():
      case LoginSuccess():
        break;
      case LoginResetSuccess():
        _showMessage('Reset link sent! Please check your email.');
        _viewModel.resetState();
      case LoginError(:final message):
        _showError(message);
        _viewModel.resetState();
    }
  }

  Future<void> _onLoginPressed() {
    return _viewModel.login(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
  }

  /// Mirrors `startGoogleSignIn` / `tryGoogleSignIn`. The repository decides
  /// how a Google credential is obtained on this platform.
  Future<void> _onGoogleSignInPressed() {
    return _viewModel.loginWithGoogle();
  }

  Future<void> _onForgotPasswordPressed() async {
    final email = await showForgotPasswordDialog(context);
    if (email == null || !mounted) return;
    await _viewModel.resetPassword(email);
  }

  void _navigateToRegister() {
    AuthNavigator.openRegister(context, repository: widget.repository);
  }

  void _navigateToMain() {
    AuthNavigator.openMain(context, clearTask: true, finishCurrent: true);
  }

  void _navigateToEnterName() {
    AuthNavigator.openEnterName(context, clearTask: true, finishCurrent: true);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 4)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF66BB6A), Color(0xFF43A047), Color(0xFF2E7D32)],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: ListenableBuilder(
            listenable: _viewModel.loginState,
            builder: (context, _) {
              final isLoading = _viewModel.loginState.value is LoginLoading;
              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 52),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0x1AFFFFFF),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: const Color(0x2AFFFFFF),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Cooking Easy',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontFamily: 'sans-serif-medium',
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Welcome back!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0x99FFFFFF),
                                fontFamily: 'sans-serif',
                              ),
                            ),
                            const SizedBox(height: 28),
                            Expanded(
                              child: _LoginForm(
                                emailController: _emailController,
                                passwordController: _passwordController,
                                isLoading: isLoading,
                                onLogin: _onLoginPressed,
                                onGoogle: _onGoogleSignInPressed,
                                onForgotPassword: _onForgotPasswordPressed,
                                onSignUp: _navigateToRegister,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.onLogin,
    required this.onGoogle,
    required this.onForgotPassword,
    required this.onSignUp,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final Future<void> Function() onLogin;
  final Future<void> Function() onGoogle;
  final Future<void> Function() onForgotPassword;
  final VoidCallback onSignUp;

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF2E7D32);
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 24, 20, 24 + bottomInset),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 16,
            offset: Offset(0, -8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Sign In',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xFF1B5E20),
              fontSize: 20,
              fontFamily: 'sans-serif',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "EMAIL",
            style: TextStyle(
              color: Color(0xFF888888),
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.08,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            enabled: !isLoading,
            decoration: InputDecoration(
              hintText: 'your@email.com',
              filled: true,
              fillColor: const Color(0x1A43A047),
              prefixIcon: const Icon(Icons.email_outlined),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0x1A43A047)),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0x2A43A047)),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFF2E7D32),
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "PASSWORD",
            style: TextStyle(
              color: Color(0xFF888888),
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.08,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: passwordController,
            obscureText: true,
            enabled: !isLoading,
            decoration: InputDecoration(
              hintText: '••••••••',
              filled: true,
              fillColor: const Color(0x1A43A047),
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: const Icon(Icons.visibility),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0x1A43A047)),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0x1A43A047)),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFF2E7D32),
                  width: 2,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: isLoading ? null : onForgotPassword,
              child: const Text(
                'Forgot password?',
                style: TextStyle(
                  color: Color(0xFF43A047),
                  fontSize: 12,
                  fontFamily: 'sans-serif',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: isLoading ? null : onLogin,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0, 52),
              backgroundColor: Color(0xFF43A047),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 15, fontFamily: 'sans-serif-medium'),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(child: Divider(thickness: 1, color: Color(0xFFE0E0E0))),
              Padding(
                padding: EdgeInsetsGeometry.fromLTRB(10, 0, 10, 0),
                child: Text(
                  "or continue with",
                  style: TextStyle(fontSize: 11, color: Color(0xFFAAAAAA)),
                ),
              ),
              Expanded(child: Divider(thickness: 1, color: Color(0xFFE0E0E0))),
            ],
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: isLoading ? null : onGoogle,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(0, 50),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              side: const BorderSide(color: Color(0xFFE0E0E0)),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/google.png',
                  width: 20,
                  height: 20,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.g_mobiledata,
                    size: 20,
                    color: Color(0xFF4285F4),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Google',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'sans-serif',
                    color: Color(0xFF444444),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (isLoading)
            const Center(child: CircularProgressIndicator(color: primaryGreen))
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 13, color: Color(0xFF999999)),
                ),
                TextButton(
                  onPressed: onSignUp,
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF43A047),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
