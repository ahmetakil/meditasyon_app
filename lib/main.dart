import 'package:flutter/material.dart';
import 'package:meditasyon_app/screens/lessons_tag.dart';
import 'package:meditasyon_app/utils/auth_control.dart';
import 'package:provider/provider.dart';
import './providers/lesson_provider.dart';
import './screens/auth_screen.dart';
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
      home: FutureBuilder<bool>(
        future: CheckAuth.isLogged(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return HomePage();
            } else {
              return AuthScreen();
            }
          } else {
            return AuthScreen();
          }
        },
      ),
        debugShowCheckedModeBanner: false,
        title: "Meditasyon",
        routes: {
//           '/': (_) => AuthScreen(),
//           '/': (_) => HomePage(),
          HomePage.route: (_) => HomePage(),
          MeditationScreen.route: (_) => MeditationScreen(),
          LessonsTag.route: (_) => LessonsTag(),
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