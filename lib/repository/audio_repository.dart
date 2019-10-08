import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../models/meditasyon.dart';

class AudioRepository with ChangeNotifier{

  AudioPlayer audioPlayer;

  AudioRepository(){
    audioPlayer = new AudioPlayer();
  }

   void play(Meditasyon m){

    audioPlayer.play(m.path,isLocal: m.isDownloaded);
  }

  void pause(){

    audioPlayer.pause();
  }

  void stop(){
    audioPlayer.stop();
  }


}