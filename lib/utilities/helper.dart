import 'package:flutter/cupertino.dart';

class Helper {
  static TextStyle defaultTextStyle(
      {double fontSize = 20,
      FontWeight fontWeight = FontWeight.w700,
      FontStyle fontStyle = FontStyle.normal}) {
    return TextStyle(
      fontFamily: 'Manrope',
        fontSize: fontSize, fontWeight: fontWeight, fontStyle: fontStyle);
  }
}
