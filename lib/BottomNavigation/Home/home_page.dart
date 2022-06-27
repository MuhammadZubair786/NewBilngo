// import 'package:blingo2/Services/Firebase_dynamic_link.dart';
import 'package:blingo2/Auth/Signup/signup.dart';
import 'package:blingo2/BottomNavigation/Home/comment_sheet.dart';
import 'package:blingo2/BottomNavigation/Home/upload_video.dart';
import 'package:blingo2/Components/custom_button.dart';
import 'package:blingo2/Components/rotated_image.dart';
import 'package:blingo2/Services/Firebase_dynamic_link.dart';
import 'package:blingo2/Services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blingo2/BottomNavigation/Home/following_tab.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:localstorage/localstorage.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeBody(key: key);
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<String> videos1 = [
 
  'assets/videos/1.mp4',
  'assets/videos/2.mp4',
];

List<String> videos2 = [
  'assets/videos/4.mp4',
  'assets/videos/5.mp4',
  'assets/videos/6.mp4',
];

List<String> imagesInDisc1 = [
  'assets/user/user1.png',
  'assets/user/user2.png',
  'assets/user/user3.png',
];

List<String> imagesInDisc2 = [
  'assets/user/user4.png',
  'assets/user/user3.png',
  'assets/user/user1.png',
];

var userdata =[];
  var comment=0;
 List _colors =[ Colors.red,Colors.pink,Colors.yellow];

  void initState(){
    super.initState();
    // print(FirebaseAuth.instance.currentUser);
    getDocs();
    // handleDynamicLinks();
  //  FirebaseDynamicLinkService.initDynamicLink();
  }


//   void handleDynamicLinks() async {
//     ///To bring INTO FOREGROUND FROM DYNAMIC LINK.
//     FirebaseDynamicLinks.instance.onLink.listen((data){
//       onSuccess: (PendingDynamicLinkData dynamicLinkData) async {
//         await _handleDeepLink(dynamicLinkData);
//       };},
//       // onError: (OnLinkErrorException e) async {
//       //   print('DynamicLink Failed: ${e.message}');
//       //   return e.message;
//       // },
//     );

//     final PendingDynamicLinkData? data =
//         await FirebaseDynamicLinks.instance.getInitialLink();
//     _handleDeepLink(data!);
//   }

//   // bool _deeplink = true;
//   _handleDeepLink(PendingDynamicLinkData data) async {
  
//      final Uri? deeplink = data.link;
//     if (deeplink != null) {
//       print('Handling Deep Link | deepLink: $deeplink');
//   }
// }

