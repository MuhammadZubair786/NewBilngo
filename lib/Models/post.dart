import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String currentUserUid;
  String vidUrl;
  String description;
  String location;
  FieldValue time;
  String postOwnerName;
  String? postOwnerPhotoUrl;

  Post(
      {required this.currentUserUid,
      required this.vidUrl,
      required this.description,
      required this.location,
      required this.time,
      required this.postOwnerName,
      this.postOwnerPhotoUrl});

  Map toMap(Post post) {
    var data = Map<String, dynamic>();
    data['ownerUid'] = post.currentUserUid;
    data['vidUrl'] = post.vidUrl;
    data['description'] = post.description;
    data['location'] = post.location;
    data['time'] = post.time;
    data['postOwnerName'] = post.postOwnerName;
    data['postOwnerPhotoUrl'] = post.postOwnerPhotoUrl;
    return data;
  }

  fromMap(Map<String, dynamic> mapData) {
    currentUserUid = mapData['ownerUid'];
    vidUrl = mapData['vidUrl'];
    description = mapData['description'];
    location = mapData['location'];
    time = mapData['time'];
    postOwnerName = mapData['postOwnerName'];
    postOwnerPhotoUrl = mapData['postOwnerPhotoUrl'];
  }
}
