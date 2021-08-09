import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/column_header.dart';
import 'package:app_evolve_ui/widgets/navbar%20widgets/web_navbar.dart';
import 'package:app_evolve_ui/widgets/web_top_area_widgets.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

class WebUI extends StatefulWidget {
  @override
  _WebUIState createState() => _WebUIState();
}

class _WebUIState extends State<WebUI> {
  String filterImagePath = '';
  String searchIconPath = '';
  String sortIconPath = '';
  bool? checkBoxValue = false;

  @override
  void initState() {
    super.initState();
    filterImagePath = constants.filterLogo;
    searchIconPath = constants.searchIcon;
    sortIconPath = constants.sortIcon;
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
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              SizedBox(
                                width: 4,
                              ),
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
                          Flexible(
                            child: SizedBox(
                              width: 30,
                            ),
                          ),
                          ColumnHeader(text: 'PRODUCTS'),
                          Flexible(
                            child: SizedBox(
                              width: 30,
                            ),
                          ),
                          ColumnHeader(text: 'DISTRIBUTION'),
                          ColumnHeader(text: 'STATUS'),
                          Flexible(
                            child: SizedBox(
                              width: 30,
                            ),
                          ),
                          ColumnHeader(text: 'TRACKING'),
                          ColumnHeader(text: 'PRICE'),
                          ColumnHeader(text: 'PAYMENT'),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ))
              ],
            )),
      ],
    );
  }
}
