import 'package:blingo2/BottomNavigation/Home/upload_video.dart';
import 'package:blingo2/BottomNavigation/MyProfile/NewPage.dart';
import 'package:flutter/material.dart';
import 'package:blingo2/BottomNavigation/Explore/explore_page.dart';
import 'package:blingo2/BottomNavigation/Home/home_page.dart';
import 'package:blingo2/BottomNavigation/MyProfile/my_profile_page.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/BottomNavigation/Notifications/notification_messages.dart';
import 'package:blingo2/Theme/colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    ExplorePage(),
    // Container(),
    UploadVideo(),
    NotificationMessages(),
    // LinkCheckPage()
    MyProfilePage(),
    //  UploadVideo(),
  ];

  void onTap(int index) {
    if (index == 2) {
      Navigator.pushNamed(context, PageRoutes.addVideoPage);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<BottomNavigationBarItem> _bottomBarItems = [
      BottomNavigationBarItem(
        icon: const ImageIcon(AssetImage('assets/icons/ic_home.png')),
        activeIcon:
            const ImageIcon(AssetImage('assets/icons/ic_homeactive.png')),
        label: locale.home,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.explore_outlined),
        activeIcon: const Icon(Icons.explore),
        label: locale.explore,
      ),
      BottomNavigationBarItem(
        icon: SizedBox(
            width: 45.0,
            height: 27.0,
            child: Stack(children: [
              Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(7.0))),
              Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                      color: hotOrange,
                      borderRadius: BorderRadius.circular(7.0))),
              Center(
                  child: Container(
                height: double.infinity,
                width: 35,
                decoration: BoxDecoration(
                    color: darkColor, borderRadius: BorderRadius.circular(7.0)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20.0,
                ),
              )),
            ])),
        label: '',
      ),
      // icon: Container(
      //     padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      //     decoration: BoxDecoration(
      //       borderRadius: radius,
      //       color: mainColor,
      //     ),
      //     child: const Icon(Icons.add)),
      BottomNavigationBarItem(
        icon: const ImageIcon(AssetImage('assets/icons/ic_notification.png')),
        activeIcon: const ImageIcon(
            AssetImage('assets/icons/ic_notificationactive.png')),
        label: locale.notification,
      ),
      BottomNavigationBarItem(
        icon: const ImageIcon(AssetImage('assets/icons/ic_profile.png')),
        activeIcon:
            const ImageIcon(AssetImage('assets/icons/ic_profileactive.png')),
        label: locale.profile,
      ),
    ];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _children[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              backgroundColor: bottomNavColor,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              iconSize: 22.0,
              selectedItemColor: secondaryColor,
              selectedFontSize: 12,
              unselectedFontSize: 10,
              unselectedItemColor: secondaryColor,
              items: _bottomBarItems,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
