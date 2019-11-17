import 'package:flutter/material.dart';
import 'dart:math';
import 'package:meditasyon_app/models/home_page_model.dart';
import 'package:meditasyon_app/widgets/story_view.dart';

class Stories extends StatefulWidget {
  List<Story> data;
  Stories(this.data);
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.data.length, itemBuilder: (BuildContext context, int index) {
            return Avatar(widget.data[index]);
          },
        ),
      ),
    );
  }
}

class Avatar extends StatefulWidget {
  Story itemData;
  Avatar(this.itemData);
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final List<Color> colors = [Colors.blueGrey, Colors.black, Colors.amber];

  final Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => StoryPageView(widget.itemData))),
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
