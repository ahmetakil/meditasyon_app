import 'package:flutter/material.dart';

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 180,
      child: GestureDetector(
        onTap: () {},
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
                  "Profili Düzenle",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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