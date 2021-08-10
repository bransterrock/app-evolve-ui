import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/column_header.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

class ColumnHeaderTitles extends StatefulWidget {
  const ColumnHeaderTitles({Key? key}) : super(key: key);

  @override
  _ColumnHeaderTitlesState createState() => _ColumnHeaderTitlesState();
}

class _ColumnHeaderTitlesState extends State<ColumnHeaderTitles> {
  bool? checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),
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
              SizedBox(
                width: 56,
              ),
              ColumnHeader(text: 'ORDER NO.'),
              SizedBox(
                width: 60,
              ),
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
              SizedBox(
                width: 63,
              ),
              ColumnHeader(text: 'CLIENT'),
              SizedBox(
                width: 244,
              ),
              ColumnHeader(text: 'PRODUCTS'),
              SizedBox(
                width: 212,
              ),
              ColumnHeader(text: 'DISTRIBUTION'),
              SizedBox(width: 90,),
              ColumnHeader(text: 'STATUS'),
              SizedBox(width: 147,),
              ColumnHeader(text: 'TRACKING'),
              SizedBox(width: 65,),
              ColumnHeader(text: 'PRICE'),
              SizedBox(width: 73,),
              ColumnHeader(text: 'PAYMENT'),
            ],
          ),
        ));
  }
}
