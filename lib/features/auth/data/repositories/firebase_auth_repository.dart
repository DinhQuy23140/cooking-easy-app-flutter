import 'package:cooking_easy/features/auth/domain/entities/auth_user.dart';
import 'package:cooking_easy/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({FirebaseAuth? firebaseAuth})
    : _auth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _auth;

  AuthUser _toAuthUser(User user, {required bool isNewUser}) {
    return AuthUser(
      id: user.uid,
      email: user.email?.trim() ?? '',
      isNewUser: isNewUser,
    );
  }

  @override
  Future<AuthUser?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) {
      return null;
    }
    return _toAuthUser(user, isNewUser: false);
  }

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    final user = cred.user;
    if (user == null) {
      throw Exception('Login failed');
    }
    return _toAuthUser(user, isNewUser: false);
  }

  @override
  Future<AuthUser> loginWithGoogle() async {
    try {
      final account = await GoogleSignIn.instance.authenticate();
      final auth = account.authentication;
      final idToken = auth.idToken;
      if (idToken == null) {
        throw Exception(
          'Missing Google ID token. In Firebase Console, add SHA-1 for Android '
          'and enable Google sign-in; for Android you may need Web client ID in '
          'GoogleSignIn.instance.initialize(serverClientId: ...).',
        );
      }
      final credential = GoogleAuthProvider.credential(idToken: idToken);
      final userCred = await _auth.signInWithCredential(credential);
      final user = userCred.user;
      if (user == null) {
        throw Exception('Google sign-in failed');
      }
      final isNew = userCred.additionalUserInfo?.isNewUser ?? false;
      return _toAuthUser(user, isNewUser: isNew);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw Exception('Google sign-in was cancelled');
      }
      rethrow;
    }
  }

  @override
  Future<AuthUser> register({
    required String email,
    required String password,
  }) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    final user = cred.user;
    if (user == null) {
      throw Exception('Registration failed');
    }
    return _toAuthUser(user, isNewUser: true);
  }

  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email.trim());
  }

  @override
  Future<void> deleteAccount() async{
    await _auth.currentUser?.delete();
  }

  @override
  bool get isLogin => _auth.currentUser != null;

  @override
  Future<void> signOut() async {
    _auth.signOut();
  }

  @override
  Future<void> udpateEmail({required String email}) async{
    await _auth.currentUser?.verifyBeforeUpdateEmail( email.trim());
  }

  @override
  Future<void> updatePassword({required String password}) async{
    await _auth.currentUser?.updatePassword(password);
  }
}
