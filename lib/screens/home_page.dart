import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:meditasyon_app/screens/add_sound_screen.dart';
import 'package:meditasyon_app/screens/notifications.dart';
import 'package:meditasyon_app/screens/profile.dart';
import 'package:meditasyon_app/screens/tabs/search.dart';
import 'package:meditasyon_app/screens/voice_recorder.dart';
import 'package:meditasyon_app/utils/color.dart';

import 'tabs/home_tab.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePageTab(),
    Search(),
    AddSoundScreen(),
    NotificationScreen(),
    UserProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            BottomNavyBarItem(
                icon: Icon(Ionicons.ios_disc),
                title: Text('Home'),
                activeColor: mainColor,
                inactiveColor: inactiveColor),
            BottomNavyBarItem(
                icon: Icon(Ionicons.ios_search),
                title: Text('Search'),
                activeColor: mainColor,
                inactiveColor: inactiveColor),
            BottomNavyBarItem(
                icon: Icon(Ionicons.ios_add_circle_outline),
                title: Text('Add Audio'),
                activeColor: mainColor,
                inactiveColor: inactiveColor),
            BottomNavyBarItem(
                icon: Icon(Ionicons.ios_notifications),
                title: Text('Bildirimler'),
                activeColor: Colors.blue,
                inactiveColor: inactiveColor),
            BottomNavyBarItem(
                icon: Icon(Ionicons.ios_contact),
                title: Text('Profil'),
                activeColor: Colors.blue,
                inactiveColor: inactiveColor),
          ],
        ));
  }
}
