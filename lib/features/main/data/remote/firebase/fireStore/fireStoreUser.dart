import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_easy/features/main/domain/model/historySearch.dart';
import 'package:cooking_easy/features/main/domain/model/user.dart';

import '../../../../extension/documentSnapshotExt.dart';

class FireStoreUser {
  final FirebaseFirestore firebaseFirestore;
  final CollectionReference<Map<String, dynamic>> userCollection;
  FireStoreUser({required this.firebaseFirestore}): userCollection = firebaseFirestore.collection('users');

  DocumentReference<Map<String, dynamic>> _userDoc({required String uid}) {
    return userCollection.doc(uid);
  }

  Future<void> saveUser({
    required Map<String, dynamic> data,
    required String uid,
  }) async {
    await _userDoc(uid: uid).set(data);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser({required String uid}) async {
    return await _userDoc(uid: uid).get();
  }

  Future<User> getUserProfile({required String uid}) async {
    final doc = await getUser(uid: uid);
    if (!doc.exists) {
      throw StateError('User profile not found');
    }
    return doc.toUser(uid);
  }

  Future<void> updateUserName({
    required String fullName,
    required String nickName,
    required String uid,
  }) async {
    await _userDoc(uid: uid).update({
      'fullName': fullName,
      'nickName': nickName,
    });
  }

  Future<void> updateAvatar({
    required String uid,
    required String avatarUrl,
  }) async {
    await _userDoc(uid: uid).update({'avatarUrl': avatarUrl});
  }

  Future<void> updateEmail({
    required String uid,
    required String email,
  }) async {
    await _userDoc(uid: uid).update({'email': email});
  }

  Future<bool> isProfileComplete({required String uid}) async {
    DocumentSnapshot doc = await getUser(uid: uid);
    String fullName = doc.get("fullName") != null ? doc.get("fullName") : "";
    return fullName.isNotEmpty;
  }

  Future<void> updateImgProfile({
    required String uid,
    required String imgBase,
  }) async {
    await _userDoc(uid: uid).update({'avatarUrl': imgBase});
  }

  Future<String> getImgProfile({required String uid}) async {
    DocumentSnapshot doc = await _userDoc(uid: uid).get();
    return doc.get("avatarUrl");
  }

  Future<void> saveHistorySearch({
    required String uid,
    required String keyword,
  }) async {
    await _userDoc(uid: uid).collection("search_history").add({
      'keyword': keyword,
    });
  }

  String normalizeKeyword(String input) {
    return input
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll(' ', '_');
  }

  Future<List<Historysearch>> getListHistorySearch({required String uid}) async {
    QuerySnapshot querySnapshot = await _userDoc(uid: uid).collection("search_history").get();
    return querySnapshot.docs.map((doc) => (doc as QueryDocumentSnapshot<Map<String, dynamic>>).toHistorySearch(uid)).toList();
  }

  Future<void> deleteHistorySearch({required String uid, required String docId}) async{
    await _userDoc(uid: uid).collection("search_history").doc(docId).delete();
  }

  Future<void> clearHistorySearch({required String uid}) async {
    QuerySnapshot snapshot =  await _userDoc(uid: uid).collection("search_history").get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  Future<void> followUser({required String uid, required String followUid}) async {
    await _userDoc(uid: uid).collection("following").doc(followUid).set({
      "uid": followUid,
      "createdAt": DateTime.now(),
    });
    await _userDoc(uid: followUid).collection("followers").doc(uid).set({
      "uid": uid,
      "createdAt": DateTime.now(),
    });
  }

  Future<void> unFollow({required String uid, required String followId}) async{
    await _userDoc(uid: uid).collection("following").doc(followId).delete();
    await _userDoc(uid: followId).collection("followers").doc(uid).delete();
  }

  Future<bool> isFollowing({required String uid, required String followId}) async{
    final doc = await _userDoc(uid: uid).collection("following").doc(followId).get();
    return doc.exists;
  }

  Future<(int, int)> getFollowStats({required String uid}) async{
    final following = await _userDoc(uid: uid).collection("following").get();
    final followers = await _userDoc(uid: uid).collection("followers").get();
    return (following.docs.length, followers.docs.length);
  }

}
