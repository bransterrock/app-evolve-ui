import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/order%20details/order_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class OrderDetailTableItem extends StatefulWidget {
  OrderDetails orderDetails;
  OrderDetailTableItem({required this.orderDetails});

  @override
  _OrderDetailTableItemState createState() => _OrderDetailTableItemState();
}

class _OrderDetailTableItemState extends State<OrderDetailTableItem> {
  bool? checkBoxValue = false;

  @override
  void initState() {
    super.initState();
  }

  RichText listAllProducts(List<String> products) {
    String completeProductString = '';

    if (products.length > 3) {
      return RichText(
        maxLines: 2,
        textAlign: TextAlign.justify,
        text: TextSpan(
            style: Helper.defaultTextStyle(
                fontSize: 12, fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(text: products[0] + products[1] + '\n' + products[2]),
              TextSpan(
                  text: '+' + (products.length - 3).toString() + 'more',
                  style: Helper.defaultTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: constants.TURQUOISE))
            ]),
      );
    }
    for (var product in products) {
      completeProductString = completeProductString + product + '\n';
    }

    return RichText(
      maxLines: 2,
      textAlign: TextAlign.justify,
      text: TextSpan(
          style: Helper.defaultTextStyle(
              fontSize: 12, fontWeight: FontWeight.w400),
          children: <TextSpan>[TextSpan(text: completeProductString)]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: checkBoxValue ?? false
                ? [
                    BoxShadow(
                      blurRadius: 3,
                      color: constants.MEDIUM_GREY,
                      spreadRadius: 0.2,
                    ),
                  ]
                : null,
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
            ),
            Checkbox(
              value: checkBoxValue,
              activeColor: constants.TURQUOISE,
              hoverColor: constants.TURQUOISE.withOpacity(0.25),
              splashRadius: 16,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              side: BorderSide(
                  style: BorderStyle.solid,
                  color: constants.kLightGrayColor,
                  width: 9),
              onChanged: (value) {
                setState(() {
                  checkBoxValue = value;
                });
              },
            ),
            SizedBox(
              width: 56,
            ),
            Flexible(
              child: Text(
                widget.orderDetails.orderId ?? 'No Order ID',
                textAlign: TextAlign.left,
                style: Helper.defaultTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              width: 60,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.orderDetails.orderDate ?? 'No Order Date',
                    textAlign: TextAlign.left,
                    style: Helper.defaultTextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12)),
                Text(widget.orderDetails.time ?? 'No Order Time',
                    textAlign: TextAlign.left,
                    style: Helper.defaultTextStyle(
                        fontWeight: FontWeight.w400,
                        color: constants.MEDIUM_GREY,
                        fontSize: 12)),
              ],
            ),
            SizedBox(
              width: 55,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.orderDetails.clientName ?? 'No Client Name',
                    textAlign: TextAlign.left,
                    style: Helper.defaultTextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12)),
                Text(widget.orderDetails.clientEmail ?? 'No Client Email',
                    textAlign: TextAlign.left,
                    style: Helper.defaultTextStyle(
                        fontWeight: FontWeight.w400,
                        color: constants.MEDIUM_GREY,
                        fontSize: 12)),
              ],
            ),
            SizedBox(
              width: 120,
            ),
            listAllProducts(
                widget.orderDetails.products ?? ['No Products Available']),
            SizedBox(
              width: 10,
            ),
            Text(widget.orderDetails.deliveryLocation ?? 'No Delivery Location',
                textAlign: TextAlign.left,
                style: Helper.defaultTextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                    fontSize: 12)),
            OrderStatusWidget(
                orderStatus:
                    widget.orderDetails.orderStatus ?? OrderStatus.PREPARING),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.orderDetails.trackingCode ?? 'No Tracking Code',
                    textAlign: TextAlign.left,
                    style: Helper.defaultTextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12)),
                Text(
                    widget.orderDetails.deliveryCompany ??
                        'No Delivery Company',
                    textAlign: TextAlign.left,
                    style: Helper.defaultTextStyle(
                        fontWeight: FontWeight.w400,
                        color: constants.MEDIUM_GREY,
                        fontSize: 12)),
              ],
            ),
            Text(widget.orderDetails.price ?? 'No Price',
                textAlign: TextAlign.left,
                style: Helper.defaultTextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                    fontSize: 12)),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    widget.orderDetails.paymentMethod?.contains('Debit Card') ??
                            false
                        ? 'Debit Card'
                        : widget.orderDetails.paymentMethod
                                    ?.contains('Credit Card') ??
                                false
                            ? 'Credit Card'
                            : widget.orderDetails.paymentMethod ?? '',
                    textAlign: TextAlign.left,
                    style: Helper.defaultTextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12)),
                Text(
                    widget.orderDetails.paymentMethod?.contains('Debit Card') ??
                            false
                        ? widget.orderDetails.paymentMethod
                                ?.split('Debit Card')
                                .last ??
                            ''
                        : widget.orderDetails.paymentMethod
                                    ?.contains('Credit Card') ??
                                false
                            ? widget.orderDetails.paymentMethod
                                    ?.split('Credit Card')
                                    .last ??
                                ''
                            : '',
                    textAlign: TextAlign.left,
                    style: Helper.defaultTextStyle(
                        fontWeight: FontWeight.w400,
                        color: constants.MEDIUM_GREY,
                        fontSize: 12)),
              ],
            ),
            SvgPicture.asset(
              constants.kDotMenuIcon,
            ),
          ],
        ),
      ),
    );
  }
}
