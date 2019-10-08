import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:meditasyon_app/widgets/meditation_tile.dart';
import '../models/lesson.dart';
import '../models/meditasyon.dart';

class MeditationScreen extends StatelessWidget {
  static const route = "/meditation-screen";

  @override
  Widget build(BuildContext context) {
    final lesson = ModalRoute.of(context).settings.arguments as Lesson;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          ProgressBar(),
          ...lesson.content.map((Meditasyon m) => MeditationTile(m)).toList()
        ],
      ),
    );
  }
}

/*
FlatButton(
            child: Text("a"),
            onPressed: (){
              String url =
                  "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_5MG.mp3";
              audioPlayer.play(url);
              audioPlayer2.play("https://ccrma.stanford.edu/~jos/mp3/cello.mp3",volume: 0.15);
              audioPlayer2.setReleaseMode(ReleaseMode.LOOP);
            },
          )
 */
class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
