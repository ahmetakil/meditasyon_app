import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/home_page_model.dart';
import 'package:meditasyon_app/repository/homepage_repository.dart';
import 'package:meditasyon_app/repository/user_repository.dart';
import 'package:meditasyon_app/widgets/bottom_navigation.dart';
import 'package:meditasyon_app/widgets/featuredlessons.dart';
import 'package:meditasyon_app/widgets/last_lessons.dart';
import 'package:meditasyon_app/widgets/tags.dart';
import 'package:meditasyon_app/widgets/top_authors.dart';

import '../widgets/stories.dart';
import '../widgets/resume.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageModel data;
  Future<HomePageModel> getData() async {
    data = await HomagePageRepository.index();
    print(data.message);
    setState(() {
      
    });
    return data;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 8),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stories(data.stories),
                  Resume(null),
                  data == null ? Container() :  FeaturedLessons(data.lastLessons),
                  Tags(data.tags),
                  LastLessons(data.topLessonsWeekly),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "En iyi yayıncılar",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  TopAuthors(data.bestAuthors),
                  RaisedButton(
                    child: Text("LOGOUT"),
                    onPressed: () async {
                      if (await UserRepository.logout()) {
                        Navigator.of(context).pushReplacementNamed("/");
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationWidget());
  }
}
