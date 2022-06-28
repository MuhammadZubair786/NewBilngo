import 'package:blingo2/Services/Firebasedynamic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LinkCheckPage extends StatefulWidget {
  const LinkCheckPage({ Key? key }) : super(key: key);

  @override
  State<LinkCheckPage> createState() => _LinkCheckPageState();
}

class _LinkCheckPageState extends State<LinkCheckPage> {
  @override


  var Link="";


  Future<void> callData() async {
      var  generate = await FirebaseDynamicLinkService.createDynamicLink("SPAvuFl9CLaHtaR1pJWyx6Ix0mP2");
 print(generate);
 setState(() {
   Link=generate;
 });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Text("Page For Generate Link",style: TextStyle(fontSize: 30,color: Colors.red),),
                ElevatedButton(onPressed: (){
                  callData();
                },
                 child: Text("Click")),

                 IconButton(onPressed: (){
                Clipboard.setData(ClipboardData(text: Link));
                 }
                 , icon: Icon(Icons.ac_unit))
              ],
            ),
          ],
        )
        
        ),

      
    );
  }
}