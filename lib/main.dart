import 'package:flutter/material.dart';
import 'package:meditasyon_app/screens/profile.dart';
import 'dart:ui' as ui;

import './widgets/stories.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dividerColor: Color(0xFFECEDF1),
        brightness: Brightness.light,
        backgroundColor: Colors.white10,
        primaryColor: Color(0xFF0878F5),
        accentColor: Colors.cyan[600],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          title: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          subtitle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          body1: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          display1: TextStyle(
              fontSize: 14.0, fontFamily: 'Montserrat1', color: Colors.white),
          display2: TextStyle(
              fontSize: 14.0, fontFamily: 'Montserrat', color: Colors.black54),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Meditasyon",
      routes: {
        '/': (_) => UserProfile(),
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
