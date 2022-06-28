// // import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
// // import 'package:blingo2/Locale/locale.dart';
// // import 'package:blingo2/Routes/routes.dart';
// // import 'package:blingo2/Theme/colors.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter_phoenix/flutter_phoenix.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'email.dart';
// // import 'phone.dart';
// // import 'package:flutter/material.dart';

// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({Key? key}) : super(key: key);

// //   @override
// //   _LoginScreenState createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   final FirebaseAuth auth = FirebaseAuth.instance;
// //   // String phoneNumber = "";

// //   // // void _onCountryChange(CountryCode countryCode) {
// //   // //   phoneNumber = countryCode.toString();
// //   // //   print("New Country selected: " + countryCode.toString());
// //   // // }

// //   // // void check() {
// //   // //   print("Full Text: " + phoneNumber + _controller.text);
// //   // // }

// //   @override
// //   Widget build(BuildContext context) {
// //     var locale = AppLocalizations.of(context);
// //     return Container(
// //         decoration: BoxDecoration(
// //           color: backgroundColor,
// //           border: Border.all(color: transparentColor),
// //           borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
// //         ),
// //         margin:
// //             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
// //         padding: const EdgeInsets.all(16.0),
// //         child: DefaultTabController(
// //             length: 2,
// //             child: Scaffold(
// //               appBar: AppBar(
// //                 title: const Text(
// //                   'Sign In',
// //                   style:
// //                       TextStyle(fontWeight: FontWeight.bold, color: darkColor),
// //                 ),
// //                 actions: [
// //                   Theme(
// //                       data: Theme.of(context).copyWith(
// //                         cardColor: backgroundColor,
// //                       ),
// //                       child: PopupMenuButton(
// //                         icon: Icon(
// //                           Icons.more_vert,
// //                           color: secondaryColor,
// //                         ),
// //                         shape: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(12.0),
// //                             borderSide: BorderSide.none),
// //                         onSelected: (dynamic value) {
// //                           if (value == locale!.help) {
// //                             Navigator.pushNamed(context, PageRoutes.helpPage);
// //                           } else if (value == locale.termsOfUse) {
// //                             Navigator.pushNamed(context, PageRoutes.tncPage);
// //                           } else if (value == locale.logout) {
// //                             Phoenix.rebirth(context);
// //                           }
// //                         },
// //                         itemBuilder: (BuildContext context) {
// //                           return [
// //                             PopupMenuItem(
// //                               child: Text(locale!.help!),
// //                               value: locale.help,
// //                               textStyle: TextStyle(color: secondaryColor),
// //                             ),
// //                             PopupMenuItem(
// //                               child: Text(locale.termsOfUse!),
// //                               value: locale.termsOfUse,
// //                               textStyle: TextStyle(color: secondaryColor),
// //                             ),
// //                           ];
// //                         },
// //                       ))
// //                 ],
// //                 centerTitle: true,
// //                 backgroundColor: Colors.white,
// //                 bottom: const TabBar(
// //                   tabs: [
// //                     Tab(
// //                       text: "Phone",
// //                     ),
// //                     Tab(text: "E-mail"),
// //                   ],
// //                   labelColor: mainColor,
// //                   indicatorColor: mainColor,
// //                   unselectedLabelColor: mainColor,
// //                 ),
// //               ),
// //               body: TabBarView(
// //                 children: [
// //                   PhoneScreen(),
// //                   EmailScreen(),
// //                 ],
// //               ),
// //             )));
// //   }
// // }
// import 'package:animation_wrappers/animation_wrappers.dart';
// import 'package:blingo2/Routes/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/widgets.dart';
// import 'package:blingo2/Components/continue_button.dart';
// import 'package:blingo2/Components/entry_field.dart';
// import 'package:blingo2/Locale/locale.dart';
// import 'package:blingo2/Theme/colors.dart';
// import 'package:flutter_phoenix/flutter_phoenix.dart';

// import '../../login_navigator.dart';

// //register page for registration of a new user
// class LoginScreen extends StatelessWidget {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   final _formKey = GlobalKey<FormState>();
//   LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var locale = AppLocalizations.of(context);
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             AppLocalizations.of(context)!.signUpNow!,
//           ),
//           actions: <Widget>[
//             Theme(
//                 data: Theme.of(context).copyWith(
//                   cardColor: backgroundColor,
//                 ),
//                 child: PopupMenuButton(
//                   icon: Icon(
//                     Icons.more_vert,
//                     color: secondaryColor,
//                   ),
//                   shape: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                       borderSide: BorderSide.none),
//                   onSelected: (dynamic value) {
//                     if (value == locale!.help) {
//                       Navigator.pushNamed(context, PageRoutes.helpPage);
//                     } else if (value == locale.termsOfUse) {
//                       Navigator.pushNamed(context, PageRoutes.tncPage);
//                     } else if (value == locale.logout) {
//                       Phoenix.rebirth(context);
//                     }
//                   },
//                   itemBuilder: (BuildContext context) {
//                     return [
//                       PopupMenuItem(
//                         child: Text(locale!.help!),
//                         value: locale.help,
//                         textStyle: TextStyle(color: secondaryColor),
//                       ),
//                       PopupMenuItem(
//                         child: Text(locale.termsOfUse!),
//                         value: locale.termsOfUse,
//                         textStyle: TextStyle(color: secondaryColor),
//                       ),
//                     ];
//                   },
//                 ))
//           ]),

//       //this column contains 3 textFields and a bottom bar
//       body: FadedSlideAnimation(
//         const RegisterForm(),
//         beginOffset: const Offset(0, 0.3),
//         endOffset: const Offset(0, 0),
//         slideCurve: Curves.linearToEaseOut,
//       ),
//     );
//   }
// }

// class RegisterForm extends StatefulWidget {
//   const RegisterForm({Key? key}) : super(key: key);

//   @override
//   _RegisterFormState createState() => _RegisterFormState();
// }

// class _RegisterFormState extends State<RegisterForm> {
//   @override
//   Widget build(BuildContext context) {
//     var locale = AppLocalizations.of(context)!;
//     return SingleChildScrollView(
//       child: Container(
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           border: Border.all(color: transparentColor),
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
//         ),
//         height: MediaQuery.of(context).size.width * 1,
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             //name textField
//             EntryField(
//               textCapitalization: TextCapitalization.words,
//               label: locale.fullName,
//             ),
//             //email textField
//             EntryField(
//               textCapitalization: TextCapitalization.none,
//               label: locale.email,
//               keyboardType: TextInputType.emailAddress,
//             ),

//             //phone textField
//             EntryField(
//               label: locale.phoneNumber,
//               keyboardType: TextInputType.number,
//             ),
//             const Spacer(),
//             Text(
//               locale.weWillSend! + '\n',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.subtitle1,
//             ),

//             //continue button
//             CustomButton(
//                 text: locale.continueText,
//                 onPressed: () {
//                   Navigator.pushNamed(context, LoginRoutes.verification);
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
