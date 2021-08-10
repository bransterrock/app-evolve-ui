import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/widgets/dialog/filter_dialog.dart';
import 'package:app_evolve_ui/widgets/filter_header_button.dart';
import 'package:app_evolve_ui/widgets/buttons/filter_sort_button.dart';
import 'package:app_evolve_ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/widgets/order%20details/order_details_card.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

// ignore: must_be_immutable
class MobileUI extends StatefulWidget {
  MobileUI();
  @override
  _MobileUIState createState() => _MobileUIState();
}

class _MobileUIState extends State<MobileUI> {
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
    filterImagePath = constants.kFilterLogo;
    searchIconPath = constants.kSearchIcon;
    sortIconPath = constants.kSortIcon;
    orderDetails = OrderDetails.loadOrderDetails();
  }

  ///Determines what action is taken based on what filter header button was tapped
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
    return Column(
      children: [
        SearchBar(searchIconPath, onTap: (text) {
          setState(() {
            orderDetails = OrderDetails.loadOrderDetails();
            orderDetails = OrderDetails.searchFunction(text, orderDetails);
          });
        }),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: FilterSortWidget(
                  imagePath: filterImagePath,
                  btnText: 'Filters',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            FilterDialog(orderStatus: orderStatus));
                  },
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Flexible(
                child: FilterSortWidget(
                    imagePath: sortIconPath,
                    btnText: 'Sort',
                    onTap: () {
                      setState(() {
                        isButtonTapped(0, true);
                        orderDetails = OrderDetails.sortFunction(orderDetails);
                        controller.jumpTo(0);
                      });
                    }),
              ),
            ],
          ),
        ),
        Opacity(
          opacity: 0.25,
          child: Divider(
            color: constants.kMediumGrey,
            height: 1,
            thickness: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 30,
          child: ListView.builder(
              itemCount: constants.kFilterTitles.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FilterHeader(
                    index: index,
                    title: constants.kFilterTitles[index],
                    numberValue: constants.kFilternumberValues[index],
                    isTapped: filterTapBooleans[index],
                    onTap: () => setState(() {
                          isButtonTapped(index);
                          controller.jumpTo(0);
                        }));
              }),
        ),
        Expanded(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: ListView.builder(
                controller: controller,
                itemCount: orderDetails.length,
                itemBuilder: (context, index) => OrderDetailsCard(
                  orderId: orderDetails[index].orderId,
                  orderStatus: orderDetails[index].orderStatus,
                  orderDate: orderDetails[index].orderDate,
                  time: orderDetails[index].time,
                  deliveryLocation: orderDetails[index].deliveryLocation,
                  clientName: orderDetails[index].clientName,
                  clientEmail: orderDetails[index].clientEmail,
                  deliveryCompany: orderDetails[index].deliveryCompany,
                  trackingCode: orderDetails[index].trackingCode,
                  products: orderDetails[index].products,
                  price: orderDetails[index].price,
                  paymentMethod: orderDetails[index].paymentMethod,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
