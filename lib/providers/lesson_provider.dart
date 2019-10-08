import 'package:flutter/cupertino.dart';

import '../models/lesson.dart';
import '../models/meditasyon.dart';

class LessonProvider with ChangeNotifier{

  static List<Lesson> _lessons = [
    Lesson(
      imageUrl: "https://www.onlygfx.com/wp-content/uploads/2017/03/blue-burst-abstract-bg.png",
      name: "Lesson dummy 1",
      authorName: "Ahmet",
      content: [
        Meditasyon(
          id: DateTime.now().toIso8601String(),
          name: "Nefes Meditasyonu",
          progress: 2,
          isDownloaded: false,
          totalDuration: Duration(minutes: 3,seconds: 55),
        ),
        Meditasyon(
          id: DateTime.now().toIso8601String(),
          name: "Düşüncelerini sil",
          progress: 2,
          isDownloaded: false,
          totalDuration: Duration(hours: 10,minutes: 22,seconds: 3),
        ),
      ],
      progress: 25
    ),
    Lesson(
        imageUrl: "https://www.onlygfx.com/wp-content/uploads/2017/03/blue-burst-abstract-bg.png",
        name: "Lesson dumm 2",
        authorName: "Mert",
        content: [
          Meditasyon(
            id: DateTime.now().toIso8601String(),
            name: "Med 1",
            progress: 2,
            isDownloaded: false,
            totalDuration: Duration(seconds: 10),
          ),
          Meditasyon(
            id: DateTime.now().toIso8601String(),
            name: "Med 1",
            progress: 2,
            isDownloaded: false,
            totalDuration: Duration(seconds: 10),
          ),
        ],
        progress: 25
    ),
  ];

  static List<Lesson> get lessons{
    return [..._lessons];
  }






}