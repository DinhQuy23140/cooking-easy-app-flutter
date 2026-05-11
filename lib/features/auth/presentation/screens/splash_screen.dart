import 'package:flutter/material.dart';

import '../../domain/repositories/auth_repository.dart';
import '../navigation/auth_navigator.dart';
import '../state/splash_state.dart';
import '../viewmodels/splash_view_model.dart';

/// Flutter port of `SplashActivity.kt`.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.repository});

  final AuthRepository repository;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SplashViewModel(widget.repository);
    _viewModel.state.addListener(_onStateChanged);
    _viewModel.checkLoginStatus();
  }

  @override
  void dispose() {
    _viewModel.state.removeListener(_onStateChanged);
    _viewModel.dispose();
    super.dispose();
  }

  void _onStateChanged() {
    final state = _viewModel.state.value;
    if (!mounted) return;

    switch (state) {
      case SplashIdle():
      case SplashLoading():
        break;
      case SplashNavigateToLogin():
        AuthNavigator.openLogin(
          context,
          repository: widget.repository,
          clearTask: true,
          finishCurrent: true,
        );
      case SplashNavigateToEnterName():
        AuthNavigator.openEnterName(
          context,
          clearTask: true,
          finishCurrent: true,
        );
      case SplashNavigateToMain():
        AuthNavigator.openMain(
          context,
          clearTask: true,
          finishCurrent: true,
        );
    }
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
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0x1AFFFFFF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  border: Border.all(
                    color: Color(0x2AFFFFFF),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('assets/images/logo.png', width: 40, height: 40,)),
                ),
              ),
              const SizedBox(height: 24),
              Text('Cooking', style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w500,
              ),),
              Text('EASY',
                style: TextStyle(
                  color: Color(0xCCFFFFFF),
                  fontSize: 18,
                  fontFamily: 'sans-serif',
                  letterSpacing: 3.5,
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: 90,
                child: const Row(
                  children: [
                    Expanded(child: Divider(
                      thickness: 1,
                      color: Color(0x33FFFFFF),
                    )),
                    Text("."),
                    Expanded(child: Divider(
                      thickness: 1,
                      color: Color(0x33FFFFFF),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
