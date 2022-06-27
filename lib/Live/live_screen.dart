import 'package:blingo2/BottomNavigation/Explore/search_users.dart';
import 'package:blingo2/Live/audience_view.dart';
import 'profile.dart';
import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  _WatchLiveState createState() => _WatchLiveState();
}

class _WatchLiveState extends State<LivePage> {
  Profile? users;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(7, 13, 25, 1),
      appBar: AppBar(
        title: const Text(
          'Watch Live ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(7, 13, 25, 1),
      ),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Profile.users.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Audience(
                              channelName: Profile.channelName[index]))),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: <Widget>[
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          Container(
                            height: 90,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.grey,
                            )),
                            child: Image.asset(
                              Profile.userImages[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                Profile.users[index],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Text(
                                'Channel Name: ' + Profile.channelName[index],
                                style: const TextStyle(color: Colors.white70),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
