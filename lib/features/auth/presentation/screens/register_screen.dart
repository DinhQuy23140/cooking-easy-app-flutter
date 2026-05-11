import 'package:flutter/material.dart';

import '../../domain/repositories/auth_repository.dart';
import '../navigation/auth_navigator.dart';
import '../state/register_state.dart';
import '../viewmodels/register_view_model.dart';

/// Flutter port of `RegisterActivity.kt`.
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.repository});

  final AuthRepository repository;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegisterViewModel _viewModel;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = RegisterViewModel(widget.repository);
    _viewModel.registerState.addListener(_onRegisterStateChanged);
  }

  @override
  void dispose() {
    _viewModel.registerState.removeListener(_onRegisterStateChanged);
    _viewModel.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _onRegisterStateChanged() {
    if (!mounted) return;
    final state = _viewModel.registerState.value;

    switch (state) {
      case RegisterIdle():
      case RegisterLoading():
        break;
      case RegisterSuccess():
        _navigateToEnterName();
      case RegisterError(:final message):
        _showError(message);
        _viewModel.resetState();
    }
  }

  Future<void> _onRegisterPressed() {
    return _viewModel.register(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      confirmPassword: _confirmController.text,
    );
  }

  Future<void> _onGoogleSignUpPressed() {
    return _viewModel.registerWithGoogle();
  }

  void _navigateToEnterName() {
    AuthNavigator.openEnterName(
      context,
      clearTask: true,
      finishCurrent: true,
    );
  }

  void _navigateToLogin() {
    AuthNavigator.openLogin(
      context,
      repository: widget.repository,
      finishCurrent: true,
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF66BB6A),
              Color(0xFF43A047),
              Color(0xFF2E7D32),
            ]
          )
        ),
        child: SafeArea(
          bottom: false,
          child: ListenableBuilder(
            listenable: _viewModel.registerState,
            builder: (context, _) {
              final isLoading =
                  _viewModel.registerState.value is RegisterLoading;
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
                            const SizedBox(height: 44),
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset('assets/images/logo.png',
                                      width: 40,
                                      height: 40,
                                    )
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text('Create account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'sans-serif'
                                )
                            ),
                            const Text("Start your cooking jouney",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0x99FFFFFF),
                                fontSize: 13,
                                fontFamily: 'sans-serif'
                              ),
                            ),
                            const SizedBox(height: 24,),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(28),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x1A000000),
                                      blurRadius: 16,
                                      offset: Offset(0, -8)
                                    )
                                  ]
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 5,),
                                    Text("Sign up",
                                      style: TextStyle(
                                        color: Color(0xFF1B5E20),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'sans-serif'
                                      ),
                                    ),
                                    const SizedBox(height: 18,),
                                    const Text("EMAIL",
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'sans-serif'
                                      )
                                    ),
                                    const SizedBox(height: 6,),
                                    TextField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      enabled: !isLoading,
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        filled: true,
                                        fillColor: Color(0x1A43A047),
                                        prefixIcon: Icon(Icons.email_outlined),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: Color(0x1A43A047),
                                            width: 1
                                          )
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: Color(0x2A43A047),
                                            width: 1
                                          )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: Color(0xFF2E7D32),
                                            width: 2
                                          )
                                        )
                                      ),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    const Text("PASSWORD",
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'sans-serif'
                                      ),
                                    ),
                                    const SizedBox(height: 6,),
                                    TextField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      enabled: !isLoading,
                                      decoration: const InputDecoration(
                                        hintText: 'Password',
                                        filled: true,
                                        prefixIcon: Icon(Icons.lock_outlined),
                                        suffixIcon: Icon(Icons.visibility_off_outlined),
                                        fillColor: Color(0x1A43A047),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12)
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0x2A43A047),
                                            width: 1
                                          )
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12)
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0x2A43A047),
                                            width: 1
                                          )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12)
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0xFF2E7D32),
                                            width: 2
                                          )
                                        )
                                      ),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    const Text("CONFIRM PASSWORD",
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'sans-serif'
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    TextField(
                                      controller: _confirmController,
                                      obscureText: true,
                                      enabled: !isLoading,
                                      decoration: const InputDecoration(
                                        hintText: 'Confirm password',
                                        filled: true,
                                        fillColor: Color(0x1A43A047),
                                        prefixIcon: Icon(Icons.lock_outlined),
                                        suffixIcon: Icon(Icons.visibility_off_outlined),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12)
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0x2A43A047),
                                            width: 1,
                                          )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12)
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0xFF2E7D32),
                                            width: 2
                                          )
                                        )
                                      ),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF43A047),
                                        minimumSize: const Size(0, 52),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)
                                        )
                                      ),
                                      onPressed: isLoading ? null : _onRegisterPressed,
                                      child: const Text('Sign up'),
                                    ),
                                    const SizedBox(height: 18),
                                    const Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: Color(0xFFE0E0E0),
                                            thickness: 1,
                                          )
                                        ),
                                        SizedBox(width: 10),
                                        const Text("or sign up with",
                                          style: TextStyle(
                                            color: Color(0xFFAAAAAA),
                                            fontSize: 11,
                                            fontFamily: 'sans-serif'
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(child: Divider(
                                          thickness: 1,
                                          color: Color(0xFFE0E0E0),
                                        ))
                                      ],
                                    ),
                                    const SizedBox(height: 14),
                                    OutlinedButton(
                                      onPressed: isLoading ? null : _onGoogleSignUpPressed,
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: const Size(0, 52),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        side: const BorderSide(
                                          color: Color(0xFFE0E0E0),
                                          width: 2
                                        )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/google.png', width: 20, height: 20,),
                                          const SizedBox(width: 10),
                                          const Text('Google'),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: isLoading ? null : _navigateToLogin,
                                          child: const Text('Already have an account?',
                                            style: TextStyle(
                                              color: Color(0xFF999999),
                                              fontSize: 13
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: isLoading ? null: _navigateToLogin,
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            minimumSize: Size.zero,
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                          ),
                                          child: Text('Sign in',
                                            style: TextStyle(
                                              color: Color(0xFF43A047)
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              );
            },
          ),
        ),
      ),
    );
  }
}
