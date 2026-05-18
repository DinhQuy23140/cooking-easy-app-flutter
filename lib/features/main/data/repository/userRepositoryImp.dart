import 'package:cooking_easy/features/main/domain/model/historySearch.dart';
import 'package:cooking_easy/features/main/domain/model/user.dart';
import 'package:cooking_easy/features/main/domain/repository/userRepository.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

import '../remote/firebase/fireStore/fireStoreUser.dart';

class Userrepositoryimp extends UserRepository{
  final FireStoreUser fireStoreUser;
  final FirebaseAuth firebaseAuth;
  Userrepositoryimp({required this.fireStoreUser, required this.firebaseAuth});
  @override
  Future<void> clearHistorySearch({required String uid}) async{
    try{
      await fireStoreUser.clearHistorySearch(uid: uid);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteHistorySearch({required String uid, required String docID}) async{
    try {
      await fireStoreUser.deleteHistorySearch(uid: uid, docId: docID);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> followUser({required String uid, required String followId}) async{
    try {
      await fireStoreUser.followUser(uid: uid, followUid: followId);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<(int, int)> getFollowStats({required String uid}) async{
    try {
      return await fireStoreUser.getFollowStats(uid: uid);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> getImgUrl({required String uid}) async{
    try {
      return await fireStoreUser.getImgProfile(uid: uid);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Historysearch>> getListHistorySearch({required String uid}) async{
    try {
      return await fireStoreUser.getListHistorySearch(uid: uid);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<User> getUserProfile({required String uid}) async{
    try {
       final User user = await fireStoreUser.getUserProfile(uid: uid);
       return user;
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> isFollowing({required String uid, required String followId}) async{
    try {
      return await fireStoreUser.isFollowing(uid: uid, followId: followId);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> isProfileComplete({required String uid}) async{
    try {
      return await fireStoreUser.isProfileComplete(uid: uid);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> saveSearch({required String uid, required String keyword}) async{
    try {
      await fireStoreUser.saveHistorySearch(uid: uid, keyword: keyword);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> saveUserProfile({required String uid, required String fullname, required String nickName, required String email}) async{
    try {
      Map<String, dynamic> data = Map();
      data['uid'] = uid;
      data['fullName'] = fullname;
      data['nickName'] = nickName;
      data['email'] = email;
      await fireStoreUser.saveUser(uid: uid, data: data);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> unFollow({required String uid, required String followId}) async{
    try {
      await fireStoreUser.unFollow(uid: uid, followId: followId);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateAvatar({required String uid, required String avatarUrl}) async{
    try {
      await fireStoreUser.updateAvatar(uid: uid, avatarUrl: avatarUrl);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateEmail({required String uid, required String email}) async{
    try {
      await fireStoreUser.updateEmail(uid: uid, email: email);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateImgProfile({required String uid, required String strImg}) async{
    try {
      await fireStoreUser.updateImgProfile(uid: uid, imgBase: strImg);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateUserName({required String uid, required String fullname, required nickname}) async{
    try {
      await fireStoreUser.updateUserName(uid: uid, fullName: fullname, nickName: nickname);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> getCurrentUserUUID() async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      throw StateError('Not signed in');
    }
    return user.uid;
  }

  @override
  Future<void> logout() async{
    try {
      await firebaseAuth.signOut();
    } catch(e) {
      throw Exception(e);
    }
  }




}