import 'package:blingo2/Auth/Signin/signin_temp.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(children: <Widget>[
        Container(
            margin: const EdgeInsets.only(top: 60),
            width: 330,
            child: TextFormField(
              cursorColor: mainColor,
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
        SizedBox(
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
              try {
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
                    _passwordController.text.isNotEmpty) {
                  await _firebaseAuth
                      .signInWithEmailAndPassword(
                          email: _emailController.text.trimRight(),
                          password: _passwordController.text.trimRight())
                      .then((response) {
                    if (FirebaseAuth.instance.currentUser!.emailVerified) {
                      Navigator.of(context)
                          .popAndPushNamed(PageRoutes.bottomNavigation);
                    } else {
                      Widget okButton2 = FlatButton(
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      );
                      // Create button
                      Widget okButton = FlatButton(
                          color: Colors.white,
                          child: const Text(
                            "Send",
                            style: TextStyle(
                              color: mainColor,
                            ),
                          ),
                          onPressed: () async {
                            await FirebaseAuth.instance.currentUser!
                                .sendEmailVerification()
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                              const snackBar = SnackBar(
                                  backgroundColor: Colors.grey,
                                  content: Text(
                                      'Check your email for the verification link !',
                                      style: TextStyle(color: Colors.white)));

                              // Find the ScaffoldMessenger in the widget tree
                              // and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          });

                      // Create AlertDialog
                      AlertDialog alert = AlertDialog(
                        backgroundColor: mainColor,
                        insetPadding: const EdgeInsets.all(10),
                        title: const Text(
                          "Uh- Oh- ?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: const Text(
                          'Looks like your email is not verified. Click send to get an email containing link for verification !',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        actions: [
                          okButton2,
                          okButton,
                        ],
                      );
                      // show the dialog
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          });
                    }
                  });
                } else {
                  const snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Error ! Please Enter your Log In Information ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } on FirebaseAuthException catch (e) {
                var errorMessage;
                switch (e.code) {
                  case "invalid-email":
                    final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                            'Your email address appears to be malformed.',
                            style: TextStyle(color: Colors.white)));

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    break;
                  case "invalid-password":
                    final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                            'The provided value for the password user property is invalid. It must be a string with at least six characters.',
                            style: TextStyle(color: Colors.white)));

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    break;
                  case "user-not-found":
                    final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("User with this email doesn't exist.",
                            style: TextStyle(color: Colors.white)));

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    break;
                  case "ERROR_USER_DISABLED":
                    final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('User with this email has been disabled.',
                            style: TextStyle(color: Colors.white)));

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    break;
                  default:
                    errorMessage = "An undefined Error happened.";
                }
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
    ));
  }
}
