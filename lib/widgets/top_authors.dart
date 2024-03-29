import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/home_page_model.dart';
import 'package:meditasyon_app/utils/utils.dart';

class TopAuthors extends StatefulWidget {
  List<BestAuthor> data;

  TopAuthors(this.data);

  @override
  _TopAuthorsState createState() => _TopAuthorsState();
}

class _TopAuthorsState extends State<TopAuthors> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 10),
      height: 64.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          if (widget.data[index].profilePicture == null) {
            return Container();
          }
          return _buildItem(
              widget.data[index].profilePicture, widget.data[index].name);
        },
      ),
    );
  }

  Widget _buildItem(imgUrl, name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            child: Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(IMAGE_BASE_URL + imgUrl),
            radius: 24,
          ),
        )),
        Container(
            alignment: Alignment.center,
            child: Text(
              name,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
