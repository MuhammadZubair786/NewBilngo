import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blingo2/Components/continue_button.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';
import 'package:imgly_sdk/imgly_sdk.dart';

class AddVideoFilter extends StatefulWidget {
  XFile? videoPath;

  AddVideoFilter({Key? key, this.videoPath}) : super(key: key);
  @override
  _AddVideoFilterState createState() => _AddVideoFilterState();
}

class _AddVideoFilterState extends State<AddVideoFilter> {
  XFile? videoPath;
  Configuration createConfiguration() {
    final flutterSticker = Sticker(
        "example_sticker_logos_flutter", "Flutter", "assets/Flutter-logo.png");
    final imglySticker = Sticker(
        "example_sticker_logos_imgly", "img.ly", "assets/IgorSticker.png");

    /// A completely custom category.
    final logos = StickerCategory(
        "example_sticker_category_logos", "Logos", "assets/Flutter-logo.png",
        items: [flutterSticker, imglySticker]);

    /// A predefined category.
    final emoticons =
        StickerCategory.existing("imgly_sticker_category_emoticons");

    /// A customized predefined category.
    final shapes =
        StickerCategory.existing("imgly_sticker_category_shapes", items: [
      Sticker.existing("imgly_sticker_shapes_badge_01"),
      Sticker.existing("imgly_sticker_shapes_arrow_02")
    ]);
    var categories = <StickerCategory>[logos, emoticons, shapes];
    final configuration = Configuration(
        sticker:
            StickerOptions(personalStickers: true, categories: categories));
    return configuration;
  }

  void presentEditor() async {
    final result = await VESDK.openEditor(Video(videoPath!.path),
        configuration: createConfiguration());
    print(result?.toJson());
  }

  List<String> images = [
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
  ];

  // List<Color?> color = [
  //   Color(0xff7c94b6),
  //   Colors.orange[200],
  //   Colors.grey[300],
  //   Colors.grey[400],
  //   Colors.blueAccent[400],
  //   Colors.blueGrey[400],
  //   Colors.grey[300],
  //   Colors.blueGrey[400],
  // ];

  // List<BlendMode> blendMode = [
  //   BlendMode.dstATop,
  //   BlendMode.dst,
  //   BlendMode.hue,
  //   BlendMode.hardLight,
  //   BlendMode.modulate,
  //   BlendMode.dstATop,
  //   BlendMode.hardLight,
  //   BlendMode.darken,
  // ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AppBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 72,
            margin: const EdgeInsets.only(bottom: 78.0, left: 12.0, right: 12),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return FadedScaleAnimation(
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              // colorFilter: ColorFilter.mode(
                              //     color[index]!, blendMode[index]),
                              image: AssetImage(images[index]),
                              fit: BoxFit.cover)),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 72,
                      width: 72,
                      //child: Image.asset(images[index], fit: BoxFit.fill,),
                    ),
                  );
                }),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: <Widget>[
                CustomButton(
                  color: transparentColor,
                  icon: Icon(
                    Icons.music_note,
                    color: secondaryColor,
                  ),
                  text: AppLocalizations.of(context)!.addMusic,
                  onPressed: () {},
                ),
                const Spacer(),
                CustomButton(
                    text: AppLocalizations.of(context)!.next,
                    onPressed: () async {
                      presentEditor();
                      Navigator.pushNamed(context, PageRoutes.postInfoPage);
                    })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
