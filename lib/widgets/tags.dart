import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:meditasyon_app/screens/meditation_screen.dart';

import '../providers/lesson_provider.dart';
import '../repository/user_repository.dart';

import '../models/lesson.dart';
import '../models/user.dart';

class Tags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(left: 8,bottom: 2),
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildItem("En iyiler"),
          _buildItem("Trendler"),
          _buildItem("Youtuber"),
          _buildItem("Ferahlık"),
          _buildItem("En iyiler"),
        ],
      ),
    );
  }

  Widget _buildItem(title) {
    return Container(
      margin: EdgeInsets.only(bottom:4.0,right: 8),
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            ),
        onPressed: () {},
        color: Color(0xFF0878F5),
        textColor: Colors.white,
        child: Text(title,
            style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
