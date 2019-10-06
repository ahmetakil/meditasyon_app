import 'package:flutter/material.dart';
import '../repository/user_repository.dart';

import '../models/lesson.dart';
import '../models/user.dart';

class Resume extends StatelessWidget {
  final User user;

  Resume(this.user);


  @override
  Widget build(BuildContext context) {

    UserRepository userRepository;
    Lesson lastLesson = userRepository.getLastLesson();


    return Column(
      children: <Widget>[
        Text("Kaldığın Yerden Devam Et"),
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(lastLesson.name),
                Text(lastLesson.authorName),
                SizedBox(height: 10,),
                Text("%${lastLesson.progress.toString()} tamamlandı")
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(userRepository.getLastLesson().imageUrl),
            ),
          ],
        ),
      ],
    );
  }
}
