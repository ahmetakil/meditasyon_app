import 'package:flutter/material.dart';
import 'package:meditasyon_app/screens/home_page.dart';
import 'package:meditasyon_app/screens/player.dart';

import './screens/meditation_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meditasyon",
      routes: {
        //'/': (_) => AuthScreen(),
        '/': (_)=>AudioPlayerPage(425),
        HomePage.route: (_) => HomePage(),
        MeditationScreen.route: (_) => MeditationScreen(),
      },
    );
  }
}