Future getDocs() async {
//   QuerySnapshot snap = await 
//    FirebaseFirestore.instance.collection('collection').get();
// snap.forEach((document) {
//     print(document.documentID);
//   });
// final  cd = FirebaseFirestore.instance.collection("Videos");
//  cd.get().then((value){
//     print(value.data());
    // final userCredentials = await FirebaseFirestore.instance
    //     .collection("Videos")
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .collection("")
    //     .get();
  //  var  phonee1 = userCredentials.data()!["phone"];
  // var   namee1 = userCredentials.data()!["name"];
    // print("object ${userCredentials.data()}");

DatabaseReference userRef =
        FirebaseDatabase.instance.reference().child('Videos');

         final data = userRef.once().then((snapshot) {
            var values = snapshot.snapshot.value as Map;

             values.values.forEach((values) {
                var getdata = values.values.toList();
                // print(getdata);

             for (var i = 0; i < getdata.length; i++) {
              // print(getdata[i]);

              userdata.add(getdata[i]);
             }
             setState(() {
               
             });
            //  print(userdata);

             });

         });
}


  
 
  @override
  Widget build(BuildContext context) {
    // List<Tab> tabs = [
    //   Tab(text: AppLocalizations.of(context)!.following),
    //   Tab(text: AppLocalizations.of(context)!.forYou),
    // ];
    // return DefaultTabController(
    //   length: tabs.length,
    //   child: Stack(
    //     children: <Widget>[
    //      userdata.length>0 ?   TabBarView(
    //         children: <Widget>[
    //         FollowingTabPage(userdata[0]["Video_Link"], userdata[0]["Video_Name"],userdata[0]["User_Uid"], false),
    //           FollowingTabPage(userdata[0]["Video_Link"],  userdata[0]["Video_Name"],userdata[0]["User_Uid"], true),
    //         ],
    //       ):
    //       Text(""),
    //       SafeArea(
    //         child: Align(
    //           alignment: Alignment.topCenter,
    //           child: Stack(
    //             children: [
    //               TabBar(
    //                 isScrollable: true,
    //                 labelStyle: Theme.of(context).textTheme.bodyText1,
    //                 indicator: const BoxDecoration(color: transparentColor),
    //                 tabs: tabs,
    //               ),
    //               Positioned.directional(
    //                 textDirection: Directionality.of(context),
    //                 top: 14,
    //                 start: 84,
    //                 child: const CircleAvatar(
    //                   backgroundColor: mainColor,
    //                   radius: 3,
    //                 ),
    //               ),
    //             ],
    //           ),
              
    //         ),
    //       ),
         
    //     ],
    //   ),
    // );

   return PageView.builder(
     physics: const BouncingScrollPhysics(),
    
          itemCount: userdata.length,
          itemBuilder: (context,index){
            // print(userdata[index]["comment"]);
            // return Container(
            // color: _colors[index],
            // child: Text("Page : "+index.toString()),

              
            // );
         
            
            
           return  VideoPage(
            userdata[index]["Video_Link"],userdata[index]["Video_Name"],
           userdata[index]["User_Uid"],
           userdata[index]["User_Name"],
           userdata[index]["User_Photo"]
           );
          
          },
          onPageChanged: FirebaseAuth.instance.currentUser   == null
            ? (i) async {
                if (FirebaseAuth.instance.currentUser == null) {
                  await showModalBottomSheet(
                    shape: const OutlineInputBorder(
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
          scrollDirection: Axis.vertical,
          // physics: BouncingScrollPhysics(),
         
          );
  }
}

class VideoPage extends StatefulWidget {
  final String video;
  final String image;
  final String videouid;
  final String Username;
  final String userphoto;
  // final int? pageIndex;
  // final int? currentPageIndex;
  // final bool? isPaused;
  // final bool? isFollowing;

  VideoPage(this.video,this.image,this.videouid,this.Username,this.userphoto);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> with RouteAware {
  late VideoPlayerController _controller;
  bool initialized = false;
  bool isLiked = false;




  final LocalStorage storage = new LocalStorage('user');
  var uid;
  var comment=0;

  @override
  void initState() {
    super.initState();
    print("data"+widget.video);
    _controller = VideoPlayerController.network(widget.video)
      ..initialize().then((value) {
        setState(() {
          _controller.setLooping(true);
          initialized = true;
        });
        _controller.play();

      });
      //  chkcomment();
      // getDocs();
  }

  chkcomment(){
    DatabaseReference userRef =
        FirebaseDatabase.instance.reference().child('Videos').child(widget.videouid).child(widget.image.toString().substring(0,widget.image.toString().length-5));
    final data = userRef.child("comment").once().then((snapshot){
      if(snapshot.snapshot.value!=null){
      var values = snapshot.snapshot.value as Map;
      values.values.forEach((element) {
        comment+=1;
      });
      }
      setState(() {
        
      });
    }); 


  }
     @override
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'WAtch This video on Blingo',
        linkUrl: 'https://blingo.page.link/MEGs',
        chooserTitle: 'Example Chooser Title');
        // print("share");
  }
   @override
  Future<void> share1() async {
  final uri = Uri.parse("https://th.bing.com/th/id/OIP.vZXC16lEn6jvJhhFBGKi6AHaEn?w=272&h=180&c=7&r=0&o=5&pid=1.7");
  final res = http.get(uri);


  }
  @override
  void didPopNext() {
    // print("didPopNext");
    _controller.play();

    super.didPopNext();
  }

  @override
  Future<void> didPushNext() async {
    // print("didPushNext");
    _controller.pause();
    uid = await storage.getItem("useruid'");
    // print("user");
    super.didPushNext();
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute<dynamic>); //Subscribe it here
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _controller.dispose();
    super.dispose();
  }

// Future getDocs() async {
// //   QuerySnapshot snap = await 
// //    FirebaseFirestore.instance.collection('collection').get();
// // snap.forEach((document) {
// //     print(document.documentID);
// //   });
// // final  cd = FirebaseFirestore.instance.collection("Videos");
// //  cd.get().then((value){
// //     print(value.data());
//     // final userCredentials = await FirebaseFirestore.instance
//     //     .collection("Videos")
//     //     .doc(FirebaseAuth.instance.currentUser!.uid)
//     //     .collection("")
//     //     .get();
//   //  var  phonee1 = userCredentials.data()!["phone"];
//   // var   namee1 = userCredentials.data()!["name"];
//     // print("object ${userCredentials.data()}");


//     var  db =await FirebaseDatabase.instance.ref("Videos").child(FirebaseAuth.instance.currentUser!.uid)
//     .once().then(( snapshot){
//     // print(snapshot.snapshot.value);
//     var db1 = snapshot.snapshot.value as Map;
//     for(var i=0;i<db1.length;i++){
//       // print(db1.values.toList()[i]["User_Uid"]);
//         // print(db1.values.toList()[i]["Video_Link"]);
//           // print(db1.values.toList()[i]["User_Uid"]);
//       // print(db1.length);
     
    
//       // for(var j=0;j<db1.length;j++){
//       //   print(db1[j]["User_Uid"]);

//       //   print(db1[j]["Video_Link"]);

//       // }
//     }

//   });

//     // print(db.value);
  


// }


likenow() async {
     DatabaseReference db =
        FirebaseDatabase.instance.reference().child("Videos");

    
    await db
        .child(widget.videouid.toString())
        .child(widget.image.toString().substring(0, widget.image.toString().length - 5))
        .child("comment")
        .child(widget.key.toString())
        .update({
      "comment": com.text,
      "user_uid": FirebaseAuth.instance.currentUser!.uid,
      "Video_Name": widget.image.toString().substring(0, widget.image.toString().length - 5),
      "Comment_User_Uid": FirebaseAuth.instance.currentUser!.uid,
      "Comment_Id":widget.key,
      "User_Photo": FirebaseAuth.instance.currentUser!.photoURL,
     
      "User_Name":FirebaseAuth.instance.currentUser!.displayName 
    });

}

  @override
  Widget build(BuildContext context) {
    if( initialized==false){
      return SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
      
            children: [
            Center(
              child: Container(
                // height: 100,
                child: CircularProgressIndicator(
                      backgroundColor: Colors.redAccent,
                      valueColor: AlwaysStoppedAnimation(Colors.green),
                      strokeWidth: 5,
                      
                    ),
              ),
            ),
            ],
          ),
        ),
      );
    }
    // if (widget.pageIndex == widget.currentPageIndex &&
    //     !widget.isPaused! &&
    //     initialized) {
    //   _controller.play();
    // } else {
    //   _controller.pause();
    // }
    // var locale = AppLocalizations.of(context)!;
