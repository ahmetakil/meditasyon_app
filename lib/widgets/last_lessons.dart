import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/home_page_model.dart';

class LastLessons extends StatefulWidget {
  List<TopLessonsWeekly> data;
  LastLessons(this.data);
  @override
  _LastLessonsState createState() => _LastLessonsState();
}

class _LastLessonsState extends State<LastLessons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0,bottom: 10),
      height: 160.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.data.length, itemBuilder: (BuildContext context, int index) {
         return _buildItem(widget.data[index].name,widget.data[index].name,widget.data[index].imageUrl);
        },
        
      ),
    );
  }

  Widget _buildItem(title,subtitle,imgUrl) {
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
            borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          width: 120.0,
          height: 120.0,

          child: null,
        ),
        Padding(
          padding: EdgeInsets.only(top: 4,left: 12,right: 8),
          child: Text(title,style: TextStyle(fontSize: 13),),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12,right: 8),
          child: Text(subtitle,style: TextStyle(fontSize: 12,color: Colors.black45)),
        ),
      ],
    );
  }
}
