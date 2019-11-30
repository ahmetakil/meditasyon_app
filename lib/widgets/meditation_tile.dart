import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meditasyon_app/services/music_service.dart';

import './playing_slider.dart';
import '../screens/player.dart';
import '../services/locator.dart';
import '../models/meditasyon.dart';
import '../utils/utils.dart';

class MeditationTile extends StatelessWidget {
  Meditasyon meditasyon;

  
  MeditationTile(this.meditasyon);

  @override
  Widget build(BuildContext context) {

    final musicService = locator<MusicService>();

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
        child: StreamBuilder<MapEntry<MeditasyonState, Meditasyon>>(
            stream: musicService.playerState,
            builder: (context, snapshot) {

              if (!snapshot.hasData) {
                return SpinKitDoubleBounce(
                  size: 48,
                  color: Colors.blue,
                );
              }

              final MeditasyonState _state = snapshot.data.key??MeditasyonState.WAITING;
              final Meditasyon _current = snapshot.data.value;


              return ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(AudioPlayerPage.route,arguments: meditasyon);
                },
                leading: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: Offset(4, 4),
                        spreadRadius: 1,
                        blurRadius: 4)
                  ]),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      switch (_state) {
                        case MeditasyonState.PLAYING:
                          if (_current == meditasyon) {
                            musicService.pauseMusic(_current);
                          } else {
                            musicService.stopMusic();
                            musicService.playMusic(meditasyon);
                          }
                          break;
                        case MeditasyonState.PAUSED:
                          if (_current == meditasyon) {
                            musicService.playMusic(_current);
                          } else {
                            musicService.stopMusic();
                            musicService.playMusic(meditasyon);
                          }
                          break;
                        default:
                          break;
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        _state == MeditasyonState.PLAYING && _current == meditasyon
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      meditasyon.isCompleted ? "Tamamlandı" : meditasyon.stateText,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: <Widget>[
                        Text(
                          meditasyon.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        if (meditasyon.isCompleted)
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Color(0xff4100F3),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Icon(Icons.check,
                                  color: Colors.white, size: 18),
                            ),
                          )
                      ],
                    ),
                    if (_state == MeditasyonState.PLAYING && _current == meditasyon)
                      NowPlayingSlider(),
                  ],
                ),
                trailing: Container(
                  child: Text(
                    printDuration(meditasyon.totalDuration),
                  ),
                ),
              );
            }));
  }
}
