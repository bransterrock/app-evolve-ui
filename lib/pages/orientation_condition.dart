import 'package:app_evolve_ui/models/orientation_type.dart';
import 'package:app_evolve_ui/pages/mobile_ui.dart';
import 'package:app_evolve_ui/pages/web_ui.dart';
import 'package:app_evolve_ui/widgets/scaffold%20widgets/mobile_appbar.dart';
import 'package:app_evolve_ui/widgets/scaffold%20widgets/mobile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

class OrientationCondition extends StatefulWidget {
  @override
  _OrientationConditionState createState() => _OrientationConditionState();
}

class _OrientationConditionState extends State<OrientationCondition> {
  String? image = '';
  String? logoPath = '';
  OrientationType? orientationType = OrientationType.mobile;

  @override
  void initState() {
    super.initState();
    image = constants.kAvatarImageSvg;
    logoPath = constants.kAppEvolveLogo;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        orientationType = OrientationType.mobile;
      } else {
        orientationType = OrientationType.web;
      }
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: orientation == Orientation.portrait
            ? MobileAppBar(image: image ?? '')
            : null,
        drawer: orientation == Orientation.portrait
            ? MobileDrawer(logoPath: logoPath ?? '')
            : null,
        body: orientation == Orientation.portrait ? MobileUI() : WebUI(),
      );
    });
    //
  }
}
