import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:blingo2/Components/entry_field.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:blingo2/Theme/colors.dart';

class Comment {
  final String? image;
  final String? name;
  final String? comment;
  final String? time;

  Comment({this.image, this.name, this.comment, this.time});
}

var userget1;

TextEditingController com = TextEditingController();
void commentSheet(BuildContext context, image, videouid) async {
  var locale = AppLocalizations.of(context)!;

  var userget = [];

 var  comments = [
    // Comment(
    //   image: 'assets/user/user4.png',
    //   name: 'Emila Wattson',
    //   comment: locale.comment4,
    //   time: ' 2' + locale.dayAgo!,
    // ),
  ];



  sendComment() async {
    userget1 = FirebaseAuth.instance.currentUser!.uid;

  DateTime today = DateTime.now();
String dateStr = "${today.day}-${today.month}-${today.year}";
String Time = "${today.hour}-${today.minute}-${today.second}";

print(dateStr); 

    // print(com.text);
    // print(image.toString());

    DatabaseReference db =
        FirebaseDatabase.instance.reference().child("Videos");

    var key = db
        .child(videouid.toString())
        .child(image.toString().substring(0, image.toString().length - 5))
        .push();
    await db
        .child(videouid.toString())
        .child(image.toString().substring(0, image.toString().length - 5))
        .child("comment")
        .child(key.key.toString())
        .update({
      "comment": com.text,
      "user_uid": FirebaseAuth.instance.currentUser!.uid,
      "Video_Name": image.toString().substring(0, image.toString().length - 5),
      "Comment_User_Uid": FirebaseAuth.instance.currentUser!.uid,
      "Comment_Id": key.key,
      "User_Photo": FirebaseAuth.instance.currentUser!.photoURL,
      "Time":Time,
      "Date": dateStr,
      "User_Name":FirebaseAuth.instance.currentUser!.displayName ,
     
    });
  }

 getcomment()async {
    comments=[];
    // print(videouid);
    var data = [];
    DatabaseReference db =
     await   FirebaseDatabase.instance.reference().child("Videos");
    var com1 =   await  db
        .child(videouid.toString())
        .child(image.toString().substring(0, image.toString().length - 5))
        .child("comment")
        .once().then((snapshot) async {
          // print(snapshot.snapshot.value);
           var values = snapshot.snapshot.value as Map;
         

           var datachk = await values.values.toList();
          //  comments.add(data);
          //  print(comments);
          for(var i=0;i<datachk.length;i++){
            // print(datachk[i]);
            // data.add(datachk[i]);
            comments.add(datachk[i]);
          //   UserModel2 today_comment = UserModel2(
          // datachk[i]['Comment_User_Uid'],
          // datachk[i][' Comment_Id'],
          // datachk[i][' comment'],
          // datachk[i][' Video_Name'],
          // datachk[i]['user_uid'],
          //   );
            // comments.add(today_comment);
          }
        

        });
          //  print(comments);
         
          return comments;
  }
    user() async {
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    //  print(data.data());
    //  getcomment();

    return [data.data()];
  }

  await showModalBottomSheet(
      // enableDrag: false,
      isScrollControlled: true,
      backgroundColor: backgroundColor,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          borderSide: BorderSide.none),
      context: context,
      builder: (context) => Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Stack(
              children: <Widget>[
                
                SingleChildScrollView(
                  child: FadedSlideAnimation(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            locale.comments!,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: lightTextColor),
                          ),
                        ),
                       
                              ]),
                    beginOffset: Offset(0, 0.3),
                    endOffset: Offset(0, 0),
                    slideCurve: Curves.linearToEaseOut,
                  ),
                ),
                Container(
                  
                )
                ,
             
                 FutureBuilder(
                  future: getcomment(),
                  builder: (context, snapshot) {
                    // print(snapshot.data);
      
                    if (snapshot.hasData) {
                      // print(snapshot.data );
                      var data = snapshot.data as List;
                      print(data.length);
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context,index){
                          print(DateTime.now().day  );
                          return Container(
                            margin: index== 0 ?  EdgeInsets.only(top:40):EdgeInsets.only(top:0),
                            child: Column(
                              children: [
                                ListTile(
                                  leading:CircleAvatar(
                                backgroundImage: NetworkImage(
                                    // FirebaseAuth.instance.currentUser!.photoURL!
                                    data[index]["User_Photo"]),
                                
                              ) ,
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text( data[index]["User_Name"],style: TextStyle(fontSize: 11),),
                                  Text(data[index]["comment"],style: TextStyle(fontWeight: FontWeight.bold),),
                                data[index]["Date"].toString().substring(0,2) == DateTime.now().day.toString() 
                                ?  
                                
                                 Text(data[index]["Time"].toString().substring(0,5),style: TextStyle(fontSize: 11),)
                                :
                                Text(data[index]["Date"].toString().substring(0,5),style: TextStyle(fontSize: 11),)
                                
                                ],
                              ),
                                )
                              ],
                            ));
                        });
                    } else {}
                    return Container();
                  },
                ),
                FutureBuilder(
                  future: user(),
                  builder: (context, snapshot) {
                    // print(snapshot.data);
                    if (snapshot.hasData) {
                      // print(snapshot.data );
                      var data = snapshot.data as List;
                      // print(data[0]["photoUrl"]);
                      return Align(
                          alignment: Alignment.bottomCenter,
                          child: EntryField(
                            counter: null,
                            controller: com,
                            padding: EdgeInsets.zero,
                            hint: locale.writeYourComment,
                            fillColor: darkColor,
                            prefix: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    // FirebaseAuth.instance.currentUser!.photoURL!
                                    data[0]["photoUrl"]),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                sendComment();
                                // print(snapshot.data );
                              },
                              child: Icon(
                                Icons.send,
                                color: mainColor,
                              ),
                            ),
                          ));
                    } else {}
                    return Container();
                  },
                )
              ],
            ),
          ));
}
class UserModel2 {
  var Comment_User_Uid;
  var  Comment_Id;
  
  var  comment;
  var  Video_Name;
  var user_uid;
 

  UserModel2(this.Comment_User_Uid, this.Comment_Id, this.comment, this.Video_Name,
      this.user_uid, );
}
