import 'package:cooking_easy/features/auth/domain/entities/auth_user.dart';
import 'package:cooking_easy/features/auth/domain/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  AuthUser? _currentUser;

  @override
  Future<AuthUser?> getCurrentUser() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _currentUser;
  }

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    _currentUser = AuthUser(
      id: 'user-${email.hashCode}',
      email: email.trim(),
      isNewUser: false,
    );
    return _currentUser!;
  }

  @override
  Future<AuthUser> loginWithGoogle() async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    _currentUser = const AuthUser(
      id: 'google-user',
      email: 'google-user@example.com',
      isNewUser: true,
    );
    return _currentUser!;
  }

  @override
  Future<AuthUser> register({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    _currentUser = AuthUser(
      id: 'user-${email.hashCode}',
      email: email.trim(),
      isNewUser: true,
    );
    return _currentUser!;
  }

  @override
  Future<void> resetPassword(String email) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (email.trim().isEmpty) {
      throw Exception('Please enter your email');
    }
  }
}
