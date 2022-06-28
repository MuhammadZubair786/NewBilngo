// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:video_editor_sdk/video_editor_sdk.dart';


// class VideosAPI {
//   List<Video> listVideos = <Video>[];

//   VideosAPI() {
//     load();
//   }

//   void load() async {
//     listVideos = await getVideoList();
//   }

//   Future<List<Video>> getVideoList() async {
//     var  db =await FirebaseDatabase.instance.ref("Videos").child(FirebaseAuth.instance.currentUser!.uid)
//     .once().then(( snapshot){
//     print(snapshot.snapshot.value);
//     var db1 = snapshot.snapshot.value as Map;

//     var videoList = <Video>[];
//     var videos;

    
  
  

//     videos.docs.forEach((element) {
//       Video video = Video.fromJson(element.data());
//       videoList.add(video);
//     });

//     return videoList;
//   }

//   Future<Null> addDemoData() async {
//     for (var video in data) {
//       await FirebaseFirestore.instance.collection("Videos").add(video);
//     }
//   }
// }