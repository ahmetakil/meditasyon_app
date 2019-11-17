import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/home_page_model.dart';

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
      margin: EdgeInsets.only(top: 8.0,bottom: 10),
      height: 64.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.data.length, itemBuilder: (BuildContext context, int index) {
          return _buildItem(widget.data[index].name);
        },
        
      ),
    );
  }

  Widget _buildItem(imgUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 8,right: 8),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imgUrl)
              ),
              borderRadius: BorderRadius.all(Radius.circular(64.0))
          ),
          width: 64.0,
          height: 64.0,

          child: Text(imgUrl.toString()),
        ),

      ],
    );
  }
}
