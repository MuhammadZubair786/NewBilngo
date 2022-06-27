import 'package:blingo2/Auth/Signin/signin_temp.dart';
import 'package:blingo2/Auth/Signup/name.dart';
import 'package:blingo2/Auth/Signup/signup_temp.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Services/services.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.person_outline,
              color: Colors.grey,
              size: 100.0,
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'Sign up for an account',
              style: TextStyle(color: Colors.black87),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: 200.0,
              child: Builder(
                builder: (context) => RaisedButton(
                  onPressed: () {
                    signUpPopup(context);
                  },
                  color: mainColor,
                  textColor: Colors.white,
                  child: const Text('Sign up'),
                ),
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
          ],
        ),
      ),
    );
  }
}

void signUpPopup(context) {
  bool isLoading = false;
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext bc) {
      return !isLoading
          ? SizedBox(
              height: MediaQuery.of(context).size.height * .90,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Navigator.pop(
                              context,
                            ),
                            child: const Icon(
                              Icons.close,
                            ),
                          ),
                          GestureDetector(
                              child: const Icon(Icons.info_outline_rounded),
                              onTap: () {
                                Navigator.of(context)
                                    .popAndPushNamed(PageRoutes.helpPage);
                              })
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      const Text(
                        'Sign up for Blingo',
                        style: TextStyle(
                          color: darkColor,
                          fontSize: 25.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Create a profile, follow other accounts, make your own videos, and more.',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ButtonTheme(
                        minWidth: 250.0,
                        child: RaisedButton(
                          onPressed: () => {
                            // Phone or Email Logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NameScreen(),
                                  settings: const RouteSettings(name: '/Name')),
                            )
                          },
                          elevation: 0.0,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 0.5),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.email),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Use phone or email',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // ButtonTheme(
                      //   minWidth: 250.0,
                      //   child: RaisedButton(
                      //     onPressed: () async {
                      //       FirebaseService services = FirebaseService();
                      //       services.signInWithFacebook();
                      //       Navigator.of(context)
                      //           .popAndPushNamed(PageRoutes.myProfile);
                      //     },
                      //     elevation: 0.0,
                      //     shape: const RoundedRectangleBorder(
                      //       side: BorderSide(color: Colors.grey, width: 0.5),
                      //     ),
                      //     color: Colors.white,
                      //     child: Padding(
                      //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.min,
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: const <Widget>[
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(
                      //               Icons.facebook,
                      //               color: Colors.blue,
                      //             ),
                      //           ),
                      //           Expanded(
                      //             flex: 2,
                      //             child: Text(
                      //               'Continue with Facebook',
                      //               style: TextStyle(
                      //                 fontSize: 15,
                      //                 color: Colors.black87,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ButtonTheme(
                        minWidth: 250.0,
                        child: RaisedButton(
                          onPressed: () async {
                            isLoading = true;
                            FirebaseService service = FirebaseService();
                            service.signInwithGoogle().then((value) => {
                                  Navigator.of(context).popAndPushNamed(
                                      PageRoutes.bottomNavigation)
                                });
                          },
                          elevation: 0.0,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 0.5),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.g_mobiledata),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Continue with Google',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate To help view,
                        },
                        child: Text(
                            "By continuing, you agree to our Terms of Service and \nacknowledge that you have read our Privacy Policy to \nlearn how we collect, use, and share your data\nIf you sign up with SMS, SMS Fee may apply",
                            style: TextStyle(
                              color: Colors.grey[500],
                            )),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Already Have An Account ?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: darkColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              signInPopup(context);
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: mainColor),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : CircularProgressIndicator();
    },
  );
}

void signInPopup(context) {
  bool isLoading = false;
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext bc) {
      return !isLoading
          ? SizedBox(
              height: MediaQuery.of(context).size.height * .90,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Navigator.pop(
                              context,
                            ),
                            child: const Icon(
                              Icons.close,
                            ),
                          ),
                          GestureDetector(
                              child: const Icon(Icons.info_outline_rounded),
                              onTap: () {
                                Navigator.of(context)
                                    .popAndPushNamed(PageRoutes.helpPage);
                              })
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      const Text(
                        'Sign in for Blingo',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: darkColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Manage your account, check notifications, comment on videos, and more.',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ButtonTheme(
                        minWidth: 250.0,
                        child: RaisedButton(
                          onPressed: () => {
                            // Phone or Email Logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                  settings:
                                      const RouteSettings(name: '/login')),
                            )
                          },
                          elevation: 0.0,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 0.5),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.email),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Use phone or email',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // ButtonTheme(
                      //   minWidth: 250.0,
                      //   child: RaisedButton(
                      //     onPressed: () async {
                      //       FirebaseService services = FirebaseService();
                      //       services.signInWithFacebook();
                      //       Navigator.of(context)
                      //           .popAndPushNamed(PageRoutes.myProfile);
                      //     },
                      //     elevation: 0.0,
                      //     shape: const RoundedRectangleBorder(
                      //       side: BorderSide(color: Colors.grey, width: 0.5),
                      //     ),
                      //     color: Colors.white,
                      //     child: Padding(
                      //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.min,
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: const <Widget>[
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(
                      //               Icons.facebook,
                      //               color: Colors.blue,
                      //             ),
                      //           ),
                      //           Expanded(
                      //             flex: 2,
                      //             child: Text(
                      //               'Continue with Facebook',
                      //               style: TextStyle(
                      //                 fontSize: 15,
                      //                 color: Colors.black87,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ButtonTheme(
                        minWidth: 250.0,
                        child: RaisedButton(
                          onPressed: () async {
                            isLoading = true;
                            FirebaseService service = FirebaseService();
                            service.signInwithGoogle().then((value) => {
                                  Navigator.of(context).popAndPushNamed(
                                      PageRoutes.bottomNavigation)
                                });
                          },
                          elevation: 0.0,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 0.5),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.mail,
                                    color: Colors.red,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Continue with Google',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Dont Have An Account ?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: darkColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              signUpPopup(context);
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: mainColor),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const CircularProgressIndicator();
    },
  );
}
