import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/order%20details/order_details_row.dart';
import 'package:app_evolve_ui/widgets/order%20details/order_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class OrderDetailsCard extends StatelessWidget {
  String? orderId;
  OrderStatus? orderStatus;
  String? orderDate;
  String? time;
  String? deliveryLocation;
  String? clientName;
  String? clientEmail;
  String? deliveryCompany;
  String? trackingCode;
  List<String>? products;
  String? price;
  String? paymentMethod;

  OrderDetailsCard(
      {required this.orderId,
      required this.orderStatus,
      required this.orderDate,
      required this.time,
      required this.deliveryLocation,
      required this.clientName,
      required this.clientEmail,
      required this.deliveryCompany,
      required this.trackingCode,
      required this.products,
      required this.price,
      required this.paymentMethod});

  String listAllProducts(List<String> products) {
    String completeProductString = '';
    for (var product in products) {
      completeProductString = completeProductString + product + '\n';
    }
    return completeProductString;
  }

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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: OrderDetails.getBtnColor(
                          orderStatus ?? OrderStatus.ALL_ORDERS),
                      child: SvgPicture.asset(
                        constants.shoppingBagIcon,
                        height: 16,
                        width: 15,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(orderId ?? 'No Order ID',
                        style: Helper.defaultTextStyle(
                            color: constants.SUPER_DARK_BLUE,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    Spacer(),
                    OrderStatusWidget(
                        orderStatus: orderStatus ?? OrderStatus.ALL_ORDERS),
                  ],
                ),
              ),
              Opacity(
                  opacity: 0.25,
                  child: Divider(thickness: 1, color: constants.MEDIUM_GREY)),
              OrderDetailsRow(
                  leadingText: orderDate! + ', ' + time!,
                  trailingText: deliveryLocation ?? 'No Delivery Location',
                  textColor: constants.MEDIUM_GREY),
              OrderDetailsRow(
                  leadingText: 'Client Name',
                  trailingText: clientName ?? 'No Client Name',
                  boxColor: constants.DELIVERY_CARD_BACKGROUND),
              OrderDetailsRow(
                  leadingText: 'Client Email',
                  trailingText: clientEmail ?? 'No Client Email'),
              OrderDetailsRow(
                  leadingText: 'Delivery Company',
                  trailingText: deliveryCompany ?? 'No Delivery Company',
                  boxColor: constants.DELIVERY_CARD_BACKGROUND),
              OrderDetailsRow(
                  leadingText: 'Tracking Code',
                  trailingText: trackingCode ?? 'No Tracking Code'),
              OrderDetailsRow(
                  leadingText: 'Products',
                  trailingText:
                      listAllProducts(products ?? ['No Products Provided']),
                  boxColor: constants.DELIVERY_CARD_BACKGROUND),
              OrderDetailsRow(
                  leadingText: 'Price',
                  trailingText: price ?? 'No Price Found'),
              OrderDetailsRow(
                leadingText: 'Payment Method',
                trailingText: paymentMethod ?? 'No Payment Method',
                boxColor: constants.DELIVERY_CARD_BACKGROUND,
              )
            ],
          ),
        ),
      ),
    );
  }
}
