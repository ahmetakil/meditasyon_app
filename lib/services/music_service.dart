import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import '../providers/lesson_provider.dart';

import '../models/meditasyon.dart';
import '../models/lesson.dart';

class MusicService {
  AudioPlayer _player;
  BehaviorSubject<Duration> _position;
  BehaviorSubject<bool> _isAudioSeeking;
  BehaviorSubject<MapEntry<MeditasyonState, Meditasyon>> _playerState;
  PublishSubject<Lesson> _lessons;

  BehaviorSubject<MapEntry<MeditasyonState, Meditasyon>> get playerState =>
      _playerState;

  BehaviorSubject<Duration> get position => _position;

  MusicService() {
    _initStreams();
    _initAudioPlayer();
  }

  void _initAudioPlayer() {
    _player = new AudioPlayer();
    _player.onAudioPositionChanged.listen((Duration duration) {
      if (!_isAudioSeeking.value) {
        updatePosition(duration);
      }
    });
  }

  void _initStreams() {
    _position = BehaviorSubject<Duration>.seeded(Duration(seconds: 1));
    _isAudioSeeking = BehaviorSubject<bool>.seeded(false);
    _playerState = BehaviorSubject<MapEntry<MeditasyonState, Meditasyon>>.seeded(MapEntry(MeditasyonState.PAUSED,Meditasyon(id: "1",name: "Kaldığın yerden devam et",path: "https://github.com/anars/blank-audio/blob/master/1-minute-of-silence.mp3",totalDuration: Duration(seconds: 1),isDownloaded: false,progress: 1)));
    _lessons = new PublishSubject<Lesson>();
    _lessons.add(Lesson(
        imageUrl:
            "https://www.onlygfx.com/wp-content/uploads/2017/03/blue-burst-abstract-bg.png",
        name: "Lesson dummy 1",
        authorName: "Ahmet",
        content: [
          Meditasyon(
            id: DateTime.now().toIso8601String(),
            name: "Nefes Meditasyonu",
            path:
                "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_700KB.mp3",
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
            totalDuration: Duration(seconds: 19),
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
        progress: 25));

    _lessons.add(Lesson(
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
        progress: 25));
  }

  void playMusic(Meditasyon m) {
    _player.play(m.path, isLocal: m.isDownloaded);
    updatePlayerState(MeditasyonState.PLAYING, m);
  }

  void pauseMusic(Meditasyon m) {
    _player.pause();
    updatePlayerState(MeditasyonState.PAUSED, m);
  }

  void stopMusic() {
    _player.stop();
  }

  void updatePlayerState(MeditasyonState state, Meditasyon m) {
    _playerState.add(MapEntry(state, m));
  }

  void updatePosition(Duration duration) {
    _position.add(duration);
  }

  void playPrevious(BuildContext context){

    Meditasyon current = _playerState.value.value;
    int currentIndex = LessonProvider.lessons[0].content.indexOf(current);

    if(currentIndex == 0){
      audioSeek(0);
      return;
    }

    Meditasyon previous = LessonProvider.lessons[0].content[currentIndex-1];

    stopMusic();
    playMusic(previous);
  }

  void playNext(BuildContext context){

    Meditasyon current = _playerState.value.value;
    int currentIndex = LessonProvider.lessons[0].content.indexOf(current);

    if(currentIndex == LessonProvider.lessons[0].content.length - 1){
      //TODO GO TO NEXT LESSON
      return;
    }

    Meditasyon next = LessonProvider.lessons[0].content[currentIndex+1];

    stopMusic();
    playMusic(next);
  }


  void invertSeekingState() {
    final _value = _isAudioSeeking.value;
    _isAudioSeeking.add(!_value);
  }

  void audioSeek(double seconds) {
    _player.seek(Duration(seconds: seconds.toInt()));
  }
}
