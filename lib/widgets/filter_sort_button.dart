import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class FilterSortWidget extends StatefulWidget {
  String imagePath;
  String btnText;
  Function onTap;
  FilterSortWidget(
      {required this.imagePath, required this.btnText, required this.onTap});

  @override
  _FilterSortWidgetState createState() => _FilterSortWidgetState();
}

class _FilterSortWidgetState extends State<FilterSortWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.amber,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(widget.imagePath),
            Flexible(
              child: Text(widget.btnText,
                  style: Helper.defaultTextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                      maxLines: 1,),
            )
          ],
        ),
      ),
      onTap: () {
        widget.onTap();
      },
    );
  }
}
