import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart';

// ignore: must_be_immutable
class OrderDetailsRow extends StatelessWidget {
  String leadingText;
  String trailingText;
  Color boxColor;
  Color textColor;
  OrderDetailsRow(
      {required this.leadingText,
      required this.trailingText,
      this.boxColor = Colors.white,
      this.textColor = SUPER_DARK_BLUE});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Column(
        children: [
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leadingText,
                textAlign: TextAlign.left,
                style: Helper.defaultTextStyle(
                    fontWeight: FontWeight.w400, fontSize: 12),
              ),
              Text(
                trailingText,
                textAlign: TextAlign.right,
                style: Helper.defaultTextStyle(
                  color: textColor,
                    fontWeight: FontWeight.w400, fontSize: 12),
                softWrap: true,
                maxLines: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
