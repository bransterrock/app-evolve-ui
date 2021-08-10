import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/widgets/column_titles.dart';
import 'package:app_evolve_ui/widgets/navbar%20widgets/web_navbar.dart';
import 'package:app_evolve_ui/widgets/order%20details/order_detail_table.dart';
import 'package:app_evolve_ui/widgets/order%20details/order_details_card.dart';
import 'package:app_evolve_ui/widgets/web_footer.dart';
import 'package:app_evolve_ui/widgets/web_top_area_widgets.dart';
import 'package:flutter/material.dart';

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
              MediaQuery.of(context).size.width > 1364
                  ? ColumnHeaderTitles()
                  : SizedBox.shrink(),
              MediaQuery.of(context).size.width > 1164
                  ? Expanded(
                      child: ListView.builder(
                      itemCount: orderDetails.length,
                      itemBuilder: (context, index) =>
                          OrderDetailsTable(orderDetails: orderDetails[index]),
                    ))
                  : Expanded(
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                          child: ListView.builder(
                            itemCount: orderDetails.length,
                            itemBuilder: (context, index) => OrderDetailsCard(
                              orderId: orderDetails[index].orderId,
                              orderStatus: orderDetails[index].orderStatus,
                              orderDate: orderDetails[index].orderDate,
                              time: orderDetails[index].time,
                              deliveryLocation:
                                  orderDetails[index].deliveryLocation,
                              clientName: orderDetails[index].clientName,
                              clientEmail: orderDetails[index].clientEmail,
                              deliveryCompany:
                                  orderDetails[index].deliveryCompany,
                              trackingCode: orderDetails[index].trackingCode,
                              products: orderDetails[index].products,
                              price: orderDetails[index].price,
                              paymentMethod: orderDetails[index].paymentMethod,
                            ),
                          ),
                        ),
                      ),
                    ),
              WebFooter(),
            ],
          ))
    ]);
  }
}
