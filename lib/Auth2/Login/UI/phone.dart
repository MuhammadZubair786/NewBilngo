import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneScreen extends StatelessWidget {
  PhoneScreen({Key? key}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Container(
            margin: const EdgeInsets.only(top: 100),
            width: 350,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
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
              controller: phoneController,
              // initialCountryCode: 'PK',
              // onChanged: (phone) {
              //   print(phone.completeNumber);
              // },
            )),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(PageRoutes.tncPage);
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
              // Login with phone number logic
            },
            child: const Text(
              'Send Code',
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
}
