import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top:4.0),
          child: Text("Profili Düzenle",style: TextStyle(color: Colors.black.withOpacity(0.9)),),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          color: Colors.black54,
          iconSize: 32,
          onPressed: () {
            Navigator.pop(context);

          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.black54,
            ),
            onPressed: () {
            },
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 20,
                  left: 24,
                  child: Container(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://miro.medium.com/max/3150/1*mZ3xXbns5BiBFxrdEwloKg.jpeg"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 80,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 1.0,
                        top: 2.0,
                        child: Icon(Icons.add_circle,
                            color: Colors.black54.withOpacity(0.3)),
                      ),
                      Icon(Icons.add_circle, color: Colors.white),
                    ],
                  ),
                ),
                Positioned(
                  left: 140,
                  top: 20,
                  child: Container(
                    height: 80,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "44K",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Puan",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text("120",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17)),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Sıralama",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 16),
            child: Text(
              "İsim Soyisim",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w600),
            ),
          ),
          TextField(
            decoration:
                InputDecoration(contentPadding: EdgeInsets.only(left: 32)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 16),
            child: Text("Telefon Numarası",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w600)),
          ),
          TextField(
            decoration:
                InputDecoration(contentPadding: EdgeInsets.only(left: 32)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 16),
            child: Text("Kullanıcı Adı",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w600)),
          ),
          TextField(
            decoration:
                InputDecoration(contentPadding: EdgeInsets.only(left: 32)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 16),
            child: Text("Kısa Açıklama(Biyografik)",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w600)),
          ),
          TextField(
            decoration:
                InputDecoration(contentPadding: EdgeInsets.only(left: 32)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 16),
            child: Text("Adres",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w600)),
          ),
          TextField(
            decoration:
                InputDecoration(contentPadding: EdgeInsets.only(left: 32)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 16),
            child: Text("Sosyal Medya Hesapları",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w600)),
          ),
          TextField(
            decoration:
                InputDecoration(contentPadding: EdgeInsets.only(left: 32)),
          ),
        ],
      )),
    );
  }
}
