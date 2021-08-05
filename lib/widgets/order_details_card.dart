import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/order_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class OrderDetailsCard extends StatelessWidget {
  String orderID = '';
  OrderStatus orderStatus = OrderStatus.CANCELLED;
  String orderDate = '';
  String time = '';
  String orderLocation = '';
  String clientName = '';
  String clientEmail = '';
  String deliveryCompany = '';
  String trackingCode = '';
  List<String> products = [];
  String price = '';
  String paymentMethods = '';

  OrderDetailsCard({required this.orderID, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Helper.getBtnColor(orderStatus),
                    child: SvgPicture.asset(
                      constants.shoppingBagIcon,
                      height: 22,
                      width: 22,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(orderID,
                      style: Helper.defaultTextStyle(
                          color: constants.SUPER_DARK_BLUE,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  Spacer(),
                  OrderStatusWidget(orderStatus: orderStatus)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
