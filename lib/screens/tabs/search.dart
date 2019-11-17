import 'package:flutter/material.dart';
import 'package:meditasyon_app/repository/user_repository.dart';
import 'package:meditasyon_app/utils/utils.dart';
import 'package:meditasyon_app/widgets/bottom_navigation.dart';
import 'package:meditasyon_app/widgets/featuredlessons.dart';
import 'package:meditasyon_app/widgets/tags.dart';
import 'package:meditasyon_app/widgets/top_authors.dart';

import '../../widgets/stories.dart';
import '../../widgets/resume.dart';

class Search extends StatelessWidget {

  static const route = "/search";

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
                SearchBar(),

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
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2, bottom: 2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 9),
              child: Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  gradient: PURPLE_GRADIENT,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  
                  children: <Widget>[
                    Text("sanatçı ve içerik ara",style: TextStyle(color: Colors.white),),
                    Spacer(),
                    Icon(Icons.search,color: Colors.white,),
                    Categories(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
