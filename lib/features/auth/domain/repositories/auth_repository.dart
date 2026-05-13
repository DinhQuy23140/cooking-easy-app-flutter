import 'package:cooking_easy/features/auth/domain/entities/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser?> getCurrentUser();

  Future<AuthUser> login({required String email, required String password});

  Future<AuthUser> loginWithGoogle();

  Future<AuthUser> register({required String email, required String password});

  Future<void> resetPassword(String email);
}
