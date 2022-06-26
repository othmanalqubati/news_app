import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/Screens/Home_Screen.dart';
import '../PageModel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
 late List<PageModel> Pages;
ValueNotifier <int> pageViewNotifier=ValueNotifier(0);
  void _disPages() {
    Pages= <PageModel>[];

    Pages.add(PageModel('assets/images1/cl.jpg', Icons.ac_unit, "welcom",
        '1-making Friends is easy as working your hand back and forth in easy step'));
    Pages.add(PageModel(
        'assets/images1/img1.jpg',
        Icons.eleven_mp_sharp,
        'welcom',
        '2-making Friends is easy as working your hand back and forth in easy step'));
    Pages.add(PageModel(
        'assets/images1/img2.jpg',
        Icons.eleven_mp_sharp,
        'welcom',
        '3-making Friends is easy as working your hand back and forth in easy step'));
    Pages.add(PageModel(
        'assets/images1/img3.jpg',
        Icons.eleven_mp_sharp,
        'welcom',
        '4-making Friends is easy as working your hand back and forth in easy step'));
  }

  @override
  Widget build(BuildContext context) {
    _disPages();

    int c = 0;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 40,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: <Widget>[
            PageView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(Pages[index].img),
                                fit: BoxFit.fill)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // align it on x axis
                      mainAxisAlignment: MainAxisAlignment.center,
                      //align it on y axis
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0, -100),
                          //converting widget throw axises
                          child: Icon(
                            Pages[index].icon,
                            size: 150,
                            color: Colors.white,
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 48, left: 48),
                          child: Text(
                            Pages[index].title,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 48, left: 48, top: 24),
                          child: Text(
                            Pages[index].desc,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              itemCount: 4,
              onPageChanged: (index)
              {
                pageViewNotifier.value= index;
              },


            ),
            Transform.translate(
              offset: Offset(0, 175),
              child: Align(
                alignment: Alignment.center,
                child:_disPageIndicators() ,
                ),

              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 64,
                  child: RaisedButton(
                    color: Colors.red.shade800,
                    child: const Text(
                      "GET STARTED",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          letterSpacing: 1.5),
                    ),
                    onPressed: () {
                      Navigator.push
                      (context, MaterialPageRoute(
                          builder: (context){
                        return Home_Screen();
                      }));
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  List<Widget> _draowPageIndicators()
  {
    List <Widget> _widgets= <Widget> [];
    for(var i in Pages)
      {
        _widgets.add(_disIndicator(Colors.red));
      }
    return _widgets;

  }
  Widget _disIndicator(Color color)
  {
   return Container(
      width: 15,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );

  }
  Widget _disPageIndicators()
  {
    return PageViewIndicator(
      pageIndexNotifier: pageViewNotifier,
      length: Pages.length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

}
