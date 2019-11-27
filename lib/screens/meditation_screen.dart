import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/sounds_list_model.dart';
import 'package:meditasyon_app/providers/lesson_provider.dart';
import 'package:meditasyon_app/repository/sound_list_repository.dart';
import 'package:meditasyon_app/screens/player.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../models/meditasyon.dart';
import '../services/locator.dart';
import '../services/music_service.dart';
import '../utils/utils.dart';
import '../widgets/meditation_tile.dart';

class MeditationScreen extends StatefulWidget {
  static const route = "/meditation-screen";

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  int lessonId;
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  PanelController slidingUpController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Future getSoundList() async {

  //   print("IDDDDD" + lessonId.toString());
  //   data = await SoundListRepository.getSounds("18");

  //   print(data.sounds[0].name);
  // }

  @override
  void didChangeDependencies() {
    // getSoundList();
    lessonId = ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              FutureBuilder<SoundListModel>(
                future: SoundListRepository.getSounds(lessonId.toString()),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    // return ProgressBar(snapshot.data.progress) //Progress eklenecek
                    return ProgressBar(25);
                  } else {
                    return Text("");
                  }
                },
              ),
              FutureBuilder<SoundListModel>(
                future: SoundListRepository.getSounds(lessonId.toString()),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return Expanded(child: _buildListView(snapshot.data));
                  } else {
                    return Text("");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildListView(SoundListModel data) {
    return ListView.builder(
      itemCount: data.sounds.length,
      itemBuilder: (BuildContext context, int index) {
        Sounds currentModel = data.sounds[index];
        return MeditationTile(new Meditasyon(
            author: "Ahmet ",
            id: currentModel.id.toString(),
            isDownloaded: false,
            name: currentModel.name + " Rahatla" + index.toString(),
            path: BASE_MEDIA_URL + currentModel.url,
            progress: 5,
            state: MeditasyonState.WAITING,
            totalDuration: Duration(minutes: 4)));
      },
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
  final musicService = locator<MusicService>();

  CollapsedPlayer(this.radius);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MapEntry<MeditasyonState, Meditasyon>>(
        stream: musicService.playerState,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          final MeditasyonState state = snapshot.data.key;
          final Meditasyon currentMeditasyon = snapshot.data.value;

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
                  onPressed: () {
                    switch (state) {
                      case MeditasyonState.PLAYING:
                        musicService.pauseMusic(currentMeditasyon);
                        break;
                      case MeditasyonState.PAUSED:
                        musicService.playMusic(currentMeditasyon);
                        break;
                      default:
                        break;
                    }
                  },
                  icon: Icon(
                    state == MeditasyonState.PLAYING
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      currentMeditasyon.name ?? "<>",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(currentMeditasyon.author,
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
        });
  }
}
