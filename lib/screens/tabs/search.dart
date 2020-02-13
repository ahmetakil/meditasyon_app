import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meditasyon_app/screens/tabs/search_.dart';
import 'package:meditasyon_app/utils/utils.dart';

class Search extends StatelessWidget {
  static const route = "/search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Stories(),
                SearchBar(),

                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Hepsine Bakın",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  height: MediaQuery.of(context).size.height,
                  child: Categories(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Search_()));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2, bottom: 2),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9),
                child: Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    gradient: PURPLE_GRADIENT,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "sanatçı ve içerik ara",
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2.75,
      ),
      children: <Widget>[
        CategoryTile("Hikayeler", "assets/search1.png", true, 0),
        CategoryTile("Motivasyon", "assets/search2.png", false, 1),
        CategoryTile("Belgesel tadında", "assets/search3.png", true, 3),
        CategoryTile("Meditasyon", "assets/search4.png", false, 0),
        CategoryTile("Podcast", "assets/search1.png", true, 1),
        CategoryTile("Düşünce", "assets/search2.png", false, 2),
        CategoryTile("Rüyalar", "assets/search3.png", true, 3),
        CategoryTile("Farkındalık", "assets/search4.png", false, 0),
        CategoryTile("Uyku Öncesi", "assets/search1.png", true, 1),
        CategoryTile("Yürürken", "assets/search2.png", false, 2),
        CategoryTile("Sağlık", "assets/search3.png", true, 3),
        CategoryTile("Kişisel Gelişim", "assets/search4.png", false, 0),
        CategoryTile("Özgüven", "assets/search1.png", true, 1),
      ],
    );
  }
}

class CategoryTile extends StatelessWidget {
  final int gradientIndex;

  List<LinearGradient> gradientList = [
    LinearGradient(
        colors: [
          const Color(0xFF0392FF),
          const Color(0xFF63F9D0),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
    LinearGradient(
        colors: [
          const Color(0xFF63F9D0),
          const Color(0xFF0392FF),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
    LinearGradient(
        colors: [
          const Color(0xFFF3AD52),
          const Color(0xFF8AFA69),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
    LinearGradient(
        colors: [
          const Color(0xFF8AFA69),
          const Color(0xFFF3AD52),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  ];

  List<Alignment> alignmentList = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.center,
    Alignment.centerRight,
    Alignment.centerLeft,
    Alignment.bottomRight,
    Alignment.bottomCenter,
    Alignment.bottomCenter
  ];

  final String name;
  final String imageUrl;
  final bool isLeftDirection;
  var randomizer = new Random(); // can get a seed as a parameter

  CategoryTile(
      this.name, this.imageUrl, this.isLeftDirection, this.gradientIndex);

  @override
  Widget build(BuildContext context) {
    int alignmentIndex = randomizer.nextInt(9);

    return Container(
      margin: EdgeInsets.only(top: 12, left: 4, right: 4),
      decoration: BoxDecoration(
        gradient: gradientList[gradientIndex],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.only(left: 4, right: 6),
      child: Stack(
        children: <Widget>[
          Align(
            alignment:
                isLeftDirection ? Alignment.centerLeft : Alignment.centerRight,
            child: Image.asset(
              imageUrl,
            ),
          ),
//          Align(
//            alignment: alignmentList[alignmentIndex],
//            child: Image.asset(
//              "assets/circle_solid.png",
//            ),
//          ),
          Align(
            alignment:
                !isLeftDirection ? Alignment.centerLeft : Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.95),
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
