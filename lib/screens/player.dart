import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/meditasyon.dart';
import 'package:meditasyon_app/repository/audio_repository.dart';
import 'package:meditasyon_app/widgets/playing_slider.dart';
import 'package:meditasyon_app/widgets/quarter.dart';
import 'package:rxdart/rxdart.dart';

import '../services/locator.dart';
import '../services/music_service.dart';
import '../utils/utils.dart';

class AudioPlayerPage extends StatefulWidget {

  static const route = "/player";

  AudioPlayerPage();

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  final double startingHeight = 20.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = Tween<double>(begin: startingHeight, end: 425)
        .animate(_controller);
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final musicService = locator<MusicService>();
    final Meditasyon _selected = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: _scaffoldKey,
      body: StreamBuilder<
              MapEntry<Duration, MapEntry<MeditasyonState, Meditasyon>>>(
          stream: Observable.combineLatest2(musicService.position,
              musicService.playerState, (a, b) => MapEntry(a, b)),
          builder: (BuildContext context,
              AsyncSnapshot<
                      MapEntry<Duration, MapEntry<MeditasyonState, Meditasyon>>>
                  snapshot) {
            final Duration _currentDuration = snapshot.data.key;
            final MeditasyonState _state = snapshot.data.value.key;
            final Meditasyon _current = snapshot.data.value.value;

            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return Column(
              children: <Widget>[
                AnimatedBuilder(
                  builder: (context, anim) {
                    return ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(w / 2),
                          bottomRight: Radius.circular(w / 2)),
                      child: Container(
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                                'https://www.onlygfx.com/wp-content/uploads/2017/03/blue-burst-abstract-bg.png',
                                fit: BoxFit.cover),
                            Positioned(
                                left: 8,
                                top: 32,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: new BorderRadius.all(
                                          new Radius.circular(50.0),
                                        ),
                                        border: new Border.all(
                                          color: Colors.transparent
                                              .withOpacity(0.5),
                                          width: 4.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Positioned(
                              bottom: 220,
                              left: MediaQuery.of(context).size.width / 2 - 84,
                              child: Text(
                                printDuration(_currentDuration),
                                style: TextStyle(
                                    fontSize: 72,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Positioned(
                              bottom: 50,
                              left: MediaQuery.of(context).size.width / 2 - 42,
                              child: Container(
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                    new Radius.circular(50.0),
                                  ),
                                  border: new Border.all(
                                    color: Colors.blue.withOpacity(0.4),
                                    width: 4.0,
                                  ),
                                ),
                                height: 84,
                                width: 84,
                                child: new Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: new BoxDecoration(
                                    color: const Color(0xff7c94b6),
                                    image: new DecorationImage(
                                      image: NetworkImage(
                                          "https://miro.medium.com/max/3150/1*mZ3xXbns5BiBFxrdEwloKg.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: new BorderRadius.all(
                                      new Radius.circular(50.0),
                                    ),
                                    border: new Border.all(
                                      color: Colors.blue,
                                      width: 4.0,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        height: animation.value,
                        color: Colors.amber,
                      ),
                    );
                  },
                  animation: _controller,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: ListTile(
                        title: Text(_selected.name),
                        subtitle: Text("Ahmet Akıl"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0),
                      child: NowPlayingSlider(),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              size: 36,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.skip_previous,
                              size: 36,
                            ),
                            onPressed: () {},
                          ),
                          FloatingActionButton(
                            child: _state == MeditasyonState.PLAYING
                                ? Icon(Icons.pause)
                                : Icon(Icons.play_arrow),
                            backgroundColor: Colors.blue,
                            onPressed: () {
                              switch (_state) {
                                case MeditasyonState.PLAYING:
                                    musicService.pauseMusic(_current);
                                  break;
                                case MeditasyonState.PAUSED:
                                    musicService.playMusic(_current);
                                  break;
                                default:
                                  break;
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.skip_next,
                              size: 36,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.cloud_queue,
                              size: 36,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext bc) {
                            return buildBottomSheet();
                          },
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 72,
                            height: 72,
                            child: QuarterCircle(
                              circleAlignment: CircleAlignment.bottomLeft,
                            ),
                          ),
                          Positioned(
                              bottom: 12,
                              left: 12,
                              child: Container(
                                width: 32,
                                height: 32,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/backmusicexample.png'),
                                ),
                              ))
                        ],
                      ),
                    )),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            );
          }),
    );
  }

  buildBottomSheet() {
    return Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Color(0xFFB565FF), Color(0xFF4806F4)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text("Arka Plan için Seç",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            SizedBox(
              height: 8,
            ),
            buildExampleBottomView(),
            buildExampleBottomView(),
            buildExampleBottomView(),
          ],
        ));
  }

  Row buildExampleBottomView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          width: 64,
          height: 64,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/backmusicexample.png'),
          ),
        ),
        Container(
          width: 64,
          height: 64,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/backmusicexample.png'),
          ),
        ),
        Container(
          width: 64,
          height: 64,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/backmusicexample.png'),
          ),
        ),
        Container(
          width: 64,
          height: 64,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/backmusicexample.png'),
          ),
        )
      ],
    );
  }
}
