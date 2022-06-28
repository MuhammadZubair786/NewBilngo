import 'package:blingo2/Auth/Signup/otp.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneScreen extends StatefulWidget {
  final String name;
  const PhoneScreen(this.name, {Key? key}) : super(key: key);

  @override
  _PhoneScreenState createState() => _PhoneScreenState(name);
}

class _PhoneScreenState extends State<PhoneScreen> {
  String? phone2;
  final String name;
  _PhoneScreenState(this.name);
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Container(
            margin: const EdgeInsets.only(top: 20),
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
          height: 20,
        ),
        SizedBox(
            width: 350,
            child: Form(
                key: _formKey,
                child: IntlPhoneField(
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
                  initialCountryCode: 'PK',
                  controller: _phoneController,
                  onChanged: (phone) {
                    phone2 = phone.completeNumber;
                    print(phone.countryCode);
                  },
                ))),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).popAndPushNamed(PageRoutes.helpPage);
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
              if (_phoneController.text.isNotEmpty &&
                  userNameController.text.isNotEmpty) {
                checkUsernameIsUnique(userNameController.text)
                    .then((val) async {
                  if (val) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => OTP(
                                phone2,
                                name,                                
                                userNameController.text
                                    .trimRight()
                                    .toLowerCase())))
                        .then((value) => Navigator.pop(context));
                  } else {
                    const snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'User name is already taken by another user. Please try another  ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              } else {
                const snackBar = SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      'Error ! Please Enter your Phone Number, and username  ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
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

  checkUsernameIsUnique(String username) async {
    QuerySnapshot querySnapshot;
    setState(() {
      isLoading = true;
    });
    querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where("username", isEqualTo: username)
        .get();
    print(querySnapshot.docs.isNotEmpty);
    return querySnapshot.docs.isEmpty;
  }
}
