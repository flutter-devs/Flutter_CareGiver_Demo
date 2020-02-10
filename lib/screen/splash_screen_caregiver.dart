import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:home_care_app/constant/constant.dart';
import 'package:home_care_app/model/splash_model.dart';
import 'package:home_care_app/widget/custompaint.dart';

class SplashScreenCaregiver extends StatefulWidget {
  @override
  _SplashScreenCaregiverState createState() => _SplashScreenCaregiverState();
}

class _SplashScreenCaregiverState extends State<SplashScreenCaregiver> {
  double _height;
  double _width;

  int currentPageValue = 0;

  PageController controller;

  List<SplashModel> splashModel;

  @override
  void initState() {
    splashModel = Constants.getSplashScreen();

    currentPageValue = 0;

    controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Care giver',
          style: TextStyle(
              fontFamily: 'Roboto Medium', fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(114, 57, 241, 1),
        elevation: 0.0,
      ),
      body: Container(
        height: _height,
        width: _width,
        color: Color.fromRGBO(114, 57, 241, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                // color:Colors.orange,
                //  height: _height / 4,
                child: PageView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: splashModel.length,
                    onPageChanged: (int page) {
                      getChangedPageAndMoveBar(page);
                    },
                    controller: controller,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildSplashList(splashModel[index], index);
                    }),
              ),
            ),
            Expanded(
              child: Container(
                //color:Colors.orange,
                child: Visibility(
                  visible:
                      currentPageValue == splashModel.length ? false : true,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < splashModel.length; i++)
                              if (i == currentPageValue) ...[
                                circleBar(true)
                              ] else
                                circleBar(false),
                          ],
                        ),



                        Visibility(
                          visible: currentPageValue == splashModel.length-1 ? false : true,
                          child:Expanded(child:Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            // color:Colors.red,
                            child: Text(
                              'We provided experienced & professional care in the home.',
                              style: TextStyle(
                                  fontFamily: 'Roboto Regular',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.5,
                                  height: 1.4),
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.3,
                            ),
                          ),),
                        ),

                        Visibility(
                          visible: currentPageValue == splashModel.length-1 ? false : true,
                          child: Expanded(child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor:
                                Color.fromRGBO(142, 97, 244, 1)
                                    .withOpacity(1.0),
                                child: InkWell(
                                  onTap: () {
                                    int page = currentPageValue - 1;
                                    controller.animateToPage(page,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.easeOut);
                                    currentPageValue = page;
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              CircleAvatar(
                                backgroundColor:
                                Color.fromRGBO(142, 97, 244, 1)
                                    .withOpacity(1.0),
                                child: InkWell(
                                  onTap: () {
                                    int page = currentPageValue + 1;
                                    controller.animateToPage(page,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.easeOut);
                                    currentPageValue = page;
                                  },
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),),
                        ),

                        Visibility(
                          visible: currentPageValue == splashModel.length - 1 ? true : false,
                          child:Container(
                            child: ButtonTheme(
                              minWidth: _width,
                              height: _height / 16,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: RaisedButton(
                                color: Color.fromRGBO(114, 95, 241, 1)
                                    .withOpacity(1.0),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(Constants.HOME_SCREEN);
                                },
                                child: Text(
                                  'GO TO HOME SCREEN',
                                  style: TextStyle(
                                      fontFamily: 'Roboto Medium',
                                      fontSize: 16.0,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 8 : 8,
      width: isActive ? 8 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.indigo[100].withOpacity(1.0),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  Widget _buildSplashList(SplashModel items, int index) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: 0.4,
              child: ClipOval(
                child: Container(
                  alignment: Alignment.center,
                  height: _height / 4.5,
                  width: _width / 1.2,
                  color: Color.fromRGBO(114, 95, 241, 1).withOpacity(1.0),
                ),
                // clipper:TopWaveClipper(),
              ),
            ),
          ),
          Align(
            // alignment: Alignment.center,
            child: Image.asset(
              items.img,
              fit: BoxFit.fitHeight,
              height: _height / 2.7,
            ),
          ),
        ],
      ),
    );
  }
}
