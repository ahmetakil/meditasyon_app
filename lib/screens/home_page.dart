import 'package:flutter/material.dart';
import 'package:meditasyon_app/repository/user_repository.dart';

import '../widgets/stories.dart';

class HomePage extends StatelessWidget {

  static const route = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stories(),
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
