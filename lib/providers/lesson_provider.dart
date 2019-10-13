import 'package:flutter/cupertino.dart';

import '../models/lesson.dart';
import '../models/meditasyon.dart';

class LessonProvider with ChangeNotifier {
  static List<Lesson> _lessons = [
    Lesson(
        imageUrl:
            "https://www.onlygfx.com/wp-content/uploads/2017/03/blue-burst-abstract-bg.png",
        name: "Lesson dummy 1",
        authorName: "Ahmet",
        content: [
          Meditasyon(
            id: DateTime.now().toIso8601String(),
            name: "Nefes Meditasyonu",
            path: "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_700KB.mp3",
            progress: 100,
            isDownloaded: false,
            totalDuration: Duration(seconds: 27),
          ),
          Meditasyon(
            id: DateTime.now().toIso8601String(),
            name: "Düşüncelerini sil",
            progress: 2,
            path: "http://ccrma.stanford.edu/~jos/mp3/gtr-jazz-3.mp3",
            isDownloaded: false,
            totalDuration: Duration(seconds:19),
          ),
          Meditasyon(
            id: DateTime.now().toIso8601String(),
            name: "Düşüncelerini susturma",
            path: "https://ccrma.stanford.edu/~jos/mp3/cello.mp3",
            progress: 40,
            isDownloaded: false,
            totalDuration: Duration(seconds: 9),
          ),
        ],
        progress: 25),
    Lesson(
        imageUrl:
            "https://www.onlygfx.com/wp-content/uploads/2017/03/blue-burst-abstract-bg.png",
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
        progress: 25),
  ];

  void muteAll() {
    _lessons.forEach((Lesson s) {
      s.content.forEach((Meditasyon m) {
        m.setState(MeditasyonState.WAITING);
      });
    });
    notifyListeners();
  }

  static List<Lesson> get lessons {
    return [..._lessons];
  }
}
