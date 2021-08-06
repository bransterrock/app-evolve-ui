import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

// ignore: must_be_immutable
class OrderStatusWidget extends StatelessWidget {
  OrderStatus orderStatus;
  OrderStatusWidget({required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: orderStatus == OrderStatus.SENT ? 58 : 88,
      // height: 30,
      // width: 88,
      child: Center(
        child: Text(
          Helper.getBtnName(orderStatus),
          style: Helper.defaultTextStyle(
              color: orderStatus == OrderStatus.PREPARING
                  ? constants.PREPARING_TEXT_COLOR
                  : Helper.getBtnColor(orderStatus),
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
      ),
      decoration: BoxDecoration(
          color: Helper.getBtnColor(orderStatus).withOpacity(0.25),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
