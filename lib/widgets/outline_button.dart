import 'package:flutter/material.dart';

class OutlineButtonWidget extends StatelessWidget {

  int index;
  String title;
  double width;
  Function act;

  OutlineButtonWidget(this.title, this.width, this.index, this.act);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.0,
      width: width,
      child: GestureDetector(
        onTap: act,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Montserrat',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
