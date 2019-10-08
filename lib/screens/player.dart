import 'package:flutter/material.dart';
import 'package:meditasyon_app/widgets/quarter.dart';

class AudioPlayerPage extends StatefulWidget {
  final double height;

  AudioPlayerPage(this.height);

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  final double startingHeight = 20.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = Tween<double>(begin: startingHeight, end: widget.height)
        .animate(_controller);
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AnimatedBuilder(
            builder: (context, anim) {
              return ClipPath(
                clipper: RoundedClipper(animation.value),
                child: Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network('https://resimag.com/p1/d826558c809.png',
                          fit: BoxFit.cover),
                      Positioned(
                          left: 8,
                          top: 32,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                width: 48.0,
                                height: 48.0,
                                decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.all(
                                    new Radius.circular(50.0),
                                  ),
                                  border: new Border.all(
                                    color: Colors.transparent.withOpacity(0.5),
                                    width: 4.0,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Positioned(
                        bottom: 220,
                        left: MediaQuery.of(context).size.width / 2 - 84,
                        child: Text(
                          "13:45",
                          style: TextStyle(
                              fontSize: 72,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        bottom: 120,
                        left: MediaQuery.of(context).size.width / 2 - 42,
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.all(
                              new Radius.circular(50.0),
                            ),
                            border: new Border.all(
                              color: Colors.blue.withOpacity(0.4),
                              width: 4.0,
                            ),
                          ),
                          height: 84,
                          width: 84,
                          child: new Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: new BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: new DecorationImage(
                                image: NetworkImage(
                                    "https://miro.medium.com/max/3150/1*mZ3xXbns5BiBFxrdEwloKg.jpeg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: new BorderRadius.all(
                                new Radius.circular(50.0),
                              ),
                              border: new Border.all(
                                color: Colors.blue,
                                width: 4.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  height: animation.value,
                  color: Colors.amber,
                ),
              );
            },
            animation: _controller,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: ListTile(
                  title: Text("Düşüncelerini susturma"),
                  subtitle: Text("Pelin Perili"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue,
                  ),
                  value: 0.8,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        size: 36,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.skip_previous,
                        size: 36,
                      ),
                      onPressed: () {},
                    ),
                    FloatingActionButton(
                      child: Icon(Icons.pause),
                      backgroundColor: Colors.blue,
                      onPressed: () => {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.skip_next,
                        size: 36,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.cloud_queue,
                        size: 36,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                 
                    context: context,
                    builder: (BuildContext bc) {
                      return buildBottomSheet();
                    },
                  );
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 72,
                      height: 72,
                      child: QuarterCircle(
                        circleAlignment: CircleAlignment.bottomLeft,
                      ),
                    ),
                    Positioned(
                        bottom: 12,
                        left: 12,
                        child: Container(
                          width: 32,
                          height: 32,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/backmusicexample.png'),
                          ),
                        ))
                  ],
                ),
              )),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  buildBottomSheet() {
    return Container(


       
        
        decoration: new BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
             Color(0xFFB565FF),
              Color(0xFF4806F4)
            ],
          ),
         
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:24.0),
              child: Text("Arka Plan için Seç",textAlign: TextAlign.start,style: TextStyle(fontSize: 24,color: Colors.white)),
            ),
            SizedBox(height: 8,),
          buildExampleBottomView(),
          buildExampleBottomView(),
          buildExampleBottomView(),
          
          ],
        ));
  }

  Row buildExampleBottomView() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
           Container(
                        width: 64,
                        height: 64,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/backmusicexample.png'),
                        ),
                      ),
                      Container(
                        width: 64,
                        height: 64,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/backmusicexample.png'),
                        ),
                      ),Container(
                        width: 64,
                        height: 64,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/backmusicexample.png'),
                        ),
                      ),Container(
                        width: 64,
                        height: 64,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/backmusicexample.png'),
                        ),
                      )
          ],);
  }
}

class RoundedClipper extends CustomClipper<Path> {
  final double height;

  RoundedClipper(this.height);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, height - 200);
    path.quadraticBezierTo(
      size.width / 2,
      height,
      size.width,
      height - 200,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
