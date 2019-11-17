import 'package:flutter/material.dart';
import 'package:meditasyon_app/repository/user_repository.dart';
import 'package:meditasyon_app/screens/tabs/search.dart';
import 'package:meditasyon_app/screens/tabs/home_tab.dart';

import '../widgets/stories.dart';
import '../widgets/resume.dart';

class HomePage extends StatelessWidget {

  static const route = "/home";

  List<Widget> tabs = [
    HomeScreen(),
    Search(),
    Container(color: Colors.blue,),
    Container(color: Colors.yellow,),
    Container(color: Colors.green,),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        body: SafeArea(
          child: TabBarView(
            children:tabs,
          ),
        ),
        bottomNavigationBar: TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Theme.of(context).accentColor,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.panorama_fish_eye),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.add_box),
            ),
            Tab(
              icon: Icon(Icons.mic),
            ),
            Tab(
              icon: Icon(Icons.person),
            )

          ],
        ),
      ),
    );
  }
}
