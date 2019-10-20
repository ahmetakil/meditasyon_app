import 'package:flutter/material.dart';
import 'package:meditasyon_app/widgets/bottom_navigation.dart';

import '../widgets/stories.dart';

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

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}

