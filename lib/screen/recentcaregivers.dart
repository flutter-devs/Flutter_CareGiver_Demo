import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:home_care_app/constant/constant.dart';
import 'package:home_care_app/model/recomond_caregivers.dart';
import 'package:table_calendar/table_calendar.dart';

class RecentCareGivers extends StatefulWidget {
  @override
  _RecentCareGiversState createState() => _RecentCareGiversState();
}

class _RecentCareGiversState extends State<RecentCareGivers> {

  CalendarController _calendarController;

  double _height;
  double _width;

  List<RecomondCaregivers>recomondCaregivers;

  @override
  void initState() {
    _calendarController = CalendarController();
    recomondCaregivers=Constants.getRecomondCaregivers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(114, 57, 241, 1),
      appBar:AppBar(
        elevation:0.0,
        backgroundColor: Color.fromRGBO(114, 57, 241, 1),
        leading:InkWell(
          onTap: (){
           // Navigator.of(context).pop();
          },
          child:Icon(Icons.arrow_back,color:Colors.white,),
        ),
        title:Text('Caregiver',style:TextStyle(color:Colors.white),),

      ),
      body:Container(
        child:Stack(
          children: <Widget>[
            Container(
              color:Colors.white,
              child: TableCalendar(

                calendarStyle: CalendarStyle(
                  todayColor:Colors.orange,
                  markersColor:Colors.orange,
                ),
                // locale: 'pl_PL',
                calendarController: _calendarController,
                initialCalendarFormat: CalendarFormat.week,
                formatAnimation: FormatAnimation.slide ,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                availableGestures: AvailableGestures.all,
                availableCalendarFormats: const {
                  CalendarFormat.month: '',
                  CalendarFormat.week: '',
                },
              ),
            ),

            Container(
              margin:EdgeInsets.only(top:150.0),
              height:_height,
              // width:_width,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              child:SingleChildScrollView(
                physics:BouncingScrollPhysics(),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 20.0, left:20.0, right:20.0),
                      child: Text(
                        'Recent Caregivers',
                        style: TextStyle(
                            fontFamily: 'Roboto Regular',
                            fontWeight: FontWeight.w600,
                            fontSize:17.5),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20.0, left:20.0, right:20.0),
                      height: _height /8,
                    //  width:_width,
                      child:Card(
                        elevation:2.0,
                        shape:RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(20.0),
                        ),
                        child:ListTile(
                          contentPadding:EdgeInsets.only(top:5.0,left: 10.0,right: 10.0),
                          leading:CircleAvatar(
                            child:ClipOval(
                              child:Image.asset('assets/images/marie_img.jpeg',height:_height,width:_width,fit:BoxFit.fill,),
                            ),
                          ),
                          title:Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,

                            crossAxisAlignment:CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text('Marie Winter',style:TextStyle(fontFamily:'Roboto Medium',fontWeight:FontWeight.w300),),
                                  Text('9am - 6:30PM',style:TextStyle(fontFamily:'Roboto Medium',fontWeight:FontWeight.w300,fontSize:12.5,color:Colors.black54),),
                                ],
                              ),

                              Row(
                                children: <Widget>[
                                  Text('\$599.00',style:TextStyle(fontFamily:'Roboto Medium',fontWeight:FontWeight.w600,fontSize: 16.0,color: Colors.orange),),
                                  SizedBox(width:10.0,),
                                  ClipOval(
                                    child: CircleAvatar(
                                      minRadius:18.0,
                                      backgroundColor:Colors.blue[50],
                                      child:Icon(Icons.more_horiz),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10.0, left:19.0, right:19.0),
                      height: _height /8,
                      width:_width,
                      child:Card(
                        elevation:2.0,
                        shape:RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(20.0),
                        ),
                        child: ListTile(
                          contentPadding:EdgeInsets.only(top:5.0,left: 10.0,right: 10.0,bottom:10.0),
                          leading:CircleAvatar(
                            child:ClipOval(
                              child:Image.asset('assets/images/michael.jpg',height:_height,width:_width,fit:BoxFit.fill,),
                            ),
                          ),
                          title:Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,

                            crossAxisAlignment:CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text('Jack Neil',style:TextStyle(fontFamily:'Roboto Medium',fontWeight:FontWeight.w300),),
                                  Text('9am - 6:30PM',style:TextStyle(fontFamily:'Roboto Medium',fontWeight:FontWeight.w300,fontSize:12.5,color:Colors.black54),),
                                ],
                              ),

                              Row(
                                children: <Widget>[
                                  Text('\$299.00',style:TextStyle(fontFamily:'Roboto Medium',fontWeight:FontWeight.w600,fontSize: 16.0,color: Colors.orange),),
                                  SizedBox(width:10.0,),
                                  ClipOval(
                                    child: CircleAvatar(
                                      minRadius:18.0,
                                      backgroundColor:Colors.blue[50],
                                      child:Icon(Icons.more_horiz),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left:20.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Recomonded Caregivers',
                            style: TextStyle(
                                fontFamily: 'Roboto Regular',
                                fontWeight: FontWeight.w600,
                                fontSize:17.5),
                          ),
                          Text('More',style:TextStyle(color: Colors.orange),),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      height: _height/4.5,
                      child:ListView.builder(
                          itemCount:recomondCaregivers.length,
                          scrollDirection:Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder:(BuildContext context,int index){
                            return _buildRecomondCare(recomondCaregivers[index],index);
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecomondCare(RecomondCaregivers items, int index) {
    return Container(
        margin:EdgeInsets.only(left:20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color:Color.fromRGBO(244, 244, 248, 1),
        ),
        width: _width /2.7,
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius:30.0,
                child:ClipOval(
                  child:Image.asset(items.img,height:_height,width:_width,fit:BoxFit.fill,),
                ),
              ),
              Text(items.title,style:TextStyle(fontSize:13.5,fontFamily:('Roboto Medium')),),

              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star,color:Colors.orange[200],size: 18.0,),
                  Icon(Icons.star,color:Colors.orange[200],size: 18.0,),
                  Icon(Icons.star,color:Colors.orange[200],size: 18.0,),
                  Icon(Icons.star,color:Colors.orange[200],size: 18.0,),
                  Icon(Icons.star_border,size: 15.0,),
                ],
              ),

            ],
          ),
        ));
  }
}
