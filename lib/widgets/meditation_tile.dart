import 'package:flutter/material.dart';

import '../models/meditasyon.dart';

class MeditationTile extends StatelessWidget {

  Meditasyon meditasyon;

  MeditationTile(this.meditasyon);

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String output = "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";

    if(duration.inHours < 1){
      return output.substring(3);
    }
    return output;
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 12.0),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(4,4),
                spreadRadius: 1,
                blurRadius: 4
              )
            ]
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.play_arrow,color: Colors.blue,),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Beklemede",style: TextStyle(fontSize: 16,color: Colors.grey),),
            SizedBox(height:3),
            Text(meditasyon.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
        trailing: Text(_printDuration(meditasyon.totalDuration)),
      ),
    );
  }
}
