import 'dart:ui';

import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/column_header.dart';
import 'package:app_evolve_ui/widgets/column_titles.dart';
import 'package:app_evolve_ui/widgets/navbar%20widgets/web_navbar.dart';
import 'package:app_evolve_ui/widgets/order%20details/order_detail_table.dart';
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

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
        flex: 1,
        child: WebNavBar(),
      ),
      Flexible(
          flex: 9,
          child: Column(
            children: [
              WebTopAreaWidgets(),
              ColumnHeaderTitles(),
              Expanded(
                  child: ListView.builder(
                itemCount: orderDetails.length,
                itemBuilder: (context, index) =>
                    OrderDetailsTable(orderDetails: orderDetails[index]),
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1-20 of 294'),
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: constants.TURQUOISE,
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 20),
                          Text(
                            'Next Row',
                            style: Helper.defaultTextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 8),
                          SvgPicture.asset(
                            constants.kArrowIcon,
                            height: 16,
                            width: 11,
                          ),
                          SizedBox(width: 12),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white),
                          alignment: Alignment.center,
                          child: Text(
                            '1',
                            style: Helper.defaultTextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'of 15',
                          style: Helper.defaultTextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: 8),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white),
                          alignment: Alignment.center,
                          child: RotatedBox(
                              quarterTurns: 1,
                              child: SvgPicture.asset(
                                constants.kDropdownIcon,
                                color: constants.TURQUOISE.withOpacity(0.25),
                              )),
                        ),
                        SizedBox(width: 8),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white),
                          alignment: Alignment.center,
                          child: RotatedBox(
                              quarterTurns: -1,
                              child: SvgPicture.asset(
                                constants.kDropdownIcon,
                                color: constants.TURQUOISE,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ))
    ]);
  }
}
