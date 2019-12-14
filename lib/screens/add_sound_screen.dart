import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:meditasyon_app/utils/color.dart' as prefix0;

class AddSoundScreen extends StatefulWidget {
  @override
  _AddSoundScreenState createState() => _AddSoundScreenState();
}

class _AddSoundScreenState extends State<AddSoundScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Oluştur",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 4,
                      ),
                      Text("30 Eylül 2019",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.delete),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.cloud_download),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.mic),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.send)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 12.0, bottom: 12),
              child: Text(
                "Konuşma alanını belirle",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Wrap(
                children: <Widget>[
                  _buildItemTag("mjgmym", 1),
                  _buildItemTag("ebdnhtn", 1),
                  _buildItemTag("ntrynrn", 1),
                  _buildItemTag("betb", 1),
                  _buildItemTag("wavwe", 1),
                  _buildItemTag("Dewefwefneem", 1),
                  _buildItemTag("tukt", 1),
                  IconButton(
                    icon: Icon(
                      Ionicons.ios_add_circle_outline,
                      color: prefix0.mainColor,
                      size: 36,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildItemTag(title, id) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () {
//          Navigator.of(context)
//              .pushNamed(LessonsTag.route, arguments: id);
        },
        color: Color(0xFF0878F5),
        textColor: Colors.white,
        child: Text(title, style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
