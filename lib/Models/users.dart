import 'package:blingo2/Models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String username;
  String id;
  String email;
  String? photoUrl;
  String? displayName;
  String? bio;
  List<Post>? post;
  List<UserModel>? followers;
  List<UserModel>? following;
  UserModel(
      {required this.username,
      this.followers,
      this.following,
      required this.id,
      required this.email,
      this.displayName,
      this.post,
      this.photoUrl,
      this.bio});

  Map toMap(UserModel user) {
    var data = <String, dynamic>{};
    data['id'] = user.id;
    data['email'] = user.email;
    data['photoUrl'] = user.photoUrl;
    data['displayName'] = user.displayName;
    data['followers'] = user.followers;
    data['following'] = user.following;
    data['bio'] = user.bio;
    data['post'] = user.post;
    return data;
  }

  fromMap(Map<String, dynamic>? mapData) {
    id = mapData!['id'];
    email = mapData['email'];
    photoUrl = mapData['photoUrl'];
    displayName = mapData['displayName'];
    followers = mapData['followers'];
    following = mapData['following'];
    bio = mapData['bio'];
    post = mapData['post'];
  }
  // factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   return UserModel(
  //     id: snapshot.id,
  //     email: snapshot.get('email'),
  //     photoUrl: snapshot.get('photoUrl'),
  //     displayName: snapshot.get('displayName'),
  //     followers: snapshot.get('followers'),
  //     bio: snapshot.get('bio'),
  //     post: snapshot.get('post'),
  //     following: snapshot.get('following'),
  //     username: snapshot.get('username'),
  //   );
  // }
  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'email': email,
  //       'photoUrl': photoUrl,
  //       'displayName': displayName,
  //       'followers': followers,
  //       'bio': bio,
  //       'post': post,
  //       'following': following,
  //       'username': username,
  //     };
}
