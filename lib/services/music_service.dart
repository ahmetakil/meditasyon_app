import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

import '../models/meditasyon.dart';

class MusicService {
  AudioPlayer _player;
  BehaviorSubject<Duration> _position;
  BehaviorSubject<bool> _isAudioSeeking;
  BehaviorSubject<MapEntry<MeditasyonState, Meditasyon>> _playerState;

  BehaviorSubject<MapEntry<MeditasyonState, Meditasyon>> get playerState =>  _playerState;
  BehaviorSubject<Duration> get position =>  _position;


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
    _playerState =
        BehaviorSubject<MapEntry<MeditasyonState, Meditasyon>>.seeded(
      MapEntry(
        MeditasyonState.PAUSED,
        Meditasyon(id: "1",name: "t",path: "https://github.com/anars/blank-audio/blob/master/1-minute-of-silence.mp3",totalDuration: Duration(seconds: 1),isDownloaded: false,progress: 1),
      ),
    );
  }

  void playMusic(Meditasyon m) {
    _player.play(m.path,isLocal: m.isDownloaded);
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

  void updatePosition(Duration duration){
    _position.add(duration);
  }

  void invertSeekingState() {
    final _value = _isAudioSeeking.value;
    _isAudioSeeking.add(!_value);
  }

  void audioSeek(double seconds) {
    _player.seek(Duration(seconds:seconds.toInt()));
  }
}
