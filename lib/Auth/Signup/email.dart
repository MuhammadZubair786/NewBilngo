import 'dart:math';
import 'package:blingo2/Auth/Signin/signin_temp.dart';
import 'package:blingo2/BottomNavigation/MyProfile/my_profile_page.dart';
import 'package:blingo2/Constants/constants.dart';
import 'package:blingo2/Models/users.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  final String name;
  const EmailScreen(this.name, {Key? key}) : super(key: key);

  @override
  _EmailScreenState createState() => _EmailScreenState(name);
}

class _EmailScreenState extends State<EmailScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // Email Validator
  main() {
    const String email = 'fredrik.eilertsen@gail.com';
    final bool isValid = EmailValidator.validate(email);

    print('Email is valid? ' + (isValid ? 'yes' : 'no'));
  }

  final String name;
  _EmailScreenState(this.name, {Key? key});
  bool loading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Container(
            margin: const EdgeInsets.only(top: 40),
            width: 330,
            child: TextFormField(
              cursorColor: mainColor,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 5.0),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                ),
              ),
              controller: userNameController,
            )),
        const SizedBox(
          height: 10,
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            width: 330,
            child: TextFormField(
              cursorColor: mainColor,
              validator: main(),
              decoration: InputDecoration(
                labelText: 'E-mail Address',
                labelStyle: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 5.0),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                ),
              ),
              controller: _emailController,
            )),
        const SizedBox(
          height: 10,
        ),
        Container(
            margin: const EdgeInsets.only(top: 10),
            width: 330,
            child: TextFormField(
              cursorColor: mainColor,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 5.0),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                ),
              ),
              controller: _passwordController,
            )),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).popAndPushNamed(PageRoutes.tncPage);
          },
          child: Text(
              "By continuing, you agree to our Terms of Service and \nacknowledge that you have read our Privacy Policy to \nlearn how we collect, use, and share your data",
              style: TextStyle(
                color: Colors.grey[500],
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 400,
          margin: const EdgeInsets.only(bottom: 200),
          child: ElevatedButton(
            style: ButtonStyle(
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.maximumDensity,
                vertical: VisualDensity.maximumDensity,
              ),
              backgroundColor: MaterialStateProperty.all(mainColor),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () async {
              if (_emailController.text.length > 27) {
                const snackBar = SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                        'Email address cant be more than 27 characters',
                        style: TextStyle(color: Colors.white)));

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                return;
              }
              if (_emailController.text.isNotEmpty &&
                  _passwordController.text.isNotEmpty &&
                  userNameController.text.isNotEmpty) {
                try {
                  await _firebaseAuth
                      .createUserWithEmailAndPassword(
                          email: _emailController.text.trimRight(),
                          password: _passwordController.text.trimRight())
                      // Verify email here and then navigate
                      .then((response) async {
                    checkUsernameIsUnique(userNameController.text)
                        .then((val) async {
                      if (val) {
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .set({
                          'Username': '@' +
                              userNameController.text.trimRight().toLowerCase(),
                          'diamonds': 0,
                          'followers': 0,
                          'likes': 0,
                          'following': 0,
                          'posts': 0,
                          'email': _emailController.text.toLowerCase(),
                          'bio': 'Edit profile to update bio',
                          // contact:  _mobileController.text,
                          'displayName': name,
                          'photoUrl':
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6TaCLCqU4K0ieF27ayjl51NmitWaJAh_X0r1rLX4gMvOe0MDaYw&s',
                          'id': FirebaseAuth.instance.currentUser!.uid,
                        });
                      } else {
                        const snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                                'Sorry, this username is already taken. Please try another !',
                                style: TextStyle(color: Colors.white)));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  });
                } on FirebaseAuthException catch (e) {
                  switch (e.code) {
                    case "account-exists-with-different-credential":
                      // The account already exists with a different credential
                      String? email = e.email;
                      AuthCredential? pendingCredential = e.credential;

                      // Fetch a list of what sign-in methods exist for the conflicting user
                      List<String> userSignInMethods = await FirebaseAuth
                          .instance
                          .fetchSignInMethodsForEmail(email!);

                      // If the user has several sign-in methods,
                      // the first method in the list will be the "recommended" method to use.
                      if (userSignInMethods.first == 'password') {
                        // Prompt the user to enter their password
                        String password = _passwordController.text;

                        // Sign the user in to their account with the password
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        // Link the pending credential with the existing account
                        await userCredential.user!
                            .linkWithCredential(pendingCredential!)
                            .then((value) {
                          const snackBar = SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                  'Your account existed with different credentials. But tension not now we linked these settings with your existing account.',
                                  style: TextStyle(color: Colors.white)));
                          Navigator.of(context)
                              .popAndPushNamed(PageRoutes.myProfile)
                              .then((value) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        });
                      }
                      break;
                    case "invalid-email":
                      const snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                              'Your email address appears to be malformed.',
                              style: TextStyle(color: Colors.white)));

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      break;
                    case "invalid-password":
                      const snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                              'The provided value for the password user property is invalid. It must be a string with at least six characters.',
                              style: TextStyle(color: Colors.white)));

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      break;
                    case "user-not-found":
                      const snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("User with this email doesn't exist.",
                              style: TextStyle(color: Colors.white)));

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      break;
                    case "ERROR_USER_DISABLED":
                      const snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                              'User with this email has been disabled.',
                              style: TextStyle(color: Colors.white)));

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      break;
                    default:
                      "An undefined Error happened.";
                  }
                }
              } else {
                const snackBar = SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text(
                      'Error ! Please Enter e-mail, password and username ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }

  checkUsernameIsUnique(String username) async {
    QuerySnapshot querySnapshot;
    setState(() {
      loading = true;
    });
    querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where("username", isEqualTo: username)
        .get();
    print(querySnapshot.docs.isNotEmpty);
    return querySnapshot.docs.isEmpty;
  }
}
