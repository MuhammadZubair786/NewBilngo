import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class ShowLink extends StatefulWidget {
  // const ShowLink({ Key? key }) : super(key: key);
  var link;
  ShowLink(this.link);

  @override
  State<ShowLink> createState() => _ShowLinkState(link);
}

class _ShowLinkState extends State<ShowLink> {
  var link;
  _ShowLinkState(this.link);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  FlutterClipboard.copy(link).then((value){print(link);});
                }),
          ),
        ));
  }
}
