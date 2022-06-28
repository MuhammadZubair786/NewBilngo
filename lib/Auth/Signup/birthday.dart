// import 'package:blingo/constants/constants.dart';
// import 'package:blingo/screens/auth/Signup/signup_temp.dart';
// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:flutter/material.dart';

// class BirthdayScreen extends StatefulWidget {
//   final String name;
//   const BirthdayScreen(this.name, {Key? key}) : super(key: key);

//   @override
//   _BirthdayScreenState createState() => _BirthdayScreenState(name);
// }

// class _BirthdayScreenState extends State<BirthdayScreen> {
//   var birthday;
//   final String name;
//   _BirthdayScreenState(this.name);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Sign Up',
//             style: TextStyle(fontWeight: FontWeight.bold, color: tiktokDark),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           shadowColor: Colors.white,
//         ),
//         body: SafeArea(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(children: <Widget>[
//                   Column(children: <Widget>[
//                     Container(
//                         margin: EdgeInsets.only(top: 40, right: 60),
//                         child: Padding(
//                             padding: EdgeInsets.all(1),
//                             child: Text(
//                               "When's your birthday?",
//                               textScaleFactor: 1.5,
//                               style: TextStyle(
//                                 color: tiktokDark,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ))),
//                     Container(
//                         margin: EdgeInsets.only(top: 10, left: 20),
//                         child: Padding(
//                             padding: EdgeInsets.all(1),
//                             child: Text(
//                               'Your birthday wont be shown publicly ',
//                               textScaleFactor: 1.2,
//                               style: TextStyle(
//                                 color: Colors.grey[500],
//                               ),
//                             ))),
//                   ]),
//                   Container(
//                       margin: EdgeInsets.only(top: 40),
//                       child: Icon(
//                         Icons.cake,
//                         size: 80,
//                         color: deepPink,
//                       )),
//                 ]),
//                 Container(
//                     margin: EdgeInsets.only(top: 10, left: 20),
//                     width: 330,
//                     child: DateTimePicker(
//                       initialValue: '${DateTime.now().toString()}',
//                       firstDate: DateTime(2000),
//                       lastDate: DateTime(2100),
//                       cursorColor: deepPink,
//                       decoration: InputDecoration(
//                         labelText: 'Birthday',
//                         labelStyle: TextStyle(
//                           color: deepPink,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         border: UnderlineInputBorder(
//                           borderSide: BorderSide(width: 5.0),
//                         ),
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: deepPink),
//                         ),
//                       ),
//                       onChanged: (val) {
//                         setState(() {
//                           birthday = val;
//                         });
//                       },
//                       validator: (val) {
//                         print(val);
//                         return null;
//                       },
//                       onSaved: (val) => print(val),
//                     )),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: 400,
//                   margin: EdgeInsets.only(
//                       top: 10, bottom: 200, left: 20, right: 20),
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       visualDensity: VisualDensity(
//                         horizontal: VisualDensity.maximumDensity,
//                         vertical: VisualDensity.maximumDensity,
//                       ),
//                       backgroundColor: MaterialStateProperty.all(deepPink),
//                       foregroundColor: MaterialStateProperty.all(Colors.white),
//                     ),
//                     onPressed: () {
//                       // Save name and pass context to next screen
//                       if (birthday == null) {
//                         final snackBar = SnackBar(
//                             backgroundColor: Colors.red,
//                             content: Text(
//                               'Error ! Please select your birthday first ',
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ));
//                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                       } else {
//                         Navigator.of(context)
//                             .push(MaterialPageRoute(
//                                 builder: (context) =>
//                                     SignupScreen(birthday, name)))
//                             .then((value) => Navigator.pop(context));
//                       }
//                     },
//                     child: Text(
//                       'Next',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//               ]),
//         ));
//   }
// }
