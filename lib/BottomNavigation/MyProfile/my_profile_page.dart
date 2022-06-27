import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blingo2/Auth/Signup/signup.dart';
import 'package:blingo2/BottomNavigation/MyProfile/ShowLink.dart';
import 'package:blingo2/Components/left_toolbar.dart';
import 'package:blingo2/Models/users.dart';
import 'package:blingo2/Services/Firebase_dynamic_link.dart';
import 'package:blingo2/Services/repository.dart';
import 'package:blingo2/Services/services.dart';
import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:blingo2/Components/profile_page_button.dart';
import 'package:blingo2/Components/row_item.dart';
import 'package:blingo2/Components/sliver_app_delegate.dart';
import 'package:blingo2/Components/tab_grid.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/BottomNavigation/MyProfile/edit_profile.dart';
import 'package:blingo2/BottomNavigation/MyProfile/followers.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:blingo2/BottomNavigation/Explore/explore_page.dart';
import 'package:blingo2/BottomNavigation/MyProfile/following.dart';


class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      return const MyProfileBody();
      // return Text(
      //   FirebaseAuth.instance.currentUser!.uid,
      //   style: const TextStyle(
      //     color: darkColor,
      //   ),
      // );
    } else {
      return Signup();
    }
  }
}

class MyProfileBody extends StatefulWidget {
  const MyProfileBody({Key? key}) : super(key: key);

  @override
  _MyProfileBodyState createState() => _MyProfileBodyState();
}

class _MyProfileBodyState extends State<MyProfileBody> {
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .where('id', isEqualTo: user!.uid)
  //       .get()
  //       .then((val) {
  //     if (val.docs.isNotEmpty) {
  //       name = val.docs[0].data["displayName"];
  //       userName = val.docs.["Username"];
  //     } else {
  //       print("Not Found");
  //     }
  //   });
  // }

  final key = UniqueKey();
  User? user = FirebaseAuth.instance.currentUser;

  var userlink ="";

