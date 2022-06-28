import 'package:blingo2/Auth/Signup/email.dart';
import 'package:blingo2/Auth/Signup/signup_temp.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:flutter/material.dart';

class NameScreen extends StatelessWidget {
  NameScreen({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign Up',
            style: TextStyle(fontWeight: FontWeight.bold, color: darkColor),
          ),
          foregroundColor: darkColor,
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
        ),
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 40, left: 20),
                    child: const Padding(
                        padding: EdgeInsets.all(1),
                        child: Text(
                          'Enter your biodata?',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                            color: darkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                Container(
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Text(
                          'Complete these fields to create your profile ',
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ))),
                Container(
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    width: 330,
                    child: TextFormField(
                      cursorColor: mainColor,
                      decoration: InputDecoration(
                        labelText: 'Name',
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
                      controller: _nameController,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 200, left: 20, right: 20),
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
                      // Save name and pass context to next screen
                      if (_nameController.text.isNotEmpty) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (context) => SignupScreen(
                                    _nameController.text.trimRight())))
                            .then((value) => Navigator.pop(context));
                      } else {
                        const snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              'Error ! Please Enter the name & bio first ',
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
        ));
  }
}
