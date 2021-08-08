import 'package:app_evolve_ui/models/order_details.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/dialog/filter_dialog.dart';
import 'package:app_evolve_ui/widgets/filter_header_button.dart';
import 'package:app_evolve_ui/widgets/filter_sort_button.dart';
import 'package:app_evolve_ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_evolve_ui/widgets/order%20details/order_details_card.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

class MobileUI extends StatefulWidget {
  @override
  _MobileUIState createState() => _MobileUIState();
}

class _MobileUIState extends State<MobileUI> {
  String image = '';
  String logoPath = '';
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
    image = constants.avatarImageSvg;
    logoPath = constants.appEvolveLogo;
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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          'Orders',
          style: Helper.defaultTextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
                child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: CircleAvatar(
                radius: 13.5,
                child: Stack(alignment: Alignment.bottomRight, children: [
                  ClipOval(
                    child: SvgPicture.asset(image),
                  ),
                  Container(
                    height: 6.7,
                    width: 6.7,
                    decoration: BoxDecoration(
                        color: constants.TURQUOISE, shape: BoxShape.circle),
                  ),
                ]),
              ),
            )),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: DrawerHeader(
            child: SvgPicture.asset(
              logoPath,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      body: Column(
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
              color: constants.MEDIUM_GREY,
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
                itemCount: constants.filterTitles.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FilterHeader(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
        ],
      ),
    );
  }
}
