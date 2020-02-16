import 'package:flutter/material.dart';
import 'package:meditasyon_app/models/lesson_model.dart';
import 'package:meditasyon_app/screens/meditation_screen.dart';

class Resume extends StatelessWidget {
  final LessonModel data;

  Resume(this.data);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        if (data == null) {
          return Container();
        }
        return InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(MeditationScreen.route, arguments: data.id);
          },
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right:16,left: 8),
                height: MediaQuery.of(context).size.height * 0.2,
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://i.hizliresim.com/r0oDz3.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ),
                    Positioned(
                      top: 4,
                      left: 12,
                      child: Text(
                        data.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 36,
                      left: 12,
                      child: Text(
                        data.userId,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 12,
                      child: Text(
                        "%${data.progress.toString()} tamamlandı",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
