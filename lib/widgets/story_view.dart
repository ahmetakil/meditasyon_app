import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text('''2 Farklı meditasyonu profilime ekledim arkadaşlar.,
Sayfama girerek meditasyonları dinleyebilirsiniz.
#CalmMusic''', Colors.blueGrey),
      StoryItem.pageImage(NetworkImage(
          "https://isha.sadhguru.org/yoga/wp-content/uploads/2017/04/Science-of-Meditation-49951022-c.jpg")),
      StoryItem.pageImage(NetworkImage(
          "https://cdn.pixabay.com/photo/2017/04/08/22/26/meditation-2214532__340.jpg")),
      StoryItem.pageImage(NetworkImage(
          "https://cdn.mindful.org/how-to-meditate.jpg?q=80&fm=jpg&fit=crop&w=1920&h=1080")),
    ];
    return Material(
      child: StoryView(
        storyItems,
        controller: controller,
        inline: false,
        repeat: true,
      ),
    );
  }
}
