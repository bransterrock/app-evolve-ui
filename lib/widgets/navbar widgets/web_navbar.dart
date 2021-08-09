import 'package:app_evolve_ui/widgets/navbar%20widgets/nav_bar_tiles.dart';
import 'package:app_evolve_ui/widgets/navbar%20widgets/profile_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

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
                  padding: const EdgeInsets.symmetric(
                      vertical: 32, horizontal: 20),
                  child: SvgPicture.asset(constants.appEvolveLogo),
                ),
                Container(
                  color: constants.MEDIUM_GREY,
                  height: 1,
                  width: 200,
                ),
              ],
            ),
          ),
          Flexible(flex: 5, child: NavBarTiles()),
          Expanded(
            flex: 3,
            child: Container(
              color: constants.SUPER_DARK_BLUE,
            ),
          ),
           Container(
             height: 6,
              color: constants.SUPER_DARK_BLUE,
            ),
          Container(
            color: constants.MEDIUM_GREY,
            height: 1,
            width: 200,
          ),
          ProfileNavBarWidget()
        ],
      ),
    ]);
  }
}