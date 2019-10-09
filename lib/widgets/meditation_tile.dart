import 'package:flutter/material.dart';
import 'package:meditasyon_app/providers/lesson_provider.dart';
import 'package:meditasyon_app/repository/audio_repository.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

import '../screens/player.dart';
import '../models/meditasyon.dart';

class MeditationTile extends StatefulWidget {
  Meditasyon meditasyon;

  MeditationTile(this.meditasyon);

  @override
  _MeditationTileState createState() => _MeditationTileState();
}

class _MeditationTileState extends State<MeditationTile> {

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String output =
        "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";

    if (duration.inHours < 1) {
      return output.substring(3);
    }
    return output;
  }

  Duration _duration;
  Duration _position;

  @override
  void initState() {
    super.initState();
    _duration = new Duration();
    _position = new Duration();
  }

  @override
  Widget build(BuildContext context) {
    final lessonProvider = Provider.of<LessonProvider>(context);
    final ar = Provider.of<AudioRepository>(context);

    ar.player.onDurationChanged.listen( (Duration d) {
      setState(() {
        _duration = d;
      });
    });

    ar.player.onAudioPositionChanged.listen( (Duration d) {
      setState(() {
        _position = d;
      });
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(AudioPlayerPage.route,arguments: ar);
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
              setState(() {});
              setState(() {
                if (widget.meditasyon.state == MeditasyonState.WAITING) {
                  lessonProvider.muteAll();
                  ar.play(widget.meditasyon);
                } else {
                  ar.pause(widget.meditasyon);
                }
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                widget.meditasyon.state == MeditasyonState.PLAYING
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
              widget.meditasyon.stateText,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 3),
            Row(
              children: <Widget>[
                Text(
                  widget.meditasyon.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 6,
                ),
                if (widget.meditasyon.state == MeditasyonState.DONE)
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0xff4100F3),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.check, color: Colors.white, size: 18),
                    ),
                  )
              ],
            ),
            if (widget.meditasyon.state == MeditasyonState.PLAYING)
              Slider(
                  value: _position.inSeconds.toDouble(),
                  min: 0.0,
                  max: _duration.inSeconds.toDouble(),
              onChanged: (double value) {
                    setState(() {
                      Duration newDuration = Duration(seconds: value.toInt());
                      ar.player.seek(newDuration);
                    });
              },)
          ],
        ),
        trailing: Container(
          child: Text(
            _printDuration(widget.meditasyon.totalDuration),
          ),
        ),
      ),
    );
  }
}
