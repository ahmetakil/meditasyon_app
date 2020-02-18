import 'package:flutter/material.dart';
import 'package:meditasyon_app/repository/user_repository.dart';
import 'package:meditasyon_app/screens/auth_screen.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app, color: Colors.blue),
                    title: Text(
                      'Çıkış yap',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                  onTap: () => _logOut(context),
                )
              ],
            ),
          );
        }
      ),
    );
  }

  _logOut(BuildContext context) async {
    var success = await UserRepository.logout();
    if (success) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AuthScreen()),
        (Route<dynamic> route) => false);
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Cannot logout. Try again',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ],
          )
        )
      );
    }
  }
}