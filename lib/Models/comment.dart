// ignore_for_file: unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String ownerName;
  String? ownerPhotoUrl;
  String comment;
  FieldValue timeStamp;
  String ownerUid;

  Comment(
      {required this.ownerName,
      this.ownerPhotoUrl,
      required this.comment,
      required this.timeStamp,
      required this.ownerUid});

  Map toMap(Comment comment) {
    var data = Map<String, dynamic>();
    data['ownerName'] = comment.ownerName;
    data['ownerPhotoUrl'] = comment.ownerPhotoUrl;
    data['comment'] = comment.comment;
    data['timestamp'] = comment.timeStamp;
    data['ownerUid'] = comment.ownerUid;
    return data;
  }

  fromMap(Map<String, dynamic> mapData) {
    ownerName = mapData['ownerName'];
    ownerPhotoUrl = mapData['ownerPhotoUrl'];
    comment = mapData['comment'];
    timeStamp = mapData['timestamp'];
    ownerUid = mapData['ownerUid'];
  }
}
