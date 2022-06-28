import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'package:video_player/video_player.dart';

class Audience extends StatefulWidget {
  final String channelName;
  const Audience({Key? key, required this.channelName}) : super(key: key);
  @override
  _AudienceState createState() => _AudienceState();
}

class _AudienceState extends State<Audience> {
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller =
        VideoPlayerController.asset('assets/videos/broadcast_sample.mp4')
          ..initialize().then((_) {
            // Once the video has been loaded we play the video and set looping to true.
            _controller!.play();
            _controller!.setLooping(true);
            // Ensure the first frame is shown after the video is initialized.
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Text(widget.channelName),
            // child: FittedBox(
            //   fit: BoxFit.fill,
            //     child: SizedBox(
            //       width: _controller.value.size?.width ?? 0,
            //       height: _controller.value.size?.height ?? 0,
            //       child: VideoPlayer(_controller),
            //     ),
            //   ),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Icon(
                    Icons.thumb_up,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.pink[600],
                  ),
                  const Icon(
                    Icons.insert_emoticon,
                    color: Colors.yellow,
                  ),
                  const Icon(Icons.audiotrack, color: Colors.green),
                  const Icon(
                    Icons.whatshot,
                    color: Colors.orange,
                  ),
                  const Icon(
                    Icons.thumb_down,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }
}
