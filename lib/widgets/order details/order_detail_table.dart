import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/order%20details/order_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class OrderDetailsTable extends StatefulWidget {
  OrderDetails orderDetails;
  OrderDetailsTable({required this.orderDetails});

  @override
  _OrderDetailsTableState createState() => _OrderDetailsTableState();
}

class _OrderDetailsTableState extends State<OrderDetailsTable> {
  bool? checkBoxValue = false;

  @override
  void initState() {
    super.initState();
    checkBoxValue = widget.orderDetails.clientName?.contains('Matthew');
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
                      color: constants.kTurquoise))
            ]),
      );
    }
    for (var product in products) {
      completeProductString = completeProductString + product + '\n';
    }

    return RichText(
      maxLines: 2,
      textAlign: TextAlign.left,
      text: TextSpan(
          style: Helper.defaultTextStyle(
              fontSize: 12, fontWeight: FontWeight.w400),
          children: <TextSpan>[TextSpan(text: completeProductString)]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        defaultColumnWidth: FixedColumnWidth(150.0),
        columnWidths: {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(3),
          3: FlexColumnWidth(4),
          4: FlexColumnWidth(6),
          5: FlexColumnWidth(2.8),
          6: FlexColumnWidth(2.4),
          10: FlexColumnWidth(1),
        },
        children: [
          TableRow(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: checkBoxValue ?? false
                      ? [
                          BoxShadow(
                            blurRadius: 9,
                            color: constants.kMediumGrey.withOpacity(0.2),
                            spreadRadius: 0.3,
                          ),
                        ]
                      : null,
                  borderRadius: BorderRadius.circular(4)),
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value: checkBoxValue,
                    activeColor: constants.kTurquoise,
                    hoverColor: constants.kTurquoise.withOpacity(0.25),
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
                ),
                Text(
                  widget.orderDetails.orderId ?? 'No Order ID',
                  textAlign: TextAlign.left,
                  style: Helper.defaultTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
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
                            color: constants.kMediumGrey,
                            fontSize: 12)),
                  ],
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
                            color: constants.kMediumGrey,
                            fontSize: 12)),
                  ],
                ),
                listAllProducts(
                    widget.orderDetails.products ?? ['No Products Available']),
                Text(
                    widget.orderDetails.deliveryLocation ??
                        'No Delivery Location',
                    textAlign: TextAlign.left,
                    style: Helper.defaultTextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: OrderStatusWidget(
                      orderStatus: widget.orderDetails.orderStatus ??
                          OrderStatus.PREPARING),
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
                            color: constants.kMediumGrey,
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
                        widget.orderDetails.paymentMethod
                                    ?.contains('Debit Card') ??
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
                        widget.orderDetails.paymentMethod
                                    ?.contains('Debit Card') ??
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
                            color: constants.kMediumGrey,
                            fontSize: 12)),
                  ],
                ),
                SvgPicture.asset(
                  constants.kDotMenuIcon,
                ),
              ]),
        ],
      ),
    );
  }
}
