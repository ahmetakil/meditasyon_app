import 'package:flutter/material.dart';
import 'package:meditasyon_app/repository/user_repository.dart';
import 'package:meditasyon_app/widgets/featuredlessons.dart';
import 'package:meditasyon_app/widgets/resume.dart';
import 'package:meditasyon_app/widgets/stories.dart';
import 'package:meditasyon_app/widgets/tags.dart';
import 'package:meditasyon_app/widgets/top_authors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Stories(),
        Resume(null),
        FeaturedLessons(),
        Tags(),
        FeaturedLessons(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "En iyi yayıncılar",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        TopAuthors(),
        RaisedButton(
          child: Text("LOGOUT"),
          onPressed: () async {
            if (await UserRepository.logout()) {
              Navigator.of(context).pushReplacementNamed("/");
            }
          },
        )
      ],
    );
  }
}
