// ignore: must_be_immutable
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ColumnHeader extends StatefulWidget {
  String text = '';
   ColumnHeader({
    required this.text
  });

  @override
  _ColumnHeaderState createState() => _ColumnHeaderState();
}

class _ColumnHeaderState extends State<ColumnHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          widget.text,
          style: Helper.defaultTextStyle(
            color: constants.MEDIUM_GREY,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        SvgPicture.asset(
          constants.kSortArrowIcon,
          color: constants.kArrowGrayColor,
        )
      ],
    );
  }
}
