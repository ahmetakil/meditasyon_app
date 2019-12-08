import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/lesson_model.dart';
import 'package:meditasyon_app/models/profileDatasModel.dart';
import 'package:meditasyon_app/repository/profile_repository.dart';
import 'package:meditasyon_app/utils/utils.dart';
import 'package:meditasyon_app/widgets/outline_button.dart';
import 'package:meditasyon_app/widgets/resume.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>
    with SingleTickerProviderStateMixin {
  List<bool> selectedIndex = [true, false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<ProfileModel>(
      future: ProfileRepository.index(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildBody(context, snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  Widget buildBody(BuildContext context, ProfileModel data) {
    return Container(
      padding: EdgeInsets.only(top: 48, left: 24, right: 24),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ClipOval(
                      child: Image.network(
                        IMAGE_BASE_URL + data.user.profilePicture,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(data.user.completedLessons.length.toString(),
                        style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.blue, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("Ders Bitti",
                        style: Theme.of(context).textTheme.subtitle)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(data.user.point.toString(),
                        style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.blue, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("Puan", style: Theme.of(context).textTheme.subtitle)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(data.user.ranking.toString(),
                        style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.blue, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Sıralamada",
                      style: Theme.of(context).textTheme.subtitle,
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data.user.name,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Hakkında bilgi yok",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  OutlineButtonWidget("Profili düzenle", 180, 0)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height:28,
                    margin: EdgeInsets.only(left: 1),

                    child: new OutlineButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.blue,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(12)),
                      textColor: Colors.blue,
                      child: Text('Bitirdiklerim'),
                      borderSide: BorderSide(
                          color: Colors.blue, style: BorderStyle.solid, width: 1),
                      onPressed: () {
                        setState(() {
                          selectedIndex = [true, false, false];
                        });
                      },
                    ),
                  ),
                  Container(
                    height:28,
                    child: new OutlineButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.blue,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(12)),
                      textColor: Colors.blue,
                      child: Text('Favorilerim'),
                      borderSide: BorderSide(
                          color: Colors.blue, style: BorderStyle.solid, width: 1),
                      onPressed: () {
                        setState(() {
                          selectedIndex = [false, true, false];
                        });
                      },
                    ),
                  ),
                  Container(
                    height:28,
                    margin: EdgeInsets.only(right: 1),
                    child: new OutlineButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.blue,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(12)),
                      textColor: Colors.blue,
                      child: Text('Derslerim'),
                      borderSide: BorderSide(
                          color: Colors.blue, style: BorderStyle.solid, width: 1),
                      onPressed: () {
                        setState(() {
                          selectedIndex = [false, false, true];
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: data.user.completedLessons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Resume(selectedIndex[0]
                        ? data.user.completedLessons[index]
                        : selectedIndex[1]
                            ? data.user.favoriteLessons[index]
                            : selectedIndex[2]
                                ? data.user.ownerLessons[index]
                                : data.user.completedLessons[index]),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
