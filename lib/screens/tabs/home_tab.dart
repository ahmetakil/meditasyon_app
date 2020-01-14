import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meditasyon_app/models/home_page_model.dart';
import 'package:meditasyon_app/models/lesson_model.dart';
import 'package:meditasyon_app/repository/homepage_repository.dart';
import 'package:meditasyon_app/widgets/featuredlessons.dart';
import 'package:meditasyon_app/widgets/last_lessons.dart';
import 'package:meditasyon_app/widgets/tags.dart';
import 'package:meditasyon_app/widgets/top_authors.dart';

import '../../widgets/resume.dart';
import '../../widgets/stories.dart';

class HomePageTab extends StatefulWidget {
  static const route = "/home";

  @override
  _HomePageTabState createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab>
    with AutomaticKeepAliveClientMixin {
  HomePageModel data;

  Future<HomePageModel> getData() async {
    data = await HomagePageRepository.index();
    setState(() {});
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
        child: Center(
          child: data == null
              ? SpinKitDoubleBounce(
                  size: 48,
                  color: Colors.blue,
                )
              : Container(
                  padding: EdgeInsets.only(left: 8),
                  width: double.infinity,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stories(data.stories),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Kaldığın Yerden Devam Et",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //TODO https://github.com/blackmann/story_view/issues/15 next-previous story olayı yapılacak
                          Resume(new LessonModel(
                              id: "18",
                              categoryId: "1",
                              createdAt: null,
                              deletedAt: null,
                              imageUrl: "https://i.hizliresim.com/r0oDz3.png",
                              isBackground: "",
                              name: "Enerji Dersleri",
                              progress: 45,
                              updatedAt: null,
                              userId: "Ali Anıl Koçak")),
                          FeaturedLessons(data.lastLessons),
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
                          // RaisedButton(
                          //   child: Text("LOGOUT"),
                          //   onPressed: () async {
                          //     if (await UserRepository.logout()) {
                          //       Navigator.of(context).pushReplacementNamed("/");
                          //     }
                          //   },
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
