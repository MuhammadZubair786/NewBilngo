import 'package:blingo2/Sound/sound_m.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SoundScreen extends StatefulWidget {
  const SoundScreen({Key? key}) : super(key: key);

  @override
  _SoundScreenState createState() => _SoundScreenState();
}

class _SoundScreenState extends State<SoundScreen> {
  Sound? sound;
  Color col = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                // Share sound logic here
              }),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(children: [
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20, left: 10),
                          child: Image.asset(
                            'assets/images/user.webp',
                            fit: BoxFit.cover,
                            height: 150.0,
                            width: 150.0,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: [
                                const Text(
                                  // "${sound!.songName}"
                                  "original sound - \nblingo_default_account",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: darkColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                    child: Text(
                                      // "${sound!.user.Name}"
                                      "Account Name",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.normal),
                                    ),
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(PageRoutes.myProfile);
                                    }),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  // "${sound!.videoCount}"
                                  "48.7K",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (sound!.isFavorite == false) {
                                        sound!.isFavorite == true;
                                        col = Colors.grey;
                                      } else {
                                        sound!.isFavorite == false;
                                        col = Colors.red;
                                      }
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.favorite,
                                    color: col,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/Ii4Cv63yG9iYawDtKC/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/tqfS3mgQU28ko/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/3o72EX5QZ9N9d51dqo/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/4oMoIbIQrvCjm/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/aZmD30dCFaPXG/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/NU8tcjnPaODTy/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/Ii4Cv63yG9iYawDtKC/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/tqfS3mgQU28ko/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/3o72EX5QZ9N9d51dqo/giphy.gif",
                              placeholder: (context, url) => const Padding(
                                padding: EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add Sound Logic here
        },
        label: const Text('Use this sound'),
        icon: const Icon(Icons.camera),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}

// import 'dart:io';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:blingo/data/video.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

// class AddSounds extends StatefulWidget {
//   AddSounds({@required this.tempFile});

//   final XFile? tempFile;

//   @override
//   _AddSoundsState createState() => _AddSoundsState();
// }

// class _AddSoundsState extends State<AddSounds> {
//   AudioPlayer? _player;
//   XFile? _newFile;
//   FlutterFFmpeg? _fFmpeg;

//   @override
//   void initState() {
//     super.initState();
//     _player = AudioPlayer();
//     _fFmpeg = FlutterFFmpeg();
//     _newFile = widget.tempFile;
//   }

//   @override
//   void dispose() {
//     _player!.dispose();
//     super.dispose();
//   }

//   Future<void> _playSound(Future<String> url) async {
//     try {
//       await _player!.stop();
//     } catch (e) {
//       print(e);
//     }
//     _player!.play(await url);
//   }

//   void _stopSound() {
//     _player!.stop();
//   }

//   void _popScreen() {
//     _stopSound();
//     Navigator.pop(context, _newFile);
//   }

//   // void _replaceSound({}) async {
//   //   // replaceSound logic
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10.0),
//           child: Column(
//             children: [
//               TopRow(
//                 popScreen: _popScreen,
//               ),
//               SizedBox(height: 20.0),
//               SoundsList(
//                 playSound: _playSound,
//                 stopSound: _stopSound,
//                 // replaceSound: _replaceSound
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TopRow extends StatelessWidget {
//   const TopRow({
//     this.popScreen,
//   });

//   final Function? popScreen;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Expanded(
//           child: Stack(
//             children: [
//               ClipOval(
//                 child: Material(
//                   child: InkWell(
//                     onTap: () {
//                       // Insert pop logic here
//                     },
//                     child: SizedBox(
//                       height: 40.0,
//                       width: 40.0,
//                       child: Icon(
//                         Icons.close,
//                         color: Colors.black,
//                         size: 30.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   'Add a Sound',
//                   style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class SoundsList extends StatefulWidget {
//   const SoundsList({
//     Key? key,
//     this.playSound,
//     this.stopSound,
//     this.replaceSound,
//   }) : super(key: key);

//   final Function? playSound;
//   final Function? stopSound;
//   final Function? replaceSound;

//   @override
//   _SoundsListState createState() => _SoundsListState();
// }

// class _SoundsListState extends State<SoundsList> {
//   List sounds = [];
//   int playing = -1;
//   bool _isEditing = false;

//   @override
//   Widget build(BuildContext context) {
//     return _isEditing
//         ? Center(
//             child: CircularProgressIndicator(),
//           )
//         : Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(child: CircularProgressIndicator());
//                   } else {
//                     sounds = snapshot.data!.docs;
//                     return ListView(
//                       children: sounds.asMap().entries.map((entry) {
//                         var doc = entry.value;
//                         int index = entry.key;
//                         return SoundTile(
//                             name: doc.data()['name'],
//                             creator: doc.data()['creator'],
//                             isPlaying: playing == index,
//                             onPlay: () {
//                               if (playing == index) {
//                                 widget.stopSound!();
//                               } else {
//                                 widget.playSound!();
//                               }
//                               setState(() {
//                                 if (playing == index) {
//                                   playing = -1;
//                                 } else {
//                                   playing = index;
//                                 }
//                               });
//                             });
//                         // onSelect: () async {
//                         //   setState(() {
//                         //     _isEditing = true;
//                         //   });
//                         //   widget.replaceSound!(downloadURL: downloadURL);
//                         // });
//                       }).toList(),
//                     );
//                   }
//                 },
//                 stream: FirebaseFirestore.instance
//                     .collection('sounds')
//                     .snapshots()),
//           );
//   }
// }

// class SoundTile extends StatelessWidget {
//   AudioPlayer? _player;
//   SoundTile({
//     required this.name,
//     required this.creator,
//     required this.isPlaying,
//     required this.onPlay,
//   });
//   Video? video;

//   final String name;
//   final String creator;
//   final bool isPlaying;
//   final Function? onPlay;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => SoundsList(),
//             ));
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10.0),
//         child: Row(
//           children: [
//             GestureDetector(
//               child: Icon(
//                 isPlaying ? Icons.pause : Icons.play_arrow_rounded,
//                 size: 30.0,
//               ),
//               onTap: () {
//                 _player!.play(video!.songName);
//               },
//             ),
//             SizedBox(width: 10.0),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name.substring(0, name.lastIndexOf('.')),
//                   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.0),
//                 ),
//                 SizedBox(height: 5.0),
//                 Text(
//                   creator,
//                   style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12.0,
//                       color: Colors.grey),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

