import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blingo2/Components/left_toolbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:blingo2/BottomNavigation/Explore/more_page.dart';
import 'package:blingo2/Components/thumb_list.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';

List<String> dance = [
  'assets/thumbnails/dance/Layer 951.png',
  'assets/thumbnails/dance/Layer 952.png',
  'assets/thumbnails/dance/Layer 953.png',
  'assets/thumbnails/dance/Layer 954.png',
  'assets/thumbnails/dance/Layer 951.png',
  'assets/thumbnails/dance/Layer 952.png',
  'assets/thumbnails/dance/Layer 953.png',
  'assets/thumbnails/dance/Layer 954.png',
];
List<String> lol = [
  'assets/thumbnails/lol/Layer 978.png',
  'assets/thumbnails/lol/Layer 979.png',
  'assets/thumbnails/lol/Layer 980.png',
  'assets/thumbnails/lol/Layer 981.png',
];
List<String> food = [
  'assets/thumbnails/food/Layer 783.png',
  'assets/thumbnails/food/Layer 784.png',
  'assets/thumbnails/food/Layer 785.png',
  'assets/thumbnails/food/Layer 786.png',
  'assets/thumbnails/food/Layer 787.png',
  'assets/thumbnails/food/Layer 788.png',
];

List<String> carouselImages = [
  "assets/images/banner 1.png",
  "assets/images/banner 2.png",
//  "assets/images/banner 1.png",
//  "assets/images/banner 2.png",
];

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExploreBody();
  }
}

class ExploreBody extends StatefulWidget {
  @override
  _ExploreBodyState createState() => _ExploreBodyState();
}

class _ExploreBodyState extends State<ExploreBody> {
  final List<ThumbList> thumbLists = [
    ThumbList(dance),
    ThumbList(lol),
    ThumbList(food),
    ThumbList(dance),
    ThumbList(lol),
    ThumbList(food),
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<TitleRow> titleRows = [
      TitleRow(locale.danceLike, '159.8k', dance),
      TitleRow(locale.laughOut, '108.9k', lol),
      TitleRow(locale.followUr, '159.8k', food),
      TitleRow(locale.danceLike, '159.8k', dance),
      TitleRow(locale.laughOut, '108.9k', lol),
      TitleRow(locale.followUr, '159.8k', food),
    ];
    return Stack(children: [
      Padding(
        padding: EdgeInsets.only(bottom: 60.0, top: 20.0),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(72.0),
            child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),
              decoration: BoxDecoration(
                color: darkColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TextField(
                readOnly: true,
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.searchPage),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: secondaryColor),
                  border: InputBorder.none,
                  hintText: AppLocalizations.of(context)!.search,
                  hintStyle: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ),
          body: FadedSlideAnimation(
            ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Stack(
                  children: [
                    CarouselSlider(
                      items: carouselImages.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                  child: FadedScaleAnimation(Image.asset(i))),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          viewportFraction: 1.0,
                          autoPlay: true,
                          aspectRatio: 3,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      end: 20.0,
                      bottom: 0.0,
                      child: Row(
                        children: carouselImages.map((i) {
                          int index = carouselImages.indexOf(i);

                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : disabledTextColor.withOpacity(0.5),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: titleRows.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          titleRows[index],
                          thumbLists[index],
                        ],
                      );
                    }),
              ],
            ),
            beginOffset: const Offset(0, 0.3),
            endOffset: const Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ),
      ),
      const LeftToolBar_g(
        dCount: '3',
      ),
    ]);
  }
}

class TitleRow extends StatelessWidget {
  final String? title;
  final String subTitle;
  final List list;

  const TitleRow(this.title, this.subTitle, this.list);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const CircleAvatar(
          backgroundColor: darkColor,
          child: Text(
            '#',
            style: TextStyle(color: mainColor),
          ),
        ),
        title: Text(
          title!,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: Row(
          children: <Widget>[
            Text(
              subTitle + ' ' + AppLocalizations.of(context)!.video!,
              style: Theme.of(context).textTheme.caption,
            ),
            Spacer(),
            Text(
              "${AppLocalizations.of(context)!.viewAll}",
              style: Theme.of(context).textTheme.caption,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: secondaryColor,
              size: 10,
            ),
          ],
        ),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MorePage(
                        title: title,
                        list: list,
                      )),
            ));
  }
}
