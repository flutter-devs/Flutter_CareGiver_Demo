import 'package:flutter/material.dart';

class PlanCare{
  Color _color;
  Color _textColor;
  String _img;
  String _title;

  PlanCare(this._color,this._textColor,this._img,this._title,);

  Color get color=>_color;
  Color get textColor=>_textColor;
  String get img =>_img;
  String get title=>_title;

}