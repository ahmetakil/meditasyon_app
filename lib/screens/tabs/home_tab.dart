import 'package:flutter/material.dart';
import 'package:meditasyon_app/repository/user_repository.dart';
import 'package:meditasyon_app/widgets/resume.dart';
import 'package:meditasyon_app/widgets/stories.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Stories(),
        Resume(null),
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
