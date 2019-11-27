import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/home_page_model.dart';
import 'package:meditasyon_app/screens/meditation_screen.dart';

class FeaturedLessons extends StatefulWidget {
  List<LastLesson> data;
  FeaturedLessons(this.data);
  @override
  _FeaturedLessonsState createState() => _FeaturedLessonsState();
}

class _FeaturedLessonsState extends State<FeaturedLessons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 10),
      height: 160.0,
      child: ListView.builder(
        itemCount: widget.data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(widget.data[index].id, widget.data[index].name,
              widget.data[index].name, widget.data[index].imageUrl);
        },
      ),
    );
  }

  Widget _buildItem(int id, title, subtitle, imgUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(MeditationScreen.route, arguments: id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 8, right: 8),
           
            width: 120.0,
            height: 120.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                imageUrl: imgUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4, left: 12, right: 8),
            child: Text(
              title,
              style: TextStyle(fontSize: 13),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 8),
            child: Text(id.toString(),
                style: TextStyle(fontSize: 12, color: Colors.black45)),
          ),
        ],
      ),
    );
  }
}
