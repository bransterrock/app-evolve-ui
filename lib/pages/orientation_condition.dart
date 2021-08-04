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
        builder: (context, orientation) =>
            orientation == Orientation.portrait ? MobileUI() : Text(''));
  }
}
