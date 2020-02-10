import 'package:flutter/material.dart';
import 'package:home_care_app/constant/constant.dart';
import 'package:home_care_app/model/dailyactivity_model.dart';
import 'package:home_care_app/model/plancare.dart';
class CareGiverHomeScreen extends StatefulWidget {
  @override
  _CareGiverHomeScreenState createState() => _CareGiverHomeScreenState();
}

class _CareGiverHomeScreenState extends State<CareGiverHomeScreen> {
  double _height;
  double _width;

  List<DailyActivity> dailyActivity;
  List<PlanCare> planCare;

  @override
  void initState() {
    super.initState();
    dailyActivity = Constants.getDailyActivity();
    planCare = Constants.getPlanCareList();
  }


  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(114, 57, 241, 1),
      body:CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
              delegate: CustomSliverDelegate(
                expandedHeight:100,
              ),
          ),

          SliverFillRemaining(
            child: Container(
              height: _height,
              width: _width,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 60.0),
                    height: _height,
                    width: _width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(30.0),topRight:Radius.circular(30.0)),
                    ),
                    child: SingleChildScrollView(
                       physics: NeverScrollableScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(top: 80.0, bottom: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Sarah Wilson',
                                style: TextStyle(
                                    fontFamily: 'Roboto Regular',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19.0),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                'Adelaide, SA',
                                style: TextStyle(
                                    fontFamily: 'Roboto Regular',
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0),
                              ),
                            ),
                            Stack(
                              children: <Widget>[
                                SingleChildScrollView(
                                  child: Container(
                                    // height:_height,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20.0, left: 20.0, right: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Vitals',
                                                style: TextStyle(
                                                    fontFamily: 'Roboto Regular',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18.0),
                                              ),
                                              Icon(Icons.more_horiz),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding:
                                          EdgeInsets.only(left: 20.0, top: 5.0),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Daily Activity Followups',
                                            style: TextStyle(
                                                fontFamily: 'Roboto Regular',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.0,
                                                color: Colors.black38),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20.0),
                                          height: _height / 4.5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          child: ListView.builder(
                                              itemCount: dailyActivity.length,
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (BuildContext context, int index) {
                                                return _buildDailyActivity(
                                                    dailyActivity[index], index);
                                              }),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20.0, left: 20.0, right: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Plan Of Care',
                                                style: TextStyle(
                                                    fontFamily: 'Roboto Regular',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18.0),
                                              ),
                                              Icon(Icons.more_horiz),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding:
                                          EdgeInsets.only(left: 20.0, top: 5.0),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Choose your plan that Fits you',
                                            style: TextStyle(
                                                fontFamily: 'Roboto Regular',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.0,
                                                color: Colors.black38),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20.0),
                                          height: _height / 8,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(0.0)),
                                          ),
                                          child: ListView.builder(
                                              itemCount: planCare.length,
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (BuildContext context, int index) {
                                                return _buildPlanCare(
                                                    planCare[index], index);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child: CircleAvatar(
                        radius: 55.0,
                        child: Image.asset(
                          'assets/images/female_above40.jpg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyActivity(DailyActivity items, int index) {
    return Container(
        margin: EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            // color: items.color,
            gradient:LinearGradient(
              begin: Alignment.topCenter  ,
              end: Alignment.bottomLeft,
              //stops: [0.1, 0.5, 0.7, 0.9],

              colors:[
                items.color,
                items.gradiantColor,
              ],
            )
        ),
        width: _width / 2.7,
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 5.0, right: 5.0),
                  alignment: Alignment.center,
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child:Image.asset(items.img,height:_height/30.0,color:Colors.white,)
              ),
              Text(
                items.title,
                style: TextStyle(color: Colors.white, fontSize: 11.5),
              ),
              Column(
                children: <Widget>[
                  Text(
                    items.subtitle,
                    style: TextStyle(
                        fontFamily: ('Roboto Medium'),
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    items.temp,
                    style: TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildPlanCare(PlanCare items, int index) {
    return Container(
        margin: EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: items.color,

        ),
        width: _width / 3.5,
        child: Padding(
          padding: EdgeInsets.only(top:20.0, bottom: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  // color:Colors.pink,
                  child: Image.asset(
                    items.img,
                    height:30.0,
                    width:30.0,
                    fit: BoxFit.fill,

                    //color:Colors.orange,
                  ),
                ),
              ),

              SizedBox(height: 10.0,),
              Text(
                items.title,
                style: TextStyle(
                    fontFamily: ('Roboto Thin'),
                    fontWeight: FontWeight.w700,
                    fontSize:12.5,
                    color:items.textColor
                ),
              ),

            ],
          ),
        ));
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate  {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return AppBar(
      elevation: 0.0,
       backgroundColor: Color.fromRGBO(114, 57, 241, 1),
      leading: Icon(Icons.sort),
      title: Text(
        'Care giver',
        style: TextStyle(
            fontFamily: 'Roboto Medium',
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight/9;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}


