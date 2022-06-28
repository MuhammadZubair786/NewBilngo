import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blingo2/BottomNavigation/Explore/explore_page.dart';
import 'package:blingo2/Components/profile_page_button.dart';
import 'package:blingo2/Components/row_item.dart';
import 'package:blingo2/Components/sliver_app_delegate.dart';
import 'package:blingo2/Components/tab_grid.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/BottomNavigation/MyProfile/followers.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:blingo2/BottomNavigation/MyProfile/following.dart';

class ReferPage extends StatelessWidget {
  const ReferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ReferPageBody();
  }
}

class ReferPageBody extends StatefulWidget {
  const ReferPageBody({Key? key}) : super(key: key);

  @override
  _ReferPageBodyState createState() => _ReferPageBodyState();
}

class _ReferPageBodyState extends State<ReferPageBody> {
  bool isFollowed = false;

  var followText;
  final key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: darkColor,
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: secondaryColor,
                    foregroundColor: darkColor,
                    expandedHeight: 300.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50),
                      ),
                    ),
                    floating: false,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 180),
                            child: Image.asset(
                              'assets/images/diamond.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(left: 20, top: 20),
                          child: const Text(
                            'Points',
                            style: TextStyle(
                              color: disabledTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(left: 5, top: 20),
                          child: const Text(
                            '>',
                            style: TextStyle(
                              color: disabledTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(left: 10, top: 20),
                          child: const Text(
                            //'this.points'
                            '0',
                            style: TextStyle(
                              color: disabledTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10, top: 20),
                      child: const Text(
                        //'this.points'
                        'You currently have 0 diamonds. You can redeem only when you have 1000 diamonds. Refer Blingo to your friends to earn diamonds !',
                        style: TextStyle(
                          color: disabledTextColor,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 400,
                    margin: const EdgeInsets.only(bottom: 50),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.maximumDensity,
                          vertical: VisualDensity.maximumDensity,
                        ),
                        backgroundColor: MaterialStateProperty.all(mainColor),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        // Redeem Screen
                      },
                      child: const Text(
                        'Redeem',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
