import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/meditasyon.dart';

class AudioRepository with ChangeNotifier{

  String name;
  AudioPlayer audioPlayer;


  AudioRepository(){
    audioPlayer = new AudioPlayer();
  }

  AudioPlayer get player{
    return audioPlayer;
  }

   void play(Meditasyon m){
    audioPlayer.play(m.path,isLocal: m.isDownloaded);
    m.setState(MeditasyonState.PLAYING);
    notifyListeners();
  }

  void pause(Meditasyon m){

    audioPlayer.pause();
    m.setState(MeditasyonState.WAITING);
    notifyListeners();
  }

  void stop(Meditasyon m){
    audioPlayer.stop();
    notifyListeners();
  }


}