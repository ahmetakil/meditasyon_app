import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/meditasyon.dart';

import '../repository/audio_repository.dart';

class AudioPlayers with ChangeNotifier{

  List<AudioRepository> _players = [];


  void addPlayer(AudioRepository ar){

    _players.add(ar);
    notifyListeners();

  }


}