import 'package:flutter/material.dart';

import './widgets/stories.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meditasyon",
      routes: {
        '/': (_)=>HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       width: double.infinity,
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stories(),
            Text("HELLO WORLD"),
          ],
       ),
     ),
    );
  }
}
