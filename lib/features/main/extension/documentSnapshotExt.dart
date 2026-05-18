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
      avatarUrl: _optionalString(json['avatarUrl']),
      email: _stringField(json['email']),
      fcmToken: _stringField(json['fcmToken']),
      fcm_tokens: _stringListFrom(json['fcm_tokens']),
      fullName: _optionalString(json['fullName']),
      isOnline: _optionalString(json['isOnline']),
      lastActiveAt: _firestoreDateString(json['lastActiveAt']),
      createdAt: _firestoreDateString(json['createdAt']),
    );
  }

  List<String> _stringListFrom(dynamic value) {
    if (value is List) {
      return value.map((e) => e.toString()).toList();
    }
    return [];
  }

  String _stringField(dynamic value) {
    if (value == null) return '';
    return value.toString();
  }

  String? _optionalString(dynamic value) {
    if (value == null) return null;
    final text = value.toString();
    return text.isEmpty ? null : text;
  }

  String _firestoreDateString(dynamic value) {
    if (value == null) return '';
    if (value is Timestamp) {
      return DateFormat('HH:mm dd/MM/yyyy').format(value.toDate());
    }
    if (value is int) {
      return DateFormat('HH:mm dd/MM/yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(value),
      );
    }
    if (value is num) {
      return DateFormat('HH:mm dd/MM/yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(value.toInt()),
      );
    }
    return value.toString();
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
