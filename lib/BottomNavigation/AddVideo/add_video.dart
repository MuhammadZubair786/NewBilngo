import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:blingo2/Theme/colors.dart';

class AddVideo extends StatefulWidget {
  @override
  _AddVideoState createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  Future<XFile?> pickVideo() async {
    XFile? selectedImage;
    selectedImage = await ImagePicker().pickVideo(source: ImageSource.camera);
    return selectedImage;
  }

  String? video;
  XFile? videoPath;
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FadedSlideAnimation(
        Stack(
          children: <Widget>[
            Positioned(
              top: 28,
              left: 4,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: secondaryColor,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              width: wt,
              bottom: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.camera_front,
                    color: secondaryColor,
                  ),
                  GestureDetector(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: videoCall,
                        child: Icon(
                          Icons.videocam,
                          color: secondaryColor,
                          size: 30,
                        ),
                      ),
                      onTap: () async {
                        pickVideo().then((selectedImage) {
                          videoPath = selectedImage;
                        });
                        Navigator.pushNamed(
                            context, PageRoutes.addVideoFilterPage,
                            arguments: videoPath);
                      }),
                  Icon(
                    Icons.flash_off,
                    color: secondaryColor,
                  ),
                ],
              ),
            ),
            Positioned(
              width: wt,
              bottom: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: secondaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.swipeUpForGallery!,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
