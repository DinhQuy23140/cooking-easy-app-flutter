
class User {
  String uid;
  String? avatarUrl;
  String email;
  String fcmToken;
  List<String> fcm_tokens;
  String? fullName;
  String? isOnline;
  String lastActiveAt;
  String createdAt;

  User({required this.uid, required this.avatarUrl, required this.email, required this.fcmToken, required this.fcm_tokens,
    required this.fullName, required this.isOnline, required this.lastActiveAt, required this.createdAt});


}