import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meditasyon_app/models/notification.dart';
import 'package:meditasyon_app/models/notification.dart' as prefix0;
import 'package:meditasyon_app/repository/notifications_repository.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<LinearGradient> color = [
    LinearGradient(
        colors: [
          const Color(0xFFFF5B9D),
          const Color(0xFFFFAD69),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
    LinearGradient(
        colors: [
          const Color(0xFF17E6E2),
          const Color(0xFFC58BFD),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
    
    LinearGradient(
        colors: [
          const Color(0xFFA65BF9),
          const Color(0xFF5552FE),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
        LinearGradient(
        colors: [
          const Color(0xFF58E09E),
          const Color(0xFFBEE772),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
    LinearGradient(
        colors: [
          const Color(0xFFA65BF9),
          const Color(0xFF5552FE),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  ];


  
  NotificationModel data;
  Future<NotificationModel> getData() async {
    data = await NotificationRepository.index();
    setState(() {});
    return data;
  }

  @override
  void initState() {
getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: data == null
                    ? SpinKitDoubleBounce(
                        size: 48,
                        color: Colors.blue,
                      )
                    :  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Bugün",
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
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              "Merhaba 6 bildirimin var",
              style: TextStyle(color: Colors.black38, fontSize: 18),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 20.0),
              child: ListView.builder(
                itemCount: data.notifications.length+5, itemBuilder: (BuildContext context, int index) {
                  return  _acceptBuildItem(
                    data.notifications[index % data.notifications.length].createdAt.toString().replaceAll("00:00:00.000", ""), //veriyi çoğaltmak içim % kullanıldı
                    data.notifications[index % data.notifications.length].message,
                    color[index % 5]
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _acceptBuildItem(time, title,LinearGradient color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
          decoration: BoxDecoration(
              gradient: color,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: 120.0,
          child: Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    time,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  // Text(subtitle,
                  //     style: TextStyle(color: Colors.white, fontSize: 12))
                ],
              )),
        ),
      ],
    );
  }

  Widget _followBuildItem(time, title, subtitle) {
    double pos = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF17E6E2),
                    const Color(0xFFC58BFD),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: 120.0,
          child: Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    time,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Container(
                    height: 32,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: pos = pos + 12,
                          child: FlutterLogo(),
                        ),
                        Positioned(
                          left: pos = pos + 12,
                          child: FlutterLogo(),
                        ),
                        Positioned(
                          left: pos = pos + 12,
                          child: FlutterLogo(),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }

  Widget _viewersBuildItem(time, title, subtitle) {
    double pos = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF58E09E),
                    const Color(0xFFBEE772),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: 120.0,
          child: Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    time,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Container(
                    height: 32,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: pos = pos + 12,
                          child: FlutterLogo(),
                        ),
                        Positioned(
                          left: pos = pos + 12,
                          child: FlutterLogo(),
                        ),
                        Positioned(
                          left: pos = pos + 12,
                          child: FlutterLogo(),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget _billingBuildItem(time, title, subtitle) {
    double pos = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFFA65BF9),
                    const Color(0xFF5552FE),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: 120.0,
          child: Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    time,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Container(
                    height: 32,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: pos = pos + 12,
                          child: FlutterLogo(),
                        ),
                        Positioned(
                          left: pos = pos + 12,
                          child: FlutterLogo(),
                        ),
                        Positioned(
                          left: pos = pos + 12,
                          child: FlutterLogo(),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
