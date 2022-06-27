import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String senderUid;
  String receiverUid;
  String type;
  String message;
  FieldValue timestamp;
  String? photoUrl;

  Message(
      {required this.senderUid,
      required this.receiverUid,
      required this.type,
      required this.message,
      required this.timestamp});
  Message.withoutMessage(
      {required this.senderUid,
      required this.receiverUid,
      required this.type,
      required this.message,
      required this.timestamp,
      this.photoUrl});

  Map toMap() {
    var map = <String, dynamic>{};
    map['senderUid'] = senderUid;
    map['receiverUid'] = receiverUid;
    map['type'] = type;
    map['message'] = message;
    map['timestamp'] = timestamp;
    return map;
  }

  Message fromMap(Map<String, dynamic> map) {
    Message _message = Message(
      senderUid: map['senderUid'],
      receiverUid: map['receiverUid'],
      type: map['type'],
      message: map['message'],
      timestamp: map['timestamp'],
    );
    return _message;
  }
}
