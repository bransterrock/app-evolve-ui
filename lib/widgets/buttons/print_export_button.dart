import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

// ignore: must_be_immutable
class PrintExportButton extends StatelessWidget {
  String iconPath;
  String btnText;
  PrintExportButton({
    required this.iconPath,
    required this.btnText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 8,
            ),
            SvgPicture.asset(iconPath),
            SizedBox(
              width: 8,
            ),
            Text(
              btnText,
              style: Helper.defaultTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: constants.TURQUOISE),
            ),
            SizedBox(
              width: 8,
            ),
            Visibility(
              visible: btnText.toLowerCase().contains('export'),
              child: Flexible(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      constants.kDropdownIcon,
                      color: constants.TURQUOISE,
                    ),
                    SizedBox(width: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
