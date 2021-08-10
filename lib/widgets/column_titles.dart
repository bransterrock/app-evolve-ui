import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/column_header.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

///Header Widget to be displayed in the table for the Web View
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
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        defaultColumnWidth: FixedColumnWidth(150.0),
        columnWidths: {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(3),
          3: FlexColumnWidth(4),
          4: FlexColumnWidth(6),
          5: FlexColumnWidth(2.9),
          6: FlexColumnWidth(2.2),
          10: FlexColumnWidth(1),
        },
        children: [
          TableRow(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              children: [
                Checkbox(
                  value: checkBoxValue,
                  activeColor: constants.kTurquoise,
                  hoverColor: constants.kTurquoise.withOpacity(0.25),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CREATED',
                      style: Helper.defaultTextStyle(
                        color: constants.kSuperDarkBlue,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          constants.kSortArrowUp,
                          color: constants.kMediumGrey,
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
                ColumnHeader(text: 'PRODUCTS'),
                ColumnHeader(text: 'DISTRIBUTION'),
                ColumnHeader(text: 'STATUS'),
                ColumnHeader(text: 'TRACKING'),
                ColumnHeader(text: 'PRICE'),
                ColumnHeader(text: 'PAYMENT'),
                SizedBox(width: 3),
              ]),
        ],
      ),
    );
  }
}
