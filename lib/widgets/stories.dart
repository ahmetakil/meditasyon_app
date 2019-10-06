import 'package:flutter/material.dart';
import 'dart:math';

import 'package:meditasyon_app/widgets/story_view.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
          ],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final List<Color> colors = [Colors.blueGrey, Colors.black, Colors.amber];
  final Random random = new Random();

  //TODO REPLACE COLOR WITH IMAGE
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => StoryPageView())),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blueAccent, width: 2),
          ),
          child: CircleAvatar(
            backgroundColor: colors[random.nextInt(colors.length)],
            radius: 36,
          ),
        ),
      ),
    );
  }
}
