import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderStatusWidget extends StatelessWidget {
  OrderStatus orderStatus;
  OrderStatusWidget({required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 30,
        width: 88,
        child: Center(
          child: Text(
            Helper.getBtnName(orderStatus),
            style: Helper.defaultTextStyle(
                color: Helper.getBtnColor(orderStatus),
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ),
        decoration: BoxDecoration(
            color: Helper.getBtnColor(orderStatus).withOpacity(0.25),
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

}
