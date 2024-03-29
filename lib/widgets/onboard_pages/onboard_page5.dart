import '../circles_with_image.dart';
import '../../utils/assets.dart';
import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          new Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: SizedBox(
                    child: Image(
                      image: AssetImage(Assets.pose5),
                      fit: BoxFit.fitHeight,
                    ),
                    height: IMAGE_SIZE,
                    width: IMAGE_SIZE,
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 48.0, right: 48.0, bottom: 8),
                  child: Text(
                    'Para kazan',
                    style: Theme.of(context).textTheme.display1.copyWith(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: Text(
                    'Evet işin en iyi kısmı burdan para kazanmak yaptığın yayınlar kaliteli ise sana bir kod  verilir ve bu kod ile uygulamadan satın alma yapılırsa bundan sende bir pay kazanmış  olursun yani bize getirdiğin her dinleyici  sanada kazandıracaktır',
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          )
        ],
        alignment: FractionalOffset.center,
      ),
    );
  }
}
