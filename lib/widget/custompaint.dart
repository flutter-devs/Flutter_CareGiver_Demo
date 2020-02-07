import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width,100);
    path.lineTo(500, size.height);
    path.lineTo(size.width*500,size.height*500);
    path.close();
    return Path();
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}