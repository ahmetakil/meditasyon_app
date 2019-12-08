import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meditasyon_app/utils/utils.dart';

class Search extends StatelessWidget {
  static const route = "/search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 8),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Stories(),
                SearchBar(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4),
                  child: Text(
                    "Hepsine Bakın",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
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
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
      children: <Widget>[
        CategoryTile("Hikayeler", ""),
        CategoryTile("Motivasyon", ""),
        CategoryTile("Belgesel tadında", ""),
        CategoryTile("Meditasyon", ""),
        CategoryTile("Podcast", ""),
        CategoryTile("Düşünce", ""),
        CategoryTile("Rüyalar", ""),
        CategoryTile("Farkındalık", ""),
        CategoryTile("Uyku Öncesi", ""),
        CategoryTile("Yürürken", ""),
        CategoryTile("Sağlık", ""),
        CategoryTile("Kişisel Gelişim", ""),
        CategoryTile("Özgüven", ""),
      ],
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String name;
  final String imageUrl;

  CategoryTile(this.name, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.only(top: 6, bottom: 6, left: 4, right: 6),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (_, i) => Container(
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
