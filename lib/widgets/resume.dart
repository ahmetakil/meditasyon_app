import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:meditasyon_app/screens/meditation_screen.dart';

import '../providers/lesson_provider.dart';
import '../repository/user_repository.dart';

import '../models/lesson.dart';
import '../models/user.dart';

class Resume extends StatelessWidget {
  final User user;

  Resume(this.user);
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayer audioPlayer2 = AudioPlayer();


  @override
  Widget build(BuildContext context) {
    UserRepository userRepository;
    Lesson lastLesson = LessonProvider.lessons[0];

    return InkWell(
      onTap: () {
       Navigator.of(context).pushNamed(MeditationScreen.route,arguments: lastLesson);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Kaldığın Yerden Devam Et",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      lastLesson.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        child: Text(
                          lastLesson.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                        alignment: Alignment.topLeft),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10),
                    child: Align(
                      child: Text(
                        lastLesson.authorName,
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 45),
                    child: Align(
                      child: Text(
                        "%${lastLesson.progress.toString()} tamamlandı",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
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
