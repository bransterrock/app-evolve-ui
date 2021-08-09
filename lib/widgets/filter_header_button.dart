import 'package:app_evolve_ui/models/orientation_type.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

// ignore: must_be_immutable
class FilterHeader extends StatefulWidget {
  String title;
  int numberValue;
  bool isTapped;
  int index;
  OrientationType orientationType;
  Function onTap;
  FilterHeader(
      {required this.title,
      required this.numberValue,
      required this.index,
      required this.isTapped,
      this.orientationType = OrientationType.mobile,
      required this.onTap});

  @override
  _FilterHeaderState createState() => _FilterHeaderState();
}

class _FilterHeaderState extends State<FilterHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.index == 0 ? 16 : 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        splashColor: constants.TURQUOISE,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
              color: widget.isTapped
                  ? constants.TURQUOISE.withOpacity(0.25)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: Helper.defaultTextStyle(
                  fontSize: widget.orientationType == OrientationType.mobile
                      ? 14
                      : 16,
                  color: widget.isTapped
                      ? constants.TURQUOISE
                      : constants.MEDIUM_GREY,
                ),
              ),
              SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                decoration: BoxDecoration(
                    color: widget.isTapped
                        ? constants.TURQUOISE
                        : constants.MEDIUM_GREY,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15), bottom: Radius.circular(15)),
                    shape: BoxShape.rectangle),
                child: Text(
                  widget.numberValue.toString(),
                  style: Helper.defaultTextStyle(
                      fontSize: widget.orientationType == OrientationType.mobile
                          ? 8
                          : 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          widget.onTap();
        },
      ),
    );
  }
}
