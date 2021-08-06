import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  String iconPathName;
  TextEditingController controller = TextEditingController();
  Function onTap;
  SearchBar(this.iconPathName, {required this.onTap(String text)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
