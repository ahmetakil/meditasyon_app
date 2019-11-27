import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meditasyon_app/widgets/outline_button.dart';
import 'package:meditasyon_app/widgets/resume.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>
    with SingleTickerProviderStateMixin {
  List<bool> selectedIndex = [true, false, false];

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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl:
                            "https://miro.medium.com/max/3150/1*mZ3xXbns5BiBFxrdEwloKg.jpeg",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.red, BlendMode.colorBurn)),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("35",
                          style: Theme.of(context).textTheme.headline.copyWith(
                              color: Colors.blue, fontWeight: FontWeight.w600)),
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
                          style: Theme.of(context).textTheme.headline.copyWith(
                              color: Colors.blue, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text("Puan", style: Theme.of(context).textTheme.subtitle)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("5921",
                          style: Theme.of(context).textTheme.headline.copyWith(
                              color: Colors.blue, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Sıralamada",
                        style: Theme.of(context).textTheme.subtitle,
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Ali Anıl Koçak",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Hakkında bilgi yok",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    OutlineButtonWidget("Profili düzenle", 180)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OutlineButtonWidget("İndirilenler", 90),
                    OutlineButtonWidget("Favorilerim", 90),
                    OutlineButtonWidget("Derslerim", 90),
                  ],
                ),
              ),
              Resume(null),
              Resume(null),
              Resume(null),
              Resume(null),
            ],
          ),
        ),
      ),
    );
  }
}
