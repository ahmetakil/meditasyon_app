import 'package:flutter/material.dart';
import 'package:meditasyon_app/widgets/outline_button.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>  with SingleTickerProviderStateMixin {


  List<bool> selectedIndex = [true,false,false];

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 48, left: 24, right: 24),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ClipOval(
                      child: Image.network(
                        'https://miro.medium.com/max/3150/1*mZ3xXbns5BiBFxrdEwloKg.jpeg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("35",
                        style: Theme.of(context).textTheme.headline),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("Ders Bitti",
                        style: Theme.of(context).textTheme.subtitle)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("600",
                        style:  Theme.of(context).textTheme.headline),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("Puan",
                        style: Theme.of(context).textTheme.subtitle)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("5921",
                        style:  Theme.of(context).textTheme.headline),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Sıralamada",
                      style:
                          Theme.of(context).textTheme.subtitle,
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Ali Anıl Koçak",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  OutlineButtonWidget()
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                IconButton(icon: Icon(Icons.cloud,color: Theme.of(context).primaryColor,size: 32,),onPressed: (){},),
                IconButton(icon: Icon(Icons.favorite,size: 32),onPressed: (){},),
                IconButton(icon: Icon(Icons.person,size: 32),onPressed: (){},),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
