import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                ),
              ),
              controller: _emailController,
            )),
        const SizedBox(
          height: 20,
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
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            // Navigate To help view,
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
            onPressed: () {
              // Login with email Logic here and then proceed to profile
              // {
              // signInWithEmailPassword(email: _emailController.text, password: _passwordController.text);
              // }
              Navigator.pushNamed(context, PageRoutes.myProfile);
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
