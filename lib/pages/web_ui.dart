import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/models/orientation_type.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/buttons/filter_button.dart';
import 'package:app_evolve_ui/widgets/filter_header_button.dart';
import 'package:app_evolve_ui/widgets/navbar%20widgets/web_navbar.dart';
import 'package:app_evolve_ui/widgets/buttons/print_export_button.dart';
import 'package:app_evolve_ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

class WebUI extends StatefulWidget {
  @override
  _WebUIState createState() => _WebUIState();
}

class _WebUIState extends State<WebUI> {
  String filterImagePath = '';
  String searchIconPath = '';
  String sortIconPath = '';
  List<OrderDetails> orderDetails = [];
  OrderStatus orderStatus = OrderStatus.PREPARING;
  ScrollController controller = ScrollController();
  List<bool> filterTapBooleans = [true, false, false, false, false, false];
  @override
  void initState() {
    super.initState();
    filterImagePath = constants.filterLogo;
    searchIconPath = constants.searchIcon;
    sortIconPath = constants.sortIcon;
    orderDetails = OrderDetails.loadOrderDetails();
  }

  isButtonTapped(int index, [bool sortWasTapped = false]) {
    // ignore: unused_local_variable
    for (int taps = 0; taps < filterTapBooleans.length; ++taps) {
      filterTapBooleans[taps] = false;
    }
    filterTapBooleans[index] = true;
    if (sortWasTapped) {
      for (int taps = 0; taps < filterTapBooleans.length; ++taps) {
        filterTapBooleans[taps] = false;
      }
    }
    orderStatus = OrderDetails.setOrderStatus(index);
    orderDetails = OrderDetails.loadOrderDetails();
    orderDetails = OrderDetails.filterFunction(orderStatus, orderDetails);
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          'Orders',
                          style: Helper.defaultTextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Spacer(
                        flex: 13,
                      ),
                      Flexible(
                        flex: 1,
                        child: PrintExportButton(
                            btnText: 'Print', iconPath: constants.kPrintIcon),
                      ),
                      Flexible(
                        flex: 1,
                        child: PrintExportButton(
                            btnText: 'Export', iconPath: constants.kExportIcon),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          flex: 3,
                          child: SearchBar(
                            constants.searchIcon,
                            onTap: (text) => null,
                            orientationType: OrientationType.web,
                          )),
                      SizedBox(width: 8),
                      Flexible(
                        child: FilterButton(
                          btnText: 'Date Range',
                          leadingIconPath: constants.kDateIcon,
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: FilterButton(
                          btnText: 'Order Status',
                          leadingIconPath: constants.kOrderStatusIcon,
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: FilterButton(
                          btnText: 'Distibution City',
                          leadingIconPath: constants.kDistribution,
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: FilterButton(
                          btnText: 'More Filters',
                          leadingIconPath: constants.filterLogo,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Divider(
                    color: constants.MEDIUM_GREY,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5 , 20, 30, 0),
                  child: Container(
                    height: 30,
                    child: ListView.builder(
                        itemCount: constants.filterTitles.length,
                        scrollDirection: Axis.horizontal,
                        controller: controller,
                        itemBuilder: (context, index) {
                          return FilterHeader(
                              orientationType: OrientationType.web,
                              index: index,
                              title: constants.filterTitles[index],
                              numberValue: constants.filternumberValues[index],
                              isTapped: filterTapBooleans[index],
                              onTap: () => setState(() {
                                    isButtonTapped(index);
                                    controller.jumpTo(0);
                                  }));
                        }),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
