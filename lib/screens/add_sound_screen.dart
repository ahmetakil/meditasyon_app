import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:meditasyon_app/utils/color.dart' as prefix0;

class AddSoundScreen extends StatefulWidget {
  @override
  _AddSoundScreenState createState() => _AddSoundScreenState();
}

class _AddSoundScreenState extends State<AddSoundScreen> with TickerProviderStateMixin {
  ScrollController scrollController;
  bool dialVisible = true;
  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }
  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });// TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: buildFloatingButton(),
//        bottomNavigationBar: Container(
//          padding: EdgeInsets.only(left: 12.0),
//          height: 64,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Text(
//                "Yeni ses ekle",
//                style: TextStyle(color: prefix0.mainColor),
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Icon(
//                    Icons.add_circle_outline,
//                    color: prefix0.mainColor,
//                    size: 48,
//                  ),
//                  Icon(
//                    Icons.mic_none,
//                    color: prefix0.mainColor,
//                    size: 48,
//                  ),
//                ],
//              )
//            ],
//          ),
//        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
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
                    _buildItemTag("tukt", 1),
                    IconButton(
                      icon: Icon(
                        Ionicons.ios_add_circle_outline,
                        color: prefix0.mainColor,
                        size: 36,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 16,
                                child: OutlineButton(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.blue,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(24)),
                                  textColor: Colors.blue,
                                  child: Text(
                                    'Kapak Fotoğrafı Ekle',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.blue,
                                      style: BorderStyle.solid,
                                      width: 1),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "Güneş ve Ay",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7)),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.edit,
                                        color: prefix0.mainColor,
                                        size: 16,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "https://i.hizliresim.com/r0oDz3.png",
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.0),
                          height: 16,
                          child: OutlineButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(24)),
                            textColor: Colors.blue,
                            child: Text(
                              'Bu dersin sesleri',
                              style: TextStyle(fontSize: 10),
                            ),
                            borderSide: BorderSide(
                                color: Colors.blue,
                                style: BorderStyle.solid,
                                width: 1),
                            onPressed: () {
                              setState(() {});
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int index) {
                              return buildSoundItem();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFloatingButton() {
    return SpeedDial(
        // both default to 16
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0,color: Colors.white),
        // this is ignored if animatedIcon is non null
        // child: Icon(Icons.add),
        visible: dialVisible,
        // If true user is forced to close dial manually
        // by tapping main button and overlay is not rendered.
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.transparent,
        overlayOpacity: 0.2,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: prefix0.mainColor,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.add,color: prefix0.mainColor,),
              backgroundColor: Colors.white,
              label: 'Ses ekle',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('FIRST CHILD')
          ),
          SpeedDialChild(
            child: Icon(Icons.mic_none),
            backgroundColor:prefix0.mainColor,
            label: 'Mikrofon',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('SECOND CHILD'),
          ),

        ],
      );
  }

  Widget buildSoundItem() {
    return ListTile(
      onTap: () {},
      leading: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(4, 4),
              spreadRadius: 1,
              blurRadius: 4)
        ]),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.play_arrow,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 3),
          Row(
            children: <Widget>[
              Text(
                "Şükran günü",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 6,
              ),
            ],
          ),
        ],
      ),
      trailing: Container(
          child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.more_vert,
          color: prefix0.mainColor,
        ),
      )),
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
