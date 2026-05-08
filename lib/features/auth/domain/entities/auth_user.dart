class AuthUser {
  const AuthUser({
    required this.id,
    required this.email,
    required this.isNewUser,
  });

  final String id;
  final String email;
  final bool isNewUser;
}
