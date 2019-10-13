import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:meditasyon_app/providers/lesson_provider.dart';
import 'package:meditasyon_app/screens/home_page.dart';
import 'package:meditasyon_app/screens/player.dart';
import 'package:meditasyon_app/widgets/filter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../utils/utils.dart';
import '../widgets/meditation_tile.dart';
import '../models/lesson.dart';
import '../models/meditasyon.dart';

class MeditationScreen extends StatefulWidget {
  static const route = "/meditation-screen";

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  PanelController slidingUpController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final LessonProvider lessonProvider = Provider.of<LessonProvider>(context);

    var size = MediaQuery.of(context).size;
    Meditasyon example = Meditasyon(
      id: DateTime.now().toIso8601String(),
      name: "Nefes Meditasyonu",
      path:
          "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_700KB.mp3",
      progress: 100,
      isDownloaded: false,
      totalDuration: Duration(minutes: 3, seconds: 55),
    );
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;

    return ChangeNotifierProvider.value(
      value: LessonProvider(),
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: SlidingUpPanel(
            controller: slidingUpController,
            maxHeight: MediaQuery.of(context).size.height,
            minHeight: 70,
            renderPanelSheet: false,
            panel: AudioPlayerPage(),
            collapsed: CollapsedPlayer(radius),
            borderRadius: radius,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ProgressBar(LessonProvider.lessons[0].progress),
                ...LessonProvider.lessons[0].content
                    .map((Meditasyon m) => MeditationTile(m))
                    .toList()
              ],
            ),
          ),
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
      padding: const EdgeInsets.only(left: 2.0, right: 2, bottom: 2),
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
                    padding: const EdgeInsets.only(
                        left: 20, top: 7, bottom: 7, right: 20),
                    child: FractionallySizedBox(
                      widthFactor: progress / 100,
                      child: Container(
                        height: 36,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                      child: Text(
                        "%$progress",
                        style: TextStyle(fontSize: 18),
                      ),
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
                  shape: BoxShape.circle, gradient: PURPLE_GRADIENT_VERTICAL),
              child: Icon(
                Icons.cloud_download,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CollapsedPlayer extends StatelessWidget {
  final BorderRadiusGeometry radius;

  CollapsedPlayer(this.radius);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        gradient: LinearGradient(
          colors: [
            Color(0xFFAF60FE),
            Color(0xFF4907F4),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.pause,
              color: Colors.white,
              size: 32,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Pelin perili",
                style: TextStyle(color: Colors.white),
              ),
              Text("Düşünceleri susturma",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_up,
            size: 32,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
