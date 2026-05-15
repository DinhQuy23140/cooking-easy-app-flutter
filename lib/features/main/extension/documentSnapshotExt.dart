import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_easy/features/main/domain/model/historySearch.dart';
import 'package:cooking_easy/features/main/domain/model/user.dart';
import 'package:intl/intl.dart';

extension DocumentSnapshotExt on DocumentSnapshot<Map<String, dynamic>> {
  Historysearch toHistorySearch(String userId) {
    final json = data() ?? {};

    return Historysearch(
      id: id,

      userId: userId,

      keyword: json['keyword'] ?? '',

      timeStamp: formatHistoryTime(this),
    );
  }

  User toUser(String userId) {
    final json = data() ?? {};
    return User(
      uid: userId,
      avatarUrl: json['avatarUrl'] ?? '',
      email: json['email'] ?? '',
      fcmToken: json['fcmToken'] ?? '',
      fcm_tokens: _stringListFrom(json['fcm_tokens']),
      fullName: json['fullName'] ?? '',
      isOnline: json['isOnline'] ?? '',
      lastActiveAt: json['lastActiveAt'] ?? '',
      createdAt: json['createdAt'] ?? '',
    );
  }

  List<String> _stringListFrom(dynamic value) {
    if (value is List) {
      return value.map((e) => e.toString()).toList();
    }
    return [];
  }
}

String formatHistoryTime(DocumentSnapshot<Map<String, dynamic>> doc) {
  final value = doc.data()?['timestamp'];
  int? ms;
  if (value == null) {
    return '';
  } else if (value is int) {
    ms = value;
  } else if (value is num) {
    ms = value.toInt();
  } else if (value is Timestamp) {
    ms = value
        .toDate()
        .millisecondsSinceEpoch;
  } else {
    return '';
  }

  return DateFormat(
    'HH:mm dd/MM/yyyy',
  ).format(DateTime.fromMillisecondsSinceEpoch(ms));
}
