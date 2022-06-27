import 'package:blingo2/Auth/Signup/email.dart';
import 'package:blingo2/Auth/Signup/phone.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  final String name;
  const SignupScreen(this.name, {Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState(name);
}

class _SignupScreenState extends State<SignupScreen> {
  final String name;
  _SignupScreenState(this.name);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold, color: darkColor),
            ),
            actions: [
              GestureDetector(
                  child: const Icon(Icons.info_outline_rounded),
                  onTap: () {
                    Navigator.of(context).popAndPushNamed(PageRoutes.helpPage);
                  })
            ],
            centerTitle: true,
            foregroundColor: darkColor,
            backgroundColor: Colors.white,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Phone",
                ),
                Tab(text: "E-mail"),
              ],
              labelColor: mainColor,
              indicatorColor: mainColor,
              unselectedLabelColor: disabledTextColor,
            ),
          ),
          body: TabBarView(
            children: [
              PhoneScreen(name),
              EmailScreen(name),
            ],
          ),
        ));
  }
}
