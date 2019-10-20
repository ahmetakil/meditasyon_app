


enum MeditasyonState{
  PAUSED,PLAYING,WAITING
}

class Meditasyon{

  final String id;
  final String name;
  final String path; //Either url path or local file path (if downloaded)
  final int progress;
  String author;
  final Duration totalDuration;
  final bool isDownloaded;
   MeditasyonState state;

   Meditasyon({this.id,this.name,this.author="Author name",this.path,this.progress,this.totalDuration,this.isDownloaded,this.state = MeditasyonState.WAITING});

   void setState(MeditasyonState newState){
    this.state = newState;
  }

  bool get isCompleted {
     return progress >= 98;
}

  String get stateText{
     if(state == MeditasyonState.WAITING){
       return "Beklemede";
     }
     if(state == MeditasyonState.PLAYING){
       return "Çalıyor";
     }
     else{
       return "Hata";
     }
  }

}