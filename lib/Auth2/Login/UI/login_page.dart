// import 'package:animation_wrappers/animation_wrappers.dart';
// import 'package:blingo2/Routes/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:blingo2/Auth/login_navigator.dart';
// import 'package:blingo2/Components/continue_button.dart';
// import 'package:blingo2/Locale/locale.dart';
// import 'package:blingo2/Theme/colors.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const LoginBody();
//   }
// }

// class LoginBody extends StatefulWidget {
//   const LoginBody({Key? key}) : super(key: key);

//   @override
//   _LoginBodyState createState() => _LoginBodyState();
// }

// class _LoginBodyState extends State<LoginBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         border: Border.all(color: transparentColor),
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
//       ),
//       margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       padding: const EdgeInsets.all(16.0),
//       child: FadedSlideAnimation(
//         Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Text(
//               AppLocalizations.of(context)!.youWillNeed!,
//               style: Theme.of(context)
//                   .textTheme
//                   .headline6!
//                   .copyWith(color: secondaryColor),
//             ),
//             const Spacer(),
//             CustomButton(
//               icon: const Icon(
//                 Icons.phone,
//                 size: 20,
//                 color: darkColor,
//               ),
//               color: Colors.white,
//               text: 'Continue with phone number or email',
//               textColor: darkColor,
//               onPressed: () =>
//                   Navigator.pushNamed(context, PageRoutes.signinTemp),
//             ),
//             const Spacer(flex: 5),
//             Text(
//               AppLocalizations.of(context)!.orContinueWith!,
//               textAlign: TextAlign.center,
//             ),
//             const Spacer(),
//             CustomButton(
//               icon: Image.asset(
//                 'assets/icons/ic_fb.png',
//                 height: 20,
//               ),
//               text: '   ${AppLocalizations.of(context)!.facebookAccount}',
//               color: fbColor,
//               onPressed: () =>
//                   Navigator.pushNamed(context, PageRoutes.socialLogin),
//             ),
//             CustomButton(
//               icon: Image.asset(
//                 'assets/icons/ic_ggl.png',
//                 height: 20,
//               ),
//               text: '   ${AppLocalizations.of(context)!.googleAccount}',
//               color: secondaryColor,
//               textColor: darkColor,
//               onPressed: () =>
//                   Navigator.pushNamed(context, PageRoutes.socialLogin),
//             ),
//           ],
//         ),
//         beginOffset: const Offset(0, 0.3),
//         endOffset: const Offset(0, 0),
//         slideCurve: Curves.linearToEaseOut,
//       ),
//     );
//   }
// }
