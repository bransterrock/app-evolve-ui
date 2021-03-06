import 'package:app_evolve_ui/widgets/navbar%20widgets/nav_bar_tiles.dart';
import 'package:app_evolve_ui/widgets/navbar%20widgets/profile_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

///The Nav Bar displyed in the Web View
class WebNavBar extends StatelessWidget {
  const WebNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Theme.of(context).primaryColor.withOpacity(0.75),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                  child: SvgPicture.asset(constants.kAppEvolveLogo),
                ),
                Container(
                  color: constants.kMediumGrey,
                  height: 1,
                  width: 200,
                ),
              ],
            ),
          ),
          Flexible(flex: 5, child: NavBarTiles()),
          Container(
            color: constants.kSuperDarkBlue,
          ),
          Container(
            height: 6,
            color: constants.kSuperDarkBlue,
          ),
          Container(
            color: constants.kMediumGrey,
            height: 1,
            width: 200,
          ),
          ProfileNavBarWidget()
        ],
      ),
    ]);
  }
}
