import 'package:flutter/material.dart';

import '../data/repositories/mock_auth_repository.dart';
import '../domain/repositories/auth_repository.dart';

class AuthApp extends StatefulWidget {
  const AuthApp({super.key});

  @override
  State<AuthApp> createState() => _AuthAppState();
}

class _AuthAppState extends State<AuthApp> {
  final AuthRepository _repository = MockAuthRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking Easy - Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: SplashScreen(repository: _repository),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.repository});

  final AuthRepository repository;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final user = await widget.repository.getCurrentUser();
    if (!mounted) return;

    if (user == null) {
      _go(LoginScreen(repository: widget.repository));
      return;
    }

    if (user.isNewUser) {
      _go(const EnterNamePlaceholderScreen());
      return;
    }

    _go(const MainPlaceholderScreen());
  }

  void _go(Widget next) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute<void>(builder: (_) => next));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.repository});

  final AuthRepository repository;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (!_validateEmail(email) || !_validatePassword(password)) return;

    setState(() => _loading = true);
    try {
      final user = await widget.repository.login(email: email, password: password);
      if (!mounted) return;
      _go(user.isNewUser ? const EnterNamePlaceholderScreen() : const MainPlaceholderScreen());
    } catch (e) {
      _showMessage(e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _loginWithGoogle() async {
    setState(() => _loading = true);
    try {
      final user = await widget.repository.loginWithGoogle();
      if (!mounted) return;
      _go(user.isNewUser ? const EnterNamePlaceholderScreen() : const MainPlaceholderScreen());
    } catch (e) {
      _showMessage(e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _resetPassword() async {
    try {
      await widget.repository.resetPassword(_emailController.text.trim());
      if (!mounted) return;
      _showMessage('Reset link sent! Please check your email.');
    } catch (e) {
      _showMessage(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  bool _validateEmail(String email) {
    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (email.isEmpty) {
      _showMessage('Email is required');
      return false;
    }
    if (!regex.hasMatch(email)) {
      _showMessage('Invalid email format');
      return false;
    }
    return true;
  }

  bool _validatePassword(String password) {
    if (password.isEmpty) {
      _showMessage('Password is required');
      return false;
    }
    if (password.length < 6) {
      _showMessage('Password must be at least 6 characters');
      return false;
    }
    return true;
  }

  void _go(Widget next) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute<void>(builder: (_) => next));
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF2E7D32),
                      Color(0xFF43A047),
                      Color(0xFF66BB6A),
                    ]
                )
            ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Login"),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _loading ? null : _login,
                  child: const Text('Login'),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: _loading ? null : _loginWithGoogle,
                  child: const Text('Continue with Google'),
                ),
                TextButton(
                  onPressed: _loading ? null : _resetPassword,
                  child: const Text('Forgot password?'),
                ),
                const Spacer(),
                TextButton(
                  onPressed: _loading
                      ? null
                      : () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) =>
                                  RegisterScreen(repository: widget.repository),
                            ),
                          );
                        },
                  child: const Text('Create account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.repository});

  final AuthRepository repository;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirm = _confirmController.text;

    if (!_validate(email: email, password: password, confirmPassword: confirm)) {
      return;
    }

    setState(() => _loading = true);
    try {
      await widget.repository.register(email: email, password: password);
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const EnterNamePlaceholderScreen()),
      );
    } catch (e) {
      _showMessage(e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _registerGoogle() async {
    setState(() => _loading = true);
    try {
      await widget.repository.loginWithGoogle();
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const EnterNamePlaceholderScreen()),
      );
    } catch (e) {
      _showMessage(e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  bool _validate({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (email.isEmpty) {
      _showMessage('Email is required');
      return false;
    }
    if (!regex.hasMatch(email)) {
      _showMessage('Invalid email format');
      return false;
    }
    if (password.isEmpty) {
      _showMessage('Password is required');
      return false;
    }
    if (password.length < 6) {
      _showMessage('Password must be at least 6 characters');
      return false;
    }
    if (confirmPassword.isEmpty) {
      _showMessage('Please confirm your password');
      return false;
    }
    if (password != confirmPassword) {
      _showMessage('Passwords do not match');
      return false;
    }

    return true;
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _confirmController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _register,
              child: const Text('Register'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: _loading ? null : _registerGoogle,
              child: const Text('Sign up with Google'),
            ),
            const Spacer(),
            TextButton(
              onPressed: _loading
                  ? null
                  : () => Navigator.of(context).pop(),
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class EnterNamePlaceholderScreen extends StatelessWidget {
  const EnterNamePlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Name')),
      body: const Center(child: Text('TODO: EnterName screen')),
    );
  }
}

class MainPlaceholderScreen extends StatelessWidget {
  const MainPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main')),
      body: const Center(child: Text('TODO: Main screen')),
    );
  }
}
