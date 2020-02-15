import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meditasyon_app/models/sounds_list_model.dart';
import 'package:meditasyon_app/repository/sound_list_repository.dart';
import 'package:meditasyon_app/screens/player.dart';
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
  dynamic lessonId;
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
                    return Center(
                        child: SpinKitDoubleBounce(
                      size: 48,
                      color: Colors.blue,
                    ));
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
