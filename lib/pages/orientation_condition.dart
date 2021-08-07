import 'dart:io';

import 'package:app_evolve_ui/pages/mobile_ui.dart';
import 'package:flutter/material.dart';

class OrientationCondition extends StatefulWidget {
  @override
  _OrientationConditionState createState() => _OrientationConditionState();
}

class _OrientationConditionState extends State<OrientationCondition> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? Platform.isAndroid
                //Android needs the SafeArea to properly display icon color above the app bar
                //hence the ternary operator
                ? SafeArea(child: MobileUI())
                : MobileUI()
            : Text(''));
  }
}
