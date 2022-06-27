import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as Im;
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blingo2/Services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blingo2/Components/entry_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:path_provider/path_provider.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final FirebaseService services = FirebaseService();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? image;
  String? photoUrl;
  bool _displayNameValid = true;
  bool _bioValid = true;
  XFile? imageFile;

  Future<XFile?> _pickImage(String action) async {
    XFile? selectedImage;

    action == 'Gallery'
        ? selectedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery)
        : await ImagePicker().getImage(source: ImageSource.camera);

        print(selectedImage);

    return selectedImage;
  }

  updateProfileData() {
    setState(() {
      nameController.text.trim().length < 3 || nameController.text.isEmpty
          ? _displayNameValid = false
          : _displayNameValid = true;
      bioController.text.trim().length > 100 || bioController.text.isEmpty
          ? _bioValid = false
          : _bioValid = true;
    });

    if (_displayNameValid && _bioValid) {
      FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
        "displayName": nameController.text,
        "bio": bioController.text,
      }).then((value) async {
        Navigator.of(context)
            .popAndPushNamed(PageRoutes.myProfile)
            .then((value) async {
          SnackBar snackbar = const SnackBar(
            content: Text(
              "Profile updated!",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.green,
          );
          //_scaffoldKey.currentState.showSnackBar(snackbar);
          ScaffoldMessenger(key: _scaffoldkey, child: snackbar);
        });
      });
    }
    if (_displayNameValid) {
      FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
        "displayName": nameController.text,
      }).then((value) async {
        Navigator.of(context)
            .popAndPushNamed(PageRoutes.myProfile)
            .then((value) async {
          SnackBar snackbar = const SnackBar(
            content: Text(
              "Profile updated!",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.green,
          );
          //_scaffoldKey.currentState.showSnackBar(snackbar);
          ScaffoldMessenger(key: _scaffoldkey, child: snackbar);
        });
      });
    }
    if (_bioValid) {
      FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
        "bio": bioController.text,
      }).then((value) async {
        Navigator.of(context)
            .popAndPushNamed(PageRoutes.myProfile)
            .then((value) async {
          SnackBar snackbar = const SnackBar(
            content: Text(
              "Profile updated!",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.green,
          );
          //_scaffoldKey.currentState.showSnackBar(snackbar);
          ScaffoldMessenger(key: _scaffoldkey, child: snackbar);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future:
            FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData) {
            var data = snapshot.data!.data();
            return DefaultTabController(
              length: 1,
              child: Scaffold(
                key: _scaffoldkey,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(200.0),
                  child: AppBar(
                    flexibleSpace: Column(
                      children: <Widget>[
                        const Spacer(),
                        FadedScaleAnimation(
                          GestureDetector(
                              onTap: () async {
                                // XFile? _image = await imagePick();
                                // if (_image != null && _image.path.isNotEmpty) {
                                //   image = await uploadImage(_image);
                                // }
                                _showImageDialog();
                              },
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data!['photoUrl']),
                                radius: 40,
                              )),
                        ),
                        GestureDetector(
                            onTap: () async {
                              // XFile? _image = await imagePick();
                              // if (_image != null && _image.path.isNotEmpty) {
                              //   image = await uploadImage(_image);
                              // }
                              _showImageDialog();
                            },
                            child: const Text(
                              '\nChange Profile Pic',
                              style: TextStyle(color: disabledTextColor),
                            )),
                        const SizedBox(height: 64),
                      ],
                    ),
                    actions: <Widget>[
                      RawMaterialButton(
                        onPressed: () async {
                          updateProfileData();
                        },
                        child: Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: mainColor),
                        ),
                      )
                    ],
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(0.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          labelColor: mainColor,
                          indicatorColor: mainColor,
                          unselectedLabelColor: disabledTextColor,
                          labelStyle: Theme.of(context).textTheme.headline6,
                          indicator:
                              const BoxDecoration(color: transparentColor),
                          isScrollable: true,
                          tabs: const <Widget>[
                            Tab(text: 'Profile'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                body: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    FadedSlideAnimation(
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 36.0),
                          EntryField(
                            controller: nameController,
                            label: data['displayName'],
                          ),
                          EntryField(
                            controller: bioController,
                            label: data['bio'],
                          ),
                          const Spacer(),
                        ],
                      ),
                      beginOffset: const Offset(0, 0.3),
                      endOffset: const Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Future<XFile?> imagePick() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future<String> uploadImage(XFile image) async {
    Reference db =
        FirebaseStorage.instance.ref('userImages/${getImageName(image)}');
    await db.putFile(File(image.path));
    return await db.getDownloadURL();
    // return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  String getImageName(XFile image) {
    return image.path.split("/").last;
  }

  _showImageDialog() {
    return showDialog(
        context: context,
        // barrierDismissible: true,
        builder: ((context) {
          return SimpleDialog(
            children: <Widget>[
              SimpleDialogOption(
                child: const Text(
                  'Choose from Gallery',
                  style: TextStyle(
                    color: darkColor,
                  ),
                ),
                onPressed: () {
                  _pickImage('Gallery').then((selectedImage) {
                    print(selectedImage);
                    setState(() {
                      imageFile = selectedImage;
                    });
                    Navigator.pop(context, false);
                    uploadImageToFirebase(context, imageFile);
                  });
                },
              ),
              SimpleDialogOption(
                child: const Text(
                  'Take Photo',
                  style: TextStyle(
                    color: darkColor,
                  ),
                ),
                onPressed: ()async {
                  print("data");
               await    _pickImage('Camera').then((selectedImage) {
                    print(selectedImage);
                    // setState(() {
                    //   imageFile = selectedImage;
                    // });
                    //  Navigator.pop(context, false);
                    // uploadImageToFirebase(context, imageFile);
                  });
                },
              ),
              SimpleDialogOption(
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: darkColor,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        }));
  }

  Future uploadImageToFirebase(BuildContext context, XFile? image) async {
    print("DATA "+image!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('userPhotos');
    UploadTask uploadTask = firebaseStorageRef.putFile(File(image.path));
     print(UploadTask);
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then((value) {
      print(value);
      setState(() {
        photoUrl = value;
      });
      FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
        'photoUrl': value,
      });
      Navigator.of(context);
    });
  }
}
