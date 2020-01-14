import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        ]);
  }
}
