import 'package:flutter/material.dart';
import 'package:meditasyon_app/repository/user_repository.dart';
import 'package:meditasyon_app/widgets/bottom_navigation.dart';
import 'package:meditasyon_app/widgets/featuredlessons.dart';
import 'package:meditasyon_app/widgets/tags.dart';
import 'package:meditasyon_app/widgets/top_authors.dart';

import '../widgets/stories.dart';
import '../widgets/resume.dart';

class HomePage extends StatelessWidget {

  static const route = "/home";

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
                Stories(),
                Resume(null),
                FeaturedLessons(),
                Tags(),
                FeaturedLessons(),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text("En iyi yayıncılar",style: TextStyle(fontWeight: FontWeight.w600),),
                ),
                TopAuthors(),

                RaisedButton(
                  child: Text("LOGOUT"),
                  onPressed: () async{
                    if(await UserRepository.logout()){
                      Navigator.of(context).pushReplacementNamed("/");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget()
    );
  }
}