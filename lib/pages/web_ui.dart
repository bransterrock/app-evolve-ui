import 'dart:ui';

import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/column_header.dart';
import 'package:app_evolve_ui/widgets/column_titles.dart';
import 'package:app_evolve_ui/widgets/navbar%20widgets/web_navbar.dart';
import 'package:app_evolve_ui/widgets/order%20details/order_detail_table_item.dart';
import 'package:app_evolve_ui/widgets/order%20details/order_status_widget.dart';
import 'package:app_evolve_ui/widgets/web_top_area_widgets.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

class WebUI extends StatefulWidget {
  @override
  _WebUIState createState() => _WebUIState();
}

class _WebUIState extends State<WebUI> {
  bool? checkBoxValue = false;
  List<OrderDetails> orderDetails = [];

  @override
  void initState() {
    super.initState();
    orderDetails = OrderDetails.loadOrderDetails();
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
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: WebNavBar(),
        ),
        Flexible(
            flex: 9,
            child: Column(
              children: [
                WebTopAreaWidgets(),
                //ColumnHeaderTitles(),
                // Expanded(
                //     child: ListView.builder(
                //         itemCount: orderDetails.length,
                //         itemBuilder: (context, index) => OrderDetailTableItem(
                //             orderDetails: orderDetails[index])))
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    defaultColumnWidth: FixedColumnWidth(150.0),
                    columnWidths: {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(3),
                      2: FlexColumnWidth(3),
                      3: FlexColumnWidth(4),
                      4: FlexColumnWidth(6),
                      5: FlexColumnWidth(5),
                      6: FlexColumnWidth(3),
                      10: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          children: [
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
                            ColumnHeader(text: 'ORDER NO.'),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'CREATED',
                                  style: Helper.defaultTextStyle(
                                    color: constants.SUPER_DARK_BLUE,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      constants.kSortArrowUp,
                                      color: constants.MEDIUM_GREY,
                                    ),
                                    SvgPicture.asset(
                                      constants.kSortArrowDown,
                                      color: constants.kArrowGrayColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ColumnHeader(text: 'CLIENT'),
                            ColumnHeader(text: 'PRODUCTS'),
                            ColumnHeader(text: 'DISTRIBUTION'),
                            ColumnHeader(text: 'STATUS'),
                            ColumnHeader(text: 'TRACKING'),
                            ColumnHeader(text: 'PRICE'),
                            ColumnHeader(text: 'PAYMENT'),
                            SizedBox(width: 3),
                          ]),
                    ],
                  ),
                ),
                ////////  END OF HEADER
                Expanded(
                  child: 
                  ListView.builder(
                    itemCount: orderDetails.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        defaultColumnWidth: FixedColumnWidth(150.0),
                        columnWidths: {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(3),
                          2: FlexColumnWidth(3),
                          3: FlexColumnWidth(4),
                          4: FlexColumnWidth(6),
                          5: FlexColumnWidth(5),
                          6: FlexColumnWidth(3),
                          10: FlexColumnWidth(1),
                        },
                        children: [
                          TableRow(
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
                              children: [
                                Checkbox(
                                  value: checkBoxValue,
                                  activeColor: constants.TURQUOISE,
                                  hoverColor:
                                      constants.TURQUOISE.withOpacity(0.25),
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
                                Flexible(
                                  child: Text(
                                    orderDetails[index].orderId ??
                                        'No Order ID',
                                    textAlign: TextAlign.left,
                                    style: Helper.defaultTextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        orderDetails[index].orderDate ??
                                            'No Order Date',
                                        textAlign: TextAlign.left,
                                        style: Helper.defaultTextStyle(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 12)),
                                    Text(
                                        orderDetails[index].time ??
                                            'No Order Time',
                                        textAlign: TextAlign.left,
                                        style: Helper.defaultTextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: constants.MEDIUM_GREY,
                                            fontSize: 12)),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        orderDetails[index].clientName ??
                                            'No Client Name',
                                        textAlign: TextAlign.left,
                                        style: Helper.defaultTextStyle(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 12)),
                                    Text(
                                        orderDetails[index].clientEmail ??
                                            'No Client Email',
                                        textAlign: TextAlign.left,
                                        style: Helper.defaultTextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: constants.MEDIUM_GREY,
                                            fontSize: 12)),
                                  ],
                                ),
                                listAllProducts(orderDetails[index].products ??
                                    ['No Products Available']),
                                Text(
                                    orderDetails[index].deliveryLocation ??
                                        'No Delivery Location',
                                    textAlign: TextAlign.left,
                                    style: Helper.defaultTextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12)),
                                TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: Center(
                                    child: OrderStatusWidget(
                                        orderStatus:
                                            orderDetails[index].orderStatus ??
                                                OrderStatus.PREPARING),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        orderDetails[index].trackingCode ??
                                            'No Tracking Code',
                                        textAlign: TextAlign.left,
                                        style: Helper.defaultTextStyle(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 12)),
                                    Text(
                                        orderDetails[index].deliveryCompany ??
                                            'No Delivery Company',
                                        textAlign: TextAlign.left,
                                        style: Helper.defaultTextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: constants.MEDIUM_GREY,
                                            fontSize: 12)),
                                  ],
                                ),
                                Text(orderDetails[index].price ?? 'No Price',
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
                                        orderDetails[index]
                                                    .paymentMethod
                                                    ?.contains('Debit Card') ??
                                                false
                                            ? 'Debit Card'
                                            : orderDetails[index]
                                                        .paymentMethod
                                                        ?.contains(
                                                            'Credit Card') ??
                                                    false
                                                ? 'Credit Card'
                                                : orderDetails[index]
                                                        .paymentMethod ??
                                                    '',
                                        textAlign: TextAlign.left,
                                        style: Helper.defaultTextStyle(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 12)),
                                    Text(
                                        orderDetails[index]
                                                    .paymentMethod
                                                    ?.contains('Debit Card') ??
                                                false
                                            ? orderDetails[index]
                                                    .paymentMethod
                                                    ?.split('Debit Card')
                                                    .last ??
                                                ''
                                            : orderDetails[index]
                                                        .paymentMethod
                                                        ?.contains(
                                                            'Credit Card') ??
                                                    false
                                                ? orderDetails[index]
                                                        .paymentMethod
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
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
