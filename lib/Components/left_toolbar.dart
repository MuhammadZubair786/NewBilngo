import 'package:blingo2/Routes/routes.dart';
import 'package:flutter/material.dart';

// Special Toolbar for homePage and for you, and following only.
class lefttoolbar_h extends StatelessWidget {
  final String dCount;

  const lefttoolbar_h({Key? key, required this.dCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(top: 40),
      width: 100.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _getSocialAction3(image: 'assets/images/live.png', context: context),
        _getSocialAction2(
            image: 'assets/images/diamond.png',
            title: dCount,
            context: context),
      ]),
    ));
  }

  Widget _getSocialAction2(
      {required String image,
      required String title,
      required BuildContext context}) {
    return Container(
        margin: const EdgeInsets.only(top: 15.0),
        width: 60.0,
        height: 60.0,
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.referScreen);
            },
            child: Column(children: [
              Image.asset(
                image,
              ),
              Text(
                dCount,
                style: const TextStyle(color: Colors.white),
              )
            ])));
  }

  Widget _getSocialAction3(
      {required String image, required BuildContext context}) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, PageRoutes.liveScreen);
        },
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          width: 60.0,
          height: 60.0,
          child: Image.asset(image),
        ));
  }
}

// General toolbar to show on profile, notifications etc

class LeftToolBar_g extends StatelessWidget {
  final String dCount;

  const LeftToolBar_g({Key? key, required this.dCount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(top: 70),
      width: 100.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _getSocialAction2(
            image: 'assets/images/diamond.png',
            title: dCount,
            context: context),
      ]),
    ));
  }

  Widget _getSocialAction2(
      {required String image,
      required String title,
      required BuildContext context}) {
    return Container(
        margin: const EdgeInsets.only(top: 15.0),
        width: 60.0,
        height: 60.0,
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.referScreen);
            },
            child: Column(children: [
              Image.asset(
                image,
              ),
              Text(
                dCount,
                style: const TextStyle(color: Colors.white),
              )
            ])));
  }
}
