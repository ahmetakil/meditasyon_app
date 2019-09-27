import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import './widgets/stories.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meditasyon",
      routes: {
        '/': (_) => HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stories(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.panorama_fish_eye),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mic),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Container(),
            ),
          ]),
    );
  }
}
