import 'package:video_player/video_player.dart';

class Sound {
  String id;
  String user;
  bool isFavorite = false;
  String songName;
  String likes;
  // User
  String videoCount;
  String comments;
  String url;

  VideoPlayerController? controller;

  Sound(
      {required this.id,
      required this.user,
      required this.songName,
      required this.likes,
      required this.videoCount,
      required this.comments,
      required this.url});

  Sound.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        user = json['user'],
        videoCount = json['videoCount'],
        isFavorite = json['isFavorite'],
        songName = json['song_name'],
        likes = json['likes'],
        comments = json['comments'],
        url = json['url'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isFavorite'] = this.isFavorite;
    data['song_name'] = this.songName;
    data['likes'] = this.likes;
    data['comments'] = this.comments;
    data['url'] = this.url;
    return data;
  }

  Future<Null> loadController() async {
    controller = VideoPlayerController.network(url);
    await controller?.initialize();
    controller?.setLooping(true);
  }
}
