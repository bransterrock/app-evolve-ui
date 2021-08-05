import 'package:flutter/cupertino.dart';
import 'package:app_evolve_ui/utilities/constants.dart';

class Helper {
  static TextStyle defaultTextStyle(
      {double fontSize = 20,
      FontWeight fontWeight = FontWeight.w700,
      FontStyle fontStyle = FontStyle.normal,
      Color color = MEDIUM_GREY}) {
    return TextStyle(
        fontFamily: 'Manrope',
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color);
  }
}
