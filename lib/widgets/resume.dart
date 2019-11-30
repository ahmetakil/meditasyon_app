import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/home_page_model.dart';
import 'package:meditasyon_app/models/lesson_model.dart';
import 'package:meditasyon_app/screens/meditation_screen.dart';

import '../models/lesson.dart';
import '../models/user.dart';
import '../providers/lesson_provider.dart';
import '../repository/user_repository.dart';

class Resume extends StatelessWidget {
  final LessonModel data;

  Resume(this.data);
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayer audioPlayer2 = AudioPlayer();

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MeditationScreen.route, arguments: data.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://i.hizliresim.com/r0oDz3.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        child: Text(
                          data.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.white),
                        ),
                        alignment: Alignment.topLeft),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10),
                    child: Align(
                      child: Text(
                        data.userId,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 45),
                    child: Align(
                      child: Text(
                        "%${data.progress.toString()} tamamlandı",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
