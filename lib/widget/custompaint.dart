import 'package:flutter/material.dart';

class ShapeOval extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final height=size.height;
    final width=size.width;
    Paint paint=Paint();

    Path mainBackground =Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color=Colors.blue.shade700;
    canvas.drawPath(mainBackground,paint);

    Path ovalPath=Path();

    //start paint from 20% height to the left.

    ovalPath.moveTo(0,height * 0.2);


    ovalPath.quadraticBezierTo(width*0.45, height*0.25, width*  0.51, height* 0.5);

    ovalPath.quadraticBezierTo(width*0.58, height*0.8, width*  0.1, height);

    ovalPath.lineTo(0, height);

    ovalPath.close();
    paint.color=Colors.blue.shade600;

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }

}