import 'package:flutter/material.dart';

class TopAuthors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0,bottom: 10),
      height: 64.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildItem("Düşünce silme","Anıl","https://cdn.pixabay.com/photo/2019/09/04/02/52/road-4450611_1280.jpg"),
          _buildItem("Ruh Temizleme","Anıl","https://cdn.pixabay.com/photo/2016/05/05/02/35/hot-air-ballons-1373167_1280.jpg"),
          _buildItem("Nefes","Anıl","https://cdn.pixabay.com/photo/2019/09/10/13/24/asia-4466113_1280.jpg"),
          _buildItem("Ruh Temizleme","Anıl","https://cdn.pixabay.com/photo/2016/05/05/02/32/balloon-1373161_1280.jpg"),
          _buildItem("Ruhunu Genişlet","Anıl","https://cdn.pixabay.com/photo/2019/10/09/00/22/volcano-4536198_1280.jpg"),
        ],
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
              borderRadius: BorderRadius.all(Radius.circular(64.0))
          ),
          width: 64.0,
          height: 64.0,

          child: null,
        ),

      ],
    );
  }
}
