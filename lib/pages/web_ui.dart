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
            ],
          ))
    ]);
  }
}