  var link ="";
  TextEditingController new1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future:
            FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
        builder: (_, snapshot) {
         
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData) {
            var data = snapshot.data!.data();
            //  print(data);
            return Stack(children: [
              const LeftToolBar_g(dCount: '3'),
              Padding(
                padding: const EdgeInsets.only(bottom: 64.0),
                child: Scaffold(
                  backgroundColor: darkColor,
                  body: Stack(
                    children: [
                      DefaultTabController(
                        length: 3,
                        child: SafeArea(
                          child: NestedScrollView(
                            headerSliverBuilder: (BuildContext context,
                                bool innerBoxIsScrolled) {
                              return <Widget>[
                                SliverAppBar(
                                  expandedHeight: 404.0,
                                  floating: false,
                                  actions: <Widget>[
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                        cardColor: backgroundColor,
                                      ),
                                      child: PopupMenuButton(
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: secondaryColor,
                                        ),
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            borderSide: BorderSide.none),
                                        onSelected: (dynamic value) {
                                          if (value == locale!.changeLanguage) {
                                            Navigator.pushNamed(context,
                                                PageRoutes.languagePage);
                                          } else if (value == locale.help) {
                                            Navigator.pushNamed(
                                                context, PageRoutes.helpPage);
                                          } else if (value ==
                                              locale.termsOfUse) {
                                            Navigator.pushNamed(
                                                context, PageRoutes.tncPage);
                                          } else if (value == locale.logout) {
                                            FirebaseService services =
                                                FirebaseService();
                                            services.signOutFromGoogle(context);
                                          }
                               
                                        },
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            PopupMenuItem(
                                              child:
                                                  Text(locale!.changeLanguage!),
                                              value: locale.changeLanguage,
                                              textStyle: const TextStyle(
                                                  color: darkColor),
                                            ),
                                            PopupMenuItem(
                                              child: Text(locale.help!),
                                              value: locale.help,
                                              textStyle: const TextStyle(
                                                  color: darkColor),
                                            ),
                                            PopupMenuItem(
                                              child: Text(locale.termsOfUse!),
                                              value: locale.termsOfUse,
                                              textStyle: const TextStyle(
                                                  color: darkColor),
                                            ),
                                            PopupMenuItem(
                                              child: Text(locale.logout!),
                                              value: locale.logout,
                                              textStyle: const TextStyle(
                                                  color: darkColor),
                                            ),
                                            // ignore: prefer_const_constructors
                                            PopupMenuItem(
                                              child: GestureDetector(
                                                onTap: () async {
                                            //   var  generate = await FirebaseDynamicLinkService.createDynamicLink(true,FirebaseAuth.instance.currentUser!.uid);
                                            //  print(generate);
                                            //  setState(() {
                                            //    userlink= generate;
                                            //  });
                                              setState(() {
                                               
                                              });
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowLink("https://blingo.page.link/MEGs")));
                                              

                                                },
                                                child: Text("Refernce Link")),

                                            onTap: (){
                                            

                                             
                                           
                                            },
                                              textStyle: const TextStyle(
                                                  color: darkColor),
                                            )
                                          ];
                                        },
                                      ),
                                    )
                                  ],
                                  flexibleSpace: FlexibleSpaceBar(
                                    centerTitle: true,
                                    title: Column(
                                      children: <Widget>[
                                        const Spacer(flex: 10),
                                        CircleAvatar(
                                          radius: 28.0,
                                          backgroundImage:
                                              NetworkImage(data!['photoUrl']),
                                        ),
                                        const Spacer(),
                                        Text(
                                          data['displayName'],
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          data['Username'],
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: disabledTextColor),
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.center,
                                        //   children: <Widget>[
                                        //     ImageIcon(
                                        //       const AssetImage(
                                        //           "assets/icons/ic_fb.png"),
                                        //       color: secondaryColor,
                                        //       size: 10,
                                        //     ),
                                        //     const SizedBox(width: 16),
                                        //     ImageIcon(
                                        //       const AssetImage(
                                        //           "assets/icons/ic_twt.png"),
                                        //       color: secondaryColor,
                                        //       size: 10,
                                        //     ),
                                        //     const SizedBox(width: 16),
                                        //     ImageIcon(
                                        //       const AssetImage(
                                        //           "assets/icons/ic_insta.png"),
                                        //       color: secondaryColor,
                                        //       size: 10,
                                        //     ),
                                        //   ],
                                        // ),
                                        const Spacer(),
                                        Text(
                                          data['bio'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 8),
                                        ),
                                        const Spacer(),
                                        ProfilePageButton(
                                          'Edit Profile',
                                          () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditProfile()));
                                          },
                                          width: 120,
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                    k_m_b_generator(
                                                        data['likes']),
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        height: 1.5)),
                                                const Text(
                                                  'Likes',
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      color: disabledTextColor),
                                                )
                                              ],
                                            ),
                                            RowItem(
                                                k_m_b_generator(
                                                    data['followers']),
                                                'Followers',
                                                FollowersPage()),
                                            RowItem(
                                                k_m_b_generator(
                                                    data['following']),
                                                'Following',
                                                FollowingPage()),
                                          ],
                                        ),
                                        ElevatedButton(onPressed: (){
                                           FlutterClipboard.copy(userlink).then((value){print(userlink);});
                                        }
                                        , child: Text("copy"))
                                      ],
                                    ),
                                  ),
                                ),
                                SliverPersistentHeader(
                                  delegate: SliverAppBarDelegate(
                                    const TabBar(
                                      labelColor: mainColor,
                                      unselectedLabelColor: lightTextColor,
                                      indicatorColor: transparentColor,
                                      tabs: [
                                        Tab(icon: Icon(Icons.dashboard)),
                                        Tab(icon: Icon(Icons.favorite_border)),
                                        Tab(icon: Icon(Icons.bookmark_border)),
                                      ],
                                    ),
                                  ),
                                  pinned: true,
                                ),
                              ];
                            },
                            body: TabBarView(
                              children: <Widget>[
                                FadedSlideAnimation(
                                  TabGrid(
                                    food + food,
                                    viewIcon: Icons.remove_red_eye,
                                    views: '2.2k',
                                    onTap: () => Navigator.pushNamed(
                                        context, PageRoutes.videoOptionPage),
                                  ),
                                  beginOffset: const Offset(0, 0.3),
                                  endOffset: const Offset(0, 0),
                                  slideCurve: Curves.linearToEaseOut,
                                ),
                                FadedSlideAnimation(
                                  TabGrid(
                                    dance,
                                    icon: Icons.favorite,
                                  ),
                                  beginOffset: const Offset(0, 0.3),
                                  endOffset: const Offset(0, 0),
                                  slideCurve: Curves.linearToEaseOut,
                                ),
                                FadedSlideAnimation(
                                  TabGrid(
                                    lol,
                                    icon: Icons.bookmark,
                                  ),
                                  beginOffset: const Offset(0, 0.3),
                                  endOffset: const Offset(0, 0),
                                  slideCurve: Curves.linearToEaseOut,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  

  String k_m_b_generator(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)} K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)} K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)} M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)} B";
    } else {
      return num.toString();
    }
  }
  showAlertDialog(BuildContext context,data ) {  
  // Create button  
  Widget okButton = FlatButton(  
    child: Text("OK"),  
    onPressed: () {  
      Navigator.of(context).pop();  
    },  
  );  
  
  // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: Text("Simple Alert"),  
    content: TextFormField(
      controller:  data,
    ),  
    actions: [  
      okButton,  
    ],  
  );  
  
  // show the dialog  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
  }
}
