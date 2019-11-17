import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/home_page_model.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatefulWidget {
  Story data;
  StoryPageView(this.data);
  _StoryPageViewState createState() => _StoryPageViewState();
}

class _StoryPageViewState extends State<StoryPageView> {
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text(widget.data.description, Colors.blueGrey),
    
    ];
    
    return Material(
      child: StoryView(
        storyItems,
        controller: controller,
        inline: false,
        repeat: false,
      ),
    );
  }
}
