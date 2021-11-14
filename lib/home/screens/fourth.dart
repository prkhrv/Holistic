// import 'package:fitness_app_megahack/Mental/Chatbot/dialog_flow.dart';
// import 'package:fitness_app_megahack/Mental/video/youtube.dart';
// import 'package:fitness_app_megahack/map/map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home/chat/chat.dart';
import 'package:flutter_app/home/mental_health/music.dart';

class Fourth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Fourth',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Center(child: Text('Mental Fitness')),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 200.0,
                  width: 300.0,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    image: DecorationImage(
                      image: new AssetImage('assets/Mental/mental.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                InkWell(
                    child: Container(
                      height: 140.0,
                      width: 410.0,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        image: DecorationImage(
                          image: new AssetImage('assets/Mental/motivation.png'),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => YoutubePlayerDemoApp()),
                      // );
                    }),
                Text('Motivational Video', style: TextStyle(fontSize: 23)),
                SizedBox(height: 20),
                InkWell(
                    child: Container(
                      height: 140.0,
                      width: 410.0,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        image: DecorationImage(
                          image: new AssetImage('assets/Mental/music.png'),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AudioApp()),
                      );
                    }),
                Text('Music Therapy', style: TextStyle(fontSize: 23)),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
