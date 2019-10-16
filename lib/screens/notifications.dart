import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text("Bugün"),
                  Text("30 Eylül 2019"),
                  Spacer(),
                  IconButton(icon: Icon(Icons.ac_unit),),
                  IconButton(icon: Icon(Icons.ac_unit),),
                  IconButton(icon: Icon(Icons.ac_unit),),
                  IconButton(icon: Icon(Icons.ac_unit),)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Merhaba 6 bildirimin var"),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.only(top: 20.0, bottom: 10),
                  child: ListView(
                    children: <Widget>[
                      _buildItem("Düşünce silme", "Anıl",
                          "https://cdn.pixabay.com/photo/2019/09/04/02/52/road-4450611_1280.jpg"),
                      _buildItem("Ruh Temizleme", "Anıl",
                          "https://cdn.pixabay.com/photo/2016/05/05/02/35/hot-air-ballons-1373167_1280.jpg"),
                      _buildItem("Nefes", "Anıl",
                          "https://cdn.pixabay.com/photo/2019/09/10/13/24/asia-4466113_1280.jpg"),
                      _buildItem("Ruh Temizleme", "Anıl",
                          "https://cdn.pixabay.com/photo/2016/05/05/02/32/balloon-1373161_1280.jpg"),
                      _buildItem("Düşünce silme", "Anıl",
                          "https://cdn.pixabay.com/photo/2019/09/25/15/57/dog-4504013_1280.jpg"),
                      _buildItem("Ruhunu Genişlet", "Anıl",
                          "https://cdn.pixabay.com/photo/2019/10/09/00/22/volcano-4536198_1280.jpg"),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildItem(title, subtitle, imgUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: 120.0,
          child: null,
        ),
      ],
    );
  }
}
