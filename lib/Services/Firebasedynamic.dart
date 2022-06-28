// ignore: file_names
// import 'package:dynamiclink/Home.dart';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class FirebaseDynamicLinkService {
  static Future<String> createDynamicLink(String d1) async {
    String _linkMessage;

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://blingo.page.link',
      link: Uri.parse('http://www.blingo.com/user?id=${d1}'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.blingo2',
        minimumVersion: 125,
      ),
    );

    Uri url;
    // if (short) {
    final ShortDynamicLink shortLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    url = shortLink.shortUrl;
    // } else {
    //   url = await parameters.buildUrl();
    // }

    _linkMessage = url.toString();
    print(_linkMessage);
    return _linkMessage;
  }

  static Future<void> initDynamicLink(BuildContext context) async {
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      onSuccess:
      (PendingDynamicLinkData dynamicLink) async {
        final Uri deepLink = dynamicLink.link;
        print(deepLink);
        if (deepLink != null) {
          try {
            // Navigator.of(context).push(
            //      MaterialPageRoute(builder: (context) => HomeApp()));
          } catch (err) {
            print("err" + err.toString());
          }
        } else {
          print("not get link");
        }
      };
    });
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    Uri deepLink = data!.link;
    print(deepLink);
    if (deepLink != null) {
    //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeApp()));
    } else {
      print("No link");
    }
  }
}
