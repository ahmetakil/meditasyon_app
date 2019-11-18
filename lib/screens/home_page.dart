import 'package:flutter/material.dart';
import 'package:meditasyon_app/screens/profile.dart';
import 'package:meditasyon_app/screens/tabs/search.dart';
import 'notifications.dart';
import 'onboardscreen.dart';
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
    NotificationScreen(),
    OnboardingMainPage(),
    UserProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
            iconSize: 30,
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
            ]));
  }
}
