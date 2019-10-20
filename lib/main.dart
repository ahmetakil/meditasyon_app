import 'package:flutter/material.dart';
import 'package:meditasyon_app/screens/notifications.dart';
import 'package:provider/provider.dart';

import './providers/lesson_provider.dart';
import './screens/home_page.dart';
import './screens/meditation_screen.dart';
import './services/locator.dart';

void main() async{
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: LessonProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Meditasyon",
        routes: {
          //'/': (_) => AuthScreen(),
          '/': (_) => NotificationScreen(),
          HomePage.route: (_) => HomePage(),
          MeditationScreen.route: (_) => MeditationScreen(),
         // AudioPlayerPage.route: (_) => AudioPlayerPage(),
        },
      ),
    );
  }
}

/*

TODO:
   - Internet bağlantısı yokken requestleri sharedPreferene da tutmak internet bağlantısı geline
   requestleri yollamak

   - Audioplayer bitince next oynaması lazım

 */