import 'package:meditasyon_app/widgets/onboard_pages/onboard_page4.dart';
import 'package:meditasyon_app/widgets/onboard_pages/onboard_page5.dart';

import '../widgets/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../widgets/onboard_pages/onboard_page1.dart';
import '../widgets/onboard_pages/onboard_page2.dart';
import '../widgets/onboard_pages/onboard_page3.dart';

class _OnboardingMainPageState extends State<OnboardingMainPage> {
  final _controller = new PageController();
  final List<Widget> _pages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
  ];
  int page = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDone = page == _pages.length - 1;
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Stack(
        children: <Widget>[
          new Positioned.fill(
            child: new PageView.builder(
              
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
              onPageChanged: (int p){
                setState(() {
                  page = p;
                });
              },
            ),
          ),
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: new SafeArea(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                primary: false,
                title: Text('Yomedi'),
                actions: <Widget>[
                  FlatButton(
                    child: Text(isDone ? 'BİTTİ' : 'İLERİ', style: TextStyle(color: Colors.white),),
                    onPressed: isDone ? (){
                      Navigator.pop(context);
                    } : (){
                      _controller.animateToPage(page + 1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                    },
                  )
                ],
              ),
            ),
          ),
          new Positioned(
            bottom: 10.0,
            left: 0.0,
            right: 0.0,
            child: new SafeArea(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new DotsIndicator(
                      controller: _controller,
                      itemCount: _pages.length,
                      onPageSelected: (int page) {
                        _controller.animateToPage(
                          page,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                        width: 200.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [
                              Color(0xFFAF60FE),
                              Color(0xFF4907F4),
                            ],
                           
                          ),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        child: new Material(
                          child: MaterialButton(
                            child: Text('SONRAKİ',
                              style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                            ),
                            onPressed: isDone ? (){
                      Navigator.pop(context);
                    } : (){
                      _controller.animateToPage(page + 1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                    },
                            highlightColor: Colors.orange.withOpacity(0.5),
                            splashColor: Colors.orange.withOpacity(0.5),
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}

class OnboardingMainPage extends StatefulWidget {
  OnboardingMainPage({Key key}) : super(key: key);

  @override
  _OnboardingMainPageState createState() => new _OnboardingMainPageState();
}