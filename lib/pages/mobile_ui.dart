import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/filter_header_button.dart';
import 'package:app_evolve_ui/widgets/filter_sort_button.dart';
import 'package:app_evolve_ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_evolve_ui/widgets/order_details_card.dart';
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
  List<bool> filterTapBooleans = [true, false, false, false, false, false];
  @override
  void initState() {
    super.initState();
    image = constants.avatarImageSvg;
    logoPath = constants.appEvolveLogo;
    filterImagePath = constants.filterLogo;
    searchIconPath = constants.searchIcon;
    sortIconPath = constants.sortIcon;
  }

  isButtonTapped(int index) {
    // ignore: unused_local_variable
    for (int taps = 0; taps < filterTapBooleans.length; ++taps) {
      filterTapBooleans[taps] = false;
    }
    filterTapBooleans[index] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.SCAFFOLD_BACKGROUND,
      drawer: Drawer(
        child: Container(
          color: constants.SUPER_DARK_BLUE,
          child: ListView(
            children: [
              DrawerHeader(
                child: SvgPicture.asset(
                  logoPath,
                  fit: BoxFit.scaleDown,
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        //leading: Icon(Icons.menu),
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
      body: Column(
        children: [
          SearchBar(searchIconPath),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: FilterSortWidget(
                    imagePath: filterImagePath, btnText: 'Filter'),
              ),
              Flexible(
                child:
                    FilterSortWidget(imagePath: sortIconPath, btnText: 'Sort'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Opacity(
              opacity: 0.25,
              child: Divider(
                color: constants.MEDIUM_GREY,
                thickness: 1,
              ),
            ),
          ),
          Container(
            height: 40,
            child: ListView.builder(
                itemCount: constants.filterTitles.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FilterHeader(
                      title: constants.filterTitles[index],
                      numberValue: constants.filternumberValues[index],
                      isTapped: filterTapBooleans[index],
                      onTap: () => setState(() {
                            isButtonTapped(index);
                          }));
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: OrderDetailsCard(),
          ),
        ],
      ),
    );
  }
}
