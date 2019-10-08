
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:meditasyon_app/repository/audio_repository.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../widgets/meditation_tile.dart';
import '../models/lesson.dart';
import '../models/meditasyon.dart';

class MeditationScreen extends StatelessWidget {
  static const route = "/meditation-screen";

  @override
  Widget build(BuildContext context) {
    final lesson = ModalRoute.of(context).settings.arguments as Lesson;

    return ChangeNotifierProvider.value(
      value: AudioRepository(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.lightBlue,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon:Icon(Icons.close),color: Colors.blue,onPressed: () {
            Navigator.of(context).pop();
          },),
        ),
        body: Column(
          children: <Widget>[
            ProgressBar(lesson.progress),
            ...lesson.content.map((Meditasyon m) => MeditationTile(m)).toList()
          ],
        ),
      ),
    );
  }
}


class ProgressBar extends StatelessWidget {

  final int progress;

  ProgressBar(this.progress);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      gradient: PURPLE_GRADIENT,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left:20,top:7,bottom:7,right:20),
                    child: FractionallySizedBox(
                      widthFactor: progress/100,
                      child: Container(
                        height: 36,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 32,
                    child: Container(
                      child:Text("%$progress",style: TextStyle(fontSize: 18),),
                    ),
                  )
                ],
              ),
            ),
          ),
          CircleAvatar(
            //TODO DOWNLOAD BUTTON
            radius: 24,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: PURPLE_GRADIENT_VERTICAL
              ),
              child: Icon(Icons.cloud_download,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
