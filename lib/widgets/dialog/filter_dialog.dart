import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

///Simple Dialog that shows when filter button is pressed in mobile view
// ignore: must_be_immutable
class FilterDialog extends StatelessWidget {
  OrderStatus orderStatus;
  FilterDialog({required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: constants.kScaffoldBackground,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      title: Center(child: Text('Filter')),
      titleTextStyle:
          Helper.defaultTextStyle(color: OrderDetails.getBtnColor(orderStatus)),
      content: Text(
        'Please select one of the filter buttons above the order details for filtering',
        textAlign: TextAlign.center,
      ),
      contentTextStyle: Helper.defaultTextStyle(
          color: Theme.of(context).primaryColor, fontSize: 18),
    );
  }
}
