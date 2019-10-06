import 'package:flutter/material.dart';
import 'package:meditasyon_app/screens/home_page.dart';

import './screens/auth_screen.dart';



main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meditasyon",
      routes: {
        '/': (_) => AuthScreen(),
        HomePage.route: (_) => HomePage(),
      },
    );
  }
}