//    if (_controller.value.position == _controller.value.duration) {
//      setState(() {
//      });
//    }
    // if (widget.pageIndex == 2) _controller.pause();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      
      body: 
      // initialized==false?
      // Container()
      Stack(
      
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            },
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : const SizedBox.shrink(),
          ),
          Positioned.directional(
            textDirection:  Directionality.of(context),
           
           bottom: 80.0,
             child: Container(
              margin: EdgeInsets.all(10),
              child: Text(widget.Username,style: TextStyle(color: Colors.black,fontSize: 2),))),
          Positioned.directional(
            textDirection: Directionality.of(context),
            end: -10.0,
            bottom: 80.0,
            child: Column(
              children: <Widget>[
                // Text("Hello"),
                //  Text("Hello"), Text("Hello"), Text("Hello"), Text("Hello"), Text("Hello"), Text("Hello"), Text("Hello"), Text("Hello"), Text("Hello"), Text("Hello"), Text("Hello"), Text("Hello"),
                InkWell(
                  // onTap: () {
                  //   _controller.pause();
                  //   Navigator.pushNamed(context, PageRoutes.userProfilePage);
                  // },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.userphoto)),
                  // child: const CircleAvatar(
                  //     backgroundImage: NetworkImage("${widget.userphoto.toString()}")),
                ),
                CustomButton(
                  Icon(
                    Icons.favorite,
                    color: isLiked ? mainColor : secondaryColor,
                  ),
                  '8.2k',
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                CustomButton(
                    Icon(
                      Icons.chat_bubble,
                      color: secondaryColor,
                    ),
                    comment.toString(), onPressed: () {
                      // print(widget.image);
                      chkcomment();
                  commentSheet(context,widget.image,widget.videouid);
                }),
                //  CustomButton(
                //   ImageIcon(
                //     const AssetImage('assets/icons/ic_views.png'),
                //     color: secondaryColor,
                //   ),
                //   '1.2k',onPressed: getDocs,

                  
                // ),
                
                CustomButton(
                  ImageIcon(
                    const AssetImage('assets/icons/ic_views.png'),
                    color: secondaryColor,
                  ),
                  '1.2k',onPressed: share,

                  
                ),
                 CustomButton(
                    Icon(
                      Icons.add,
                      color: secondaryColor,
                    ),
                    '287', onPressed: () {
                 Navigator.push(context, 
                 MaterialPageRoute(builder: (context)=>UploadVideo())
                 );
                }),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                //   child: RotatedImage(""),
                // ),
              ],
            ),
          ),
          // widget.isFollowing!
          //     ? Positioned.directional(
          //         textDirection: Directionality.of(context),
          //         end: 27.0,
          //         bottom: 320.0,
          //         child: GestureDetector(
          //           onTap: (){
          //             // UploadVideo();
          //           },
          //           child: CircleAvatar(
          //               backgroundColor: mainColor,
          //               radius: 8,
          //               child: Icon(
          //                 Icons.add,
          //                 color: secondaryColor,
          //                 size: 12.0,
          //               )),
          //         ),
          //       )
          //     : const SizedBox.shrink(),
          // const Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //       padding: EdgeInsets.only(bottom: 60.0),
          //       child: LinearProgressIndicator(
          //           //minHeight: 1,
          //           )),
          // ),
          // Positioned.directional(
          //   textDirection: Directionality.of(context),
          //   start: 12.0,
          //   bottom: 72.0,
          //   child: RichText(
          //     text: TextSpan(children: [
          //       TextSpan(
          //           text: '@emiliwilliamson\n',
          //           style: Theme.of(context).textTheme.bodyText1!.copyWith(
          //               fontSize: 16.0,
          //               fontWeight: FontWeight.bold,
          //               letterSpacing: 0.5)),
          //       TextSpan(text: locale.comment8),
          //       TextSpan(
          //           text: '  ${locale.seeMore}',
          //           style: TextStyle(
          //               color: secondaryColor.withOpacity(0.5),
          //               fontStyle: FontStyle.italic))
          //     ]),
          //   ),
          // )
          // FutureBuilder(builder:(context,snapshot){
          //   return Text((""));
            
          // },
          // future: chkcomment(),
          // )
        ],
      ),
    );
  }
}

