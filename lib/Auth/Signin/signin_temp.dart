import 'package:blingo2/Auth/Signin/email.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // String phoneNumber = "";

  // // void _onCountryChange(CountryCode countryCode) {
  // //   phoneNumber = countryCode.toString();
  // //   print("New Country selected: " + countryCode.toString());
  // // }

  // // void check() {
  // //   print("Full Text: " + phoneNumber + _controller.text);
  // // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Sign In',
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
            backgroundColor: Colors.white,
            bottom: const TabBar(
              tabs: [
                Tab(text: "E-mail"),
              ],
              labelColor: mainColor,
              indicatorColor: mainColor,
              unselectedLabelColor: mainColor,
            ),
          ),
          body: TabBarView(
            children: [
              EmailScreen(),
            ],
          ),
        ));
  }
}
