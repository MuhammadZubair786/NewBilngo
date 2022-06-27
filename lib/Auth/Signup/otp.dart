import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTP extends StatefulWidget {
  final String? phone;
  final String name;
  final String userName;
  OTP(this.phone, this.name, this.userName);
  @override
  _OTPScreenState createState() => _OTPScreenState(phone, name, userName);
}

class _OTPScreenState extends State<OTP> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();
  final String? phone;
  final String name;
  final String userName;
  _OTPScreenState(this.phone, this.name, this.userName);
  late String _verificationCode;
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      width: 5,
      color: Colors.grey,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
                child: const Icon(Icons.info_outline_rounded),
                onTap: () {
                  Navigator.of(context).popAndPushNamed(PageRoutes.helpPage);
                })
          ],
        ),
        key: _scaffoldkey,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 40, left: 50),
                  child: const Padding(
                      padding: EdgeInsets.all(1),
                      child: Text(
                        'Enter 6-digit code',
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          color: darkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
              Container(
                  margin: const EdgeInsets.only(top: 10, left: 50),
                  child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        'Your code was sent to ' + '${phone!}',
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ))),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: PinPut(
                    fieldsCount: 6,
                    textStyle:
                        const TextStyle(fontSize: 25.0, color: bottomNavColor),
                    eachFieldWidth: 40.0,
                    eachFieldHeight: 55.0,
                    focusNode: _pinPutFocusNode,
                    controller: _pinPutController,
                    submittedFieldDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 5,
                        color: mainColor,
                      ),
                    ),
                    selectedFieldDecoration: pinPutDecoration,
                    followingFieldDecoration: pinPutDecoration,
                    pinAnimationType: PinAnimationType.fade,
                    onSubmit: (pin) async {
                      try {
                        FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: phone!,
                          verificationCompleted:
                              (PhoneAuthCredential credential) async {
                            await FirebaseAuth.instance
                                .signInWithCredential(
                                    PhoneAuthProvider.credential(
                                        verificationId: _verificationCode,
                                        smsCode: pin))
                                .whenComplete(() async {
                              print(userName);
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .add({
                                'Username': '@' + userName,
                                'diamonds': 0,
                                'followers': 0,
                                'likes': 0,
                                'following': 0,
                                'posts': 0,
                                'email': phone,
                                'bio': 'Edit profile to enter bio',
                                // contact:  _mobileController.text,
                                'displayName': name,
                                'photoUrl':
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6TaCLCqU4K0ieF27ayjl51NmitWaJAh_X0r1rLX4gMvOe0MDaYw&s',
                                'id': FirebaseAuth.instance.currentUser!.uid,
                              }).then((value) {
                                Navigator.of(context).popAndPushNamed(
                                    PageRoutes.bottomNavigation);
                              });
                            });
                          },
                          verificationFailed: (FirebaseAuthException e) {
                            print(e.message);
                          },
                          codeSent: (String verficationID, int? resendToken) {
                            setState(() {
                              _verificationCode = verficationID;
                            });
                          },
                          codeAutoRetrievalTimeout: (String verificationID) {
                            setState(() {
                              _verificationCode = verificationID;
                            });
                          },
                        );
                      } catch (e) {
                        FocusScope.of(context).unfocus();
                        _scaffoldkey.currentState!.showSnackBar(
                            SnackBar(content: Text('invalid OTP')));
                      }
                    }),
              ),
            ],
          ),
        ));
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone!,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .whenComplete(() async {
          // Navigator.of(context).popAndPushNamed(PageRoutes.bottomNavigation);
          await FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
            'Username': userName,
            'email': phone,
            'diamonds': 0,
            'likes': 0,
            'followers': 0,
            'following': 0,
            'posts': 0,
            'bio': 'Edit profile to update bio',
            // contact:  _mobileController.text,
            'displayName': name,
            'photoUrl':
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6TaCLCqU4K0ieF27ayjl51NmitWaJAh_X0r1rLX4gMvOe0MDaYw&s',
            'id': FirebaseAuth.instance.currentUser!.uid,
          });
          Navigator.of(context).popAndPushNamed(PageRoutes.bottomNavigation);
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verficationID, int? resendToken) {
        setState(() {
          _verificationCode = verficationID;
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(() {
          _verificationCode = verificationID;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}
