import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/models/orientation_type.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

// ignore: must_be_immutable
class OrderStatusWidget extends StatelessWidget {
  OrderStatus orderStatus;
  OrientationType orientationType;
  OrderStatusWidget(
      {required this.orderStatus, this.orientationType = OrientationType.web});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: orientationType == OrientationType.mobile
          ? EdgeInsets.symmetric(vertical: 0)
          : EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 30,
        width: orderStatus == OrderStatus.SENT ? 58 : 88,
        // height: 30,
        // width: 88,
        child: Center(
          child: Text(
            OrderDetails.getBtnName(orderStatus),
            style: Helper.defaultTextStyle(
                color: orderStatus == OrderStatus.PREPARING
                    ? constants.kPreparingTextColor
                    : OrderDetails.getBtnColor(orderStatus),
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ),
        decoration: BoxDecoration(
            color: OrderDetails.getBtnColor(orderStatus).withOpacity(0.25),
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
