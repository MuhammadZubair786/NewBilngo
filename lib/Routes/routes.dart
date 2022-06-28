import 'package:blingo2/Auth/Signin/signin_temp.dart';
import 'package:blingo2/Auth/Signup/signup.dart';
import 'package:blingo2/BottomNavigation/MyProfile/my_profile_page.dart';
import 'package:blingo2/Live/live_screen.dart';
import 'package:blingo2/Refer/refer_screen.dart';
import 'package:blingo2/Sound/sound.dart';
import 'package:flutter/material.dart';
import 'package:blingo2/BottomNavigation/Explore/more_page.dart';
import 'package:blingo2/BottomNavigation/MyProfile/badge_request.dart';
import 'package:blingo2/BottomNavigation/MyProfile/language_page.dart';
import 'package:blingo2/BottomNavigation/MyProfile/video_option.dart';
import 'package:blingo2/BottomNavigation/bottom_navigation.dart';
import 'package:blingo2/BottomNavigation/AddVideo/add_video.dart';
import 'package:blingo2/BottomNavigation/AddVideo/add_video_filter.dart';
import 'package:blingo2/BottomNavigation/MyProfile/followers.dart';
import 'package:blingo2/BottomNavigation/MyProfile/help_page.dart';
import 'package:blingo2/BottomNavigation/AddVideo/post_info.dart';
import 'package:blingo2/BottomNavigation/Explore/search_users.dart';
import 'package:blingo2/BottomNavigation/MyProfile/tnc.dart';
import 'package:blingo2/Chat/chat_page.dart';
import 'package:blingo2/Screens/user_profile.dart';

class PageRoutes {
  static const String loginNavigator = 'login_navigator';
  static const String signinTemp = 'signin_temp';
  static const String bottomNavigation = 'bottom_navigation';
  static const String followersPage = 'followers_page';
  static const String helpPage = 'help_page';
  static const String tncPage = 'tnc_page';
  static const String searchPage = 'search_page';
  static const String addVideoPage = 'add_video_page';
  static const String addVideoFilterPage = 'add_video_filter_page';
  static const String postInfoPage = 'post_info_page';
  static const String userProfilePage = 'user_profile_page';
  static const String referScreen = 'refer_screen';
  static const String liveScreen = 'live_screen';
  static const String chatPage = 'chat_page';
  static const String soundScreen = 'sound';
  static const String myProfile = 'my_profile_page';
  static const String morePage = 'more_page';
  static const String videoOptionPage = 'video_option_page';
  static const String verifiedBadgePage = 'verified_badge_page';
  static const String languagePage = 'language_page';

  Map<String, WidgetBuilder> routes() {
    return {
      loginNavigator: (context) => Signup(),
      bottomNavigation: (context) => const BottomNavigation(),
      followersPage: (context) => FollowersPage(),
      helpPage: (context) => HelpPage(),
      tncPage: (context) => TnC(),
      referScreen: (context) => const ReferPage(),
      searchPage: (context) => SearchUsers(),
      addVideoPage: (context) => AddVideo(),
      addVideoFilterPage: (context) => AddVideoFilter(),
      postInfoPage: (context) => PostInfo(),
      userProfilePage: (context) => const UserProfilePage(),
      liveScreen: (context) => const LivePage(),
      chatPage: (context) => ChatPage(),
      signinTemp: (context) => LoginScreen(),
      soundScreen: (context) => const SoundScreen(),
      myProfile: (context) => const MyProfilePage(),
      morePage: (context) => MorePage(),
      videoOptionPage: (context) => VideoOptionPage(),
      verifiedBadgePage: (context) => BadgeRequest(),
      languagePage: (context) => ChangeLanguagePage(),
    };
  }
}
