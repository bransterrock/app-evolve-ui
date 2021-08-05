import 'package:app_evolve_ui/models/order_details.dart';
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

  static String getBtnName(OrderStatus orderStatus) {
    String value = '';
    switch (orderStatus) {
      case OrderStatus.PREPARING:
        {
          value = 'Preparing';
        }
        break;
      case OrderStatus.DELIVERED:
        {
          value = 'Delivered';
        }
        break;
      case OrderStatus.CANCELLED:
        {
          value = 'Cancelled';
        }
        break;
      case OrderStatus.RETURNED:
        {
          value = 'Returned';
        }
        break;
      case OrderStatus.SENT:
        {
          value = 'Sent';
        }
        break;
      default:
        {}
        break;
    }
    return value;
  }

  static Color getBtnColor(OrderStatus orderStatus) {
    Color colorValue = Color(0xFFFFFF);
    switch (orderStatus) {
      case OrderStatus.PREPARING:
        {
          colorValue = PREPARING_ICON_COLOR;
        }
        break;
      case OrderStatus.DELIVERED:
        {
          colorValue = DELIVERED_ICON_COLOR;
        }
        break;
      case OrderStatus.CANCELLED:
        {
          colorValue = CANCELLED_ICON_COLOR;
        }
        break;
      case OrderStatus.RETURNED:
        {
          colorValue = RETURNED_ICON_COLOR;
        }
        break;
      case OrderStatus.SENT:
        {
          colorValue = SENT_ICON_COLOR;
        }
        break;
      default:
        {}
        break;
    }
    return colorValue;
  }
}
