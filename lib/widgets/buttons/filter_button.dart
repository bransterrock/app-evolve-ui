import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

///Buttons that make up the Header beside the search bar.
// ignore: must_be_immutable
class FilterButton extends StatelessWidget {
  String leadingIconPath;
  String btnText;
  FilterButton({required this.btnText, required this.leadingIconPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 10,
            ),
            SvgPicture.asset(leadingIconPath),
            SizedBox(
              width: 8,
            ),
            Text(
              btnText,
              style: Helper.defaultTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  constants.kDropdownIcon,
                ),
              ],
            ),
            SizedBox(width: 12,)
          ],
        ),
      ),
    );
  }
}
