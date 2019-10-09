import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/lesson_provider.dart';
import './screens/home_page.dart';
import './screens/auth_screen.dart';
import './screens/meditation_screen.dart';
import './screens/player.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider.value(
      value: LessonProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Meditasyon",
        routes: {
          //'/': (_) => AuthScreen(),
          '/': (_) => HomePage(),
          HomePage.route: (_) => HomePage(),
          MeditationScreen.route: (_) => MeditationScreen(),
          AudioPlayerPage.route: (_) => AudioPlayerPage(402),
        },
      ),
    );
  }
}
