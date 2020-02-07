import 'package:flutter/material.dart';
class DailyActivity{
  Color _color;
  Color _gradiantColor;
  String _img;
  String _title;
  String _subtitle;
  String _temp;

  DailyActivity(this._color,this._gradiantColor,this._img,this._title,this._subtitle,this._temp);

  Color get color=>_color;
  Color get gradiantColor=>_gradiantColor;
  String get img=>_img;
  String get title=>_title;
  String get subtitle=>_subtitle;
  String get temp=>_temp;

}