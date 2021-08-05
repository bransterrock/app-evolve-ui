import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class FilterSearchWidget extends StatelessWidget {
  String imagePath;
  String btnText;
  FilterSearchWidget({
    required this.imagePath,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            Text(btnText,
                style: Helper.defaultTextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
