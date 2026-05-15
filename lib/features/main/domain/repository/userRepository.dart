
import 'package:cooking_easy/features/main/domain/model/user.dart';
import 'package:cooking_easy/features/main/presentation/state/api_state.dart';

import '../model/historySearch.dart';

abstract class UserRepository {

  Future<void> saveUserProfile({required String uid, required String fullname, required String nickName, required String email});
  Future<User> getUserProfile({required String uid});
  Future<void> updateUserName({required String uid, required String fullname, required nickname});
  Future<void> updateAvatar({required String uid, required String avatarUrl});
  Future<void> updateEmail({required String uid, required String email});
  Future<bool> isProfileComplete({required String uid});
  Future<void> updateImgProfile({required String uid, required String strImg});
  Future<String> getImgUrl({required String uid});
  Future<void> saveSearch({required String uid, required String keyword});
  Future<List<Historysearch>> getListHistorySearch({required String uid});
  Future<void> deleteHistorySearch({required String uid, required String docID});
  Future<void> clearHistorySearch({required String uid});
  Future<void> followUser({required String uid, required String followId});
  Future<void> unFollow({required String uid, required String followId});
  Future<bool> isFollowing({required String uid, required String followId});
  Future<(int, int)> getFollowStats({required String uid});
  Future<String> getCurrentUserUUID();
}