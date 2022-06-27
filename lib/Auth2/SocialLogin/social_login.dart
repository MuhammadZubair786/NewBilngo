// import 'package:animation_wrappers/animation_wrappers.dart';
// import 'package:blingo2/Routes/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:blingo2/Auth/login_navigator.dart';
// import 'package:blingo2/Components/continue_button.dart';
// import 'package:blingo2/Components/entry_field.dart';
// import 'package:blingo2/Locale/locale.dart';
// import 'package:blingo2/Theme/colors.dart';
// import 'package:flutter_phoenix/flutter_phoenix.dart';

// class SocialLogin extends StatefulWidget {
//   const SocialLogin({Key? key}) : super(key: key);

//   @override
//   _SocialLoginState createState() => _SocialLoginState();
// }

// class _SocialLoginState extends State<SocialLogin> {
//   @override
//   Widget build(BuildContext context) {
//     var locale = AppLocalizations.of(context)!;
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(140.0),
//         child: AppBar(
//             flexibleSpace: Column(
//               children: <Widget>[
//                 const Spacer(),
//                 const CircleAvatar(
//                   backgroundImage: AssetImage('assets/images/user.webp'),
//                   radius: 40,
//                 ),
//                 Text(
//                   '\n' + locale.changeProfilePic!,
//                   style: const TextStyle(color: disabledTextColor),
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               Theme(
//                   data: Theme.of(context).copyWith(
//                     cardColor: backgroundColor,
//                   ),
//                   child: PopupMenuButton(
//                     icon: Icon(
//                       Icons.more_vert,
//                       color: secondaryColor,
//                     ),
//                     shape: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                         borderSide: BorderSide.none),
//                     onSelected: (dynamic value) {
//                       if (value == locale.changeLanguage) {
//                         Navigator.pushNamed(context, PageRoutes.languagePage);
//                       } else if (value == locale.help) {
//                         Navigator.pushNamed(context, PageRoutes.helpPage);
//                       } else if (value == locale.termsOfUse) {
//                         Navigator.pushNamed(context, PageRoutes.tncPage);
//                       } else if (value == locale.logout) {
//                         Phoenix.rebirth(context);
//                       }
//                     },
//                     itemBuilder: (BuildContext context) {
//                       return [
//                         PopupMenuItem(
//                           child: Text(locale.changeLanguage!),
//                           value: locale.changeLanguage,
//                           textStyle: TextStyle(color: secondaryColor),
//                         ),
//                         PopupMenuItem(
//                           child: Text(locale.help!),
//                           value: locale.help,
//                           textStyle: TextStyle(color: secondaryColor),
//                         ),
//                         PopupMenuItem(
//                           child: Text(locale.termsOfUse!),
//                           value: locale.termsOfUse,
//                           textStyle: TextStyle(color: secondaryColor),
//                         ),
//                       ];
//                     },
//                   ))
//             ]),
//       ),
//       body: FadedSlideAnimation(
//         Padding(
//           padding: const EdgeInsets.only(left: 20.0, bottom: 16.0, right: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Text(
//                   locale.comment6!,
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline6!
//                       .copyWith(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 12.0),
//               EntryField(
//                 label: AppLocalizations.of(context)!.phoneNumber,
//                 initialValue: "+929876543210",
//                 keyboardType: TextInputType.number,
//               ),
//               const Spacer(),
//               CustomButton(
//                 onPressed: () =>
//                     Navigator.pushNamed(context, LoginRoutes.verification),
//               ),
//             ],
//           ),
//         ),
//         beginOffset: const Offset(0, 0.3),
//         endOffset: const Offset(0, 0),
//         slideCurve: Curves.linearToEaseOut,
//       ),
//     );
//   }
// }
