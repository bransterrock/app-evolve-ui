import 'package:app_evolve_ui/models/orientation_type.dart';
import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  String iconPathName;
  TextEditingController controller = TextEditingController();
  Function onTap;
  OrientationType orientationType;
  SearchBar(this.iconPathName,
      {required this.onTap(String text),
      this.orientationType = OrientationType.mobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: orientationType == OrientationType.mobile
          ? const EdgeInsets.all(16.0)
          : const EdgeInsets.all(0),
      child: Container(
        height: 40,
        padding: orientationType == OrientationType.mobile
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 25)
            : const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border: InputBorder.none,
              icon: SvgPicture.asset(iconPathName),
              labelText: 'Search by any parameter',
              labelStyle: Helper.defaultTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: true,
              contentPadding: const EdgeInsets.only(bottom: 5)),
          onSubmitted: (text) {
            this.onTap(text);
          },
        ),
      ),
    );
  }
}
