import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meditasyon_app/models/lesson_model.dart';
import 'package:meditasyon_app/models/lessons_from_tag_model.dart';
import 'package:meditasyon_app/repository/lessons_repository.dart';
import 'package:meditasyon_app/widgets/resume.dart';

class LessonsTag extends StatefulWidget {
  static const route = "/lessons-tag";

  @override
  _LessonsTagState createState() => _LessonsTagState();
}

class _LessonsTagState extends State<LessonsTag> {
  int tagId;

  @override
  void didChangeDependencies() {
    tagId = ModalRoute.of(context).settings.arguments;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Bugün",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 4,
                      ),
                      Text("30 Eylül 2019",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.delete),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.cloud_download),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.mic),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.send)
                ],
              ),
            ),
            FutureBuilder<LessonModelTag>(
              future: LessonsRepository.getLessonsFromTag(tagId.toString()),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: SpinKitDoubleBounce(
                    size: 48,
                    color: Colors.blue,
                  ));
                } else if (snapshot.hasData) {
                  return Expanded(child: _buildListView(snapshot.data.lessons));
                } else {
                  return Text("");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildListView(List<LessonModel> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        LessonModel currentModel = data[index];
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 16.0),
          child: Resume(currentModel),
        );
      },
    );
  }
}
