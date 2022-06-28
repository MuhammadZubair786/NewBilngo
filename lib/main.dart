import 'dart:async';

import 'package:blingo2/BottomNavigation/Home/home_page.dart';
import 'package:blingo2/BottomNavigation/bottom_navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/style.dart';

import 'Locale/language_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Phoenix(
      child: BlocProvider(
    create: (context) => LanguageCubit(),
    child: const Blingo(),
  )));
  // runApp(Blingo());
}

class Blingo extends StatefulWidget {
  const Blingo({Key? key}) : super(key: key);

  @override
  State<Blingo> createState() => _BlingoState();
}

class _BlingoState extends State<Blingo> {
    @override
  void initState() {
    initDynamicLinks();
    super.initState();
  }

  ///Retreive dynamic link firebase.
  void initDynamicLinks() async {
    print("ok");
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;
    print("Link +" + deepLink.toString());

    if (deepLink != null) {
      handleDynamicLink(deepLink);
    }
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      print("Link event :" + event.toString());
      final Uri? deepLink = event.link;

      // var data = event as Map;
      print(deepLink);
      handleDynamicLink(deepLink!);

    
    });
  }

  handleDynamicLink(Uri url) async {
    print(url);
    List<String> separatedString = [];
    separatedString.addAll(url.path.split('?'));

    var isStory = url.pathSegments.contains('user');
    print(separatedString);
    print(isStory);

    var diamonds=0;

    if(isStory){
      var id = url.queryParameters["id"];
      print(id);


      

     await FirebaseFirestore.instance
            .collection('users')
            .doc(id.toString()).get().then((value){
              // value.data() as Map;

              print(value.data()!["diamonds"]);
              diamonds = value.data()!["diamonds"];
              
            });

            print(diamonds+1);


       await FirebaseFirestore.instance
            .collection('users')
            .doc(id.toString())
            .update({
              "diamonds":diamonds+1


            });

    }

    // Timer(
    //     Duration(seconds: 5),
    //     () => {
    //           Navigator
    //               .push(MaterialPageRoute(builder: (context) => HomePage()))
    //         });
  }

  Widget build(BuildContext context) {
    return 
    BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) => 
      MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
          Locale('id'),
          Locale('fr'),
          Locale('pt'),
          Locale('es'),
          Locale('it'),
          Locale('sw'),
          Locale('tr'),
        ],
        theme: appTheme,
        locale: locale,
        home: const BottomNavigation(),
        routes: PageRoutes().routes(),
      ),
    );
  }
}
