import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class UploadVideo extends StatefulWidget {
  const UploadVideo({Key? key}) : super(key: key);

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  var imagepath;
  var upvideo = 0;
  var imageNameget;

  void imageupload() async {
    final pickedFile =
        await ImagePicker.platform.pickVideo(source: ImageSource.gallery);

    File _imageFile = File(pickedFile!.path);
    print(_imageFile);

    FirebaseStorage storage = FirebaseStorage.instance;

    String url;

    try {
      String ImageName = path.basename(_imageFile.toString());
      Reference ref = storage.ref().child("videos/${ImageName}");
      UploadTask uploadTask = ref.putFile(_imageFile);
      uploadTask.snapshotEvents.listen((event) {
        // setState(() {
        var progress =
            ((event.bytesTransferred.toDouble() / event.totalBytes.toDouble()) *
                    100)
                .roundToDouble();

        print(progress);
        // });
      });

      final snapshot = await uploadTask.whenComplete(() {});
      var download = await snapshot.ref.getDownloadURL();

      print('Download-Link: $download');
      setState(() {
        upvideo = 1;
        imagepath = download;
        imageNameget = ImageName;
      });
    } catch (err) {
      print(err);
    }
  }

  void updateData() async {
    print("call");
    // String ImageName = path.basename(_imageFile.toString());

    // print(imagepath);
    // print(imageNameget);
    // print(Fire)


     DatabaseReference db = FirebaseDatabase.instance.reference().child("Videos");


     db.child(FirebaseAuth.instance.currentUser!.uid).child(imageNameget.toString().substring(0,imageNameget.toString().length-5)).set({
       "Video_Link":imagepath,
      "User_Uid":FirebaseAuth.instance.currentUser!.uid,
      "Video_Name":imageNameget,
      "User_Photo":FirebaseAuth.instance.currentUser!.photoURL,
      "User_Name":FirebaseAuth.instance.currentUser!.displayName

     }); 




    // await FirebaseFirestore.instance
    //     .collection('Videos')
    //     .doc("${FirebaseAuth.instance.currentUser!.uid}")
    //     .collection("${imageNameget}")
    //     .doc()
        
    //     .set({
    //   "Video_Link": imagepath,
    //   "User_Uid": FirebaseAuth.instance.currentUser!.uid,
    //   "Video_Name": imageNameget
    // });
    // .doc(FirebaseAuth.instance.currentUser!.uid+"/${imageNameget}")
    // .set({
    //   "Video_Link":imagepath,
    //   "User_Uid":FirebaseAuth.instance.currentUser!.uid,
    //   "Video_Name":imageNameget
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                upvideo == 0
                    ? ElevatedButton(
                        onPressed: () {
                          imageupload();
                        },
                        child: Text("Upload Video"))
                    : ElevatedButton(
                        onPressed: () {
                          // updata()
                          updateData();
                        },
                        child: Text(
                          "Send Data in FireStore ",
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
