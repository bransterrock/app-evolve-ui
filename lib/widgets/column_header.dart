// ignore: must_be_immutable
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ColumnHeader extends StatefulWidget {
  String text = '';
  ColumnHeader({required this.text});

  @override
  _ColumnHeaderState createState() => _ColumnHeaderState();
}

class _ColumnHeaderState extends State<ColumnHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: Helper.defaultTextStyle(
              color: constants.kMediumGrey,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          Flexible(
            child: SizedBox(
              width: 4,
            ),
          ),
          Flexible(
            child: SvgPicture.asset(
              constants.kSortArrowIcon,
              color: constants.kArrowGrayColor,
            ),
          )
        ],
      ),
    );
  }
}
