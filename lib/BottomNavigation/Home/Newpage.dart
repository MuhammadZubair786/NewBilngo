import 'package:blingo2/Auth/Signup/signup.dart';
import 'package:blingo2/Components/left_toolbar.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:video_player/video_player.dart';



class NewPage extends StatefulWidget {
   var   videos;
  var  images;
  var  isFollowing;
   final int? variable;

  NewPage(this.videos,this.images,this.isFollowing,this.variable);

  @override
  // ignore: no_logic_in_create_state
  State<NewPage> createState() => _NewPageState(videos,images,isFollowing,variable);
}

class _NewPageState extends State<NewPage> {
    var   videos;
  var  images;
  var  isFollowing;
  var variable;

  _NewPageState(this.videos,this.images,this.isFollowing,this.variable);


  
  PageController? _pageController;
  int current = 0;
  bool isOnPageTurning = false;


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemBuilder: (context, position) {
          print(position);
          return Container(
            child: Text(position.toString()),
          );
          // return VideoPage(
          //   widget.videos[position],
          //   widget.images[position],
          //   pageIndex: position,
          //   currentPageIndex: current,
          //   isPaused: isOnPageTurning,
          //   isFollowing: widget.isFollowing,
          // );
        },
        onPageChanged: widget.variable == null
            ? (i) async {
                if (FirebaseAuth.instance.currentUser == null) {
                  await showModalBottomSheet(
                    shape:  OutlineInputBorder(
                        borderSide: BorderSide(color: transparentColor),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.0))),
                    context: context,
                    isScrollControlled: true,
                    isDismissible: false,
                    builder: (context) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.width * 1.2,
                          child: Signup());
                    },
                  );
                }
              }
            : null,
        itemCount: widget.videos.length,
      ),
      const lefttoolbar_h(
        dCount: '3',
      ),
      // FutureBuilder(
      //     future: data(),
      //     builder: (ctx, snapshot) {
      //       return Text("");
      //     })
    ]);
  }
}

class VideoPage extends StatefulWidget {
   final String video;
  final String image;
  final int? pageIndex;
  final int? currentPageIndex;
  final bool? isPaused;
  final bool? isFollowing;

  VideoPage(this.video, this.image,
      {this.pageIndex, this.currentPageIndex, this.isPaused, this.isFollowing});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
    late VideoPlayerController _controller;
     bool initialized = false;

   @override
  void initState() {
    super.initState();
    print(widget.video);
    _controller = VideoPlayerController.network(widget.video)
      ..initialize().then((value) {
        setState(() {
          _controller.setLooping(true);
          initialized = true;
        });

      });
      // getDocs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(child: Text("ok",style: TextStyle(color: Colors.red,fontSize: 40),)),
      
    );
  }
}