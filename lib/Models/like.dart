import 'package:cloud_firestore/cloud_firestore.dart';

class Like {
  String ownerName;
  String? ownerPhotoUrl;
  String ownerUid;
  FieldValue timeStamp;

  Like(
      {required this.ownerName,
      this.ownerPhotoUrl,
      required this.ownerUid,
      required this.timeStamp});

  Map toMap(Like like) {
    var data = Map<String, dynamic>();
    data['ownerName'] = like.ownerName;
    data['ownerPhotoUrl'] = like.ownerPhotoUrl;
    data['ownerUid'] = like.ownerUid;
    data['timestamp'] = like.timeStamp.toString();
    return data;
  }

  fromMap(Map<String, dynamic> mapData) {
    ownerName = mapData['ownerName'];
    ownerPhotoUrl = mapData['ownerPhotoUrl'];
    ownerUid = mapData['ownerUid'];
    timeStamp = mapData['timestamp'];
  }
}
