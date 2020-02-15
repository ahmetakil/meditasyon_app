import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meditasyon_app/utils/utils.dart';

class Search_ extends StatelessWidget {
  static const route = "/search_";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Stories(),
                SearchBar(),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: SearchBody(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2, bottom: 2),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9),
                child: Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    gradient: PURPLE_GRADIENT,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "sanatçı ve içerik ara",
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SearchHistoryItem("Ali Anıl", "tag",
            "https://miro.medium.com/max/3150/1*mZ3xXbns5BiBFxrdEwloKg.jpeg"),
        SearchHistoryItem("Ali Anıl", "tag",
            "https://randomuser.me/api/portraits/women/63.jpg"),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text("Seçkin Sanatçılar"),
        ),
        TopAuthorsItem("Ali Anıl", "Seslendirmen",
            "https://randomuser.me/api/portraits/women/72.jpg"),
        TopAuthorsItem("Megan Hicks", "Hikaye anlatıcısı",
            "https://randomuser.me/api/portraits/women/10.jpg"),
        TopAuthorsItem("Amy Nichols", "Youtuber",
            "https://randomuser.me/api/portraits/men/50.jpg"),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text("En Çok Dinlenen Dersler"),
        ),
        MostLessonItem("Düşüncelerini Sil", "90.000 Dinleyici",
            "https://randomuser.me/api/portraits/women/23.jpg"),
        MostLessonItem("Sevginin Gücü", "90.000 Dinleyici",
            "https://randomuser.me/api/portraits/men/99.jpg"),
        MostLessonItem("Aşk Meşk", "90.000 Dinleyici",
            "https://randomuser.me/api/portraits/women/88.jpg"),
        MostLessonItem("Ver yanmasın", "90.000 Dinleyici",
            "https://randomuser.me/api/portraits/men/25.jpg"),
      ],
    );
  }
}

class SearchHistoryItem extends StatelessWidget {
  final String name;
  final String tag;
  final String imageUrl;

  SearchHistoryItem(this.name, this.tag, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('#$tag'),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}

class TopAuthorsItem extends StatelessWidget {
  final String name;
  final String tag;
  final String imageUrl;

  TopAuthorsItem(this.name, this.tag, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('#$tag'),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}

class MostLessonItem extends StatelessWidget {
  final String name;
  final String tag;
  final String imageUrl;

  MostLessonItem(this.name, this.tag, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('#$tag'),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
