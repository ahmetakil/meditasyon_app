import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/home_page_model.dart';
import 'package:meditasyon_app/screens/lessons_tag.dart';

class Tags extends StatefulWidget {
  List<Tag> data;
  Tags(this.data);
  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, bottom: 2),
      height: 40.0,
      child: ListView.builder(
        itemCount: widget.data.length,
        scrollDirection: Axis.horizontal, itemBuilder: (BuildContext context, int index) {
          return _buildItem(widget.data[index].name,widget.data[index].id);
        },
        
      ),
    );
  }

  Widget _buildItem(title,id) {
    return Container(
        margin: EdgeInsets.only(bottom: 4.0, right: 8),
        child: RaisedButton(
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
    ),
    onPressed: () {
        Navigator.of(context)
            .pushNamed(LessonsTag.route, arguments: id);
    },
    color: Color(0xFF0878F5),
    textColor: Colors.white,
    child: Text(title, style: TextStyle(fontSize: 14)),
        ),
      );
  }
}
