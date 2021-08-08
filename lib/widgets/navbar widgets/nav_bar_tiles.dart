import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

class NavBarTiles extends StatefulWidget {
  NavBarTiles();

  @override
  _NavBarTilesState createState() => _NavBarTilesState();
}

class _NavBarTilesState extends State<NavBarTiles> {
  int selectedIndex = constants.kNavBarTitles.length;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: constants.kNavBarTitles.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Stack(children: [
              Visibility(
                visible: index == selectedIndex,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 55,
                      width: 5,
                      color: constants.kNavBarColor,
                    )),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(top: 8),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SvgPicture.asset(constants.kNavBarIconPaths[index]),
                ),
                horizontalTitleGap: 10,
                title: Text(
                  constants.kNavBarTitles[index],
                  maxLines: 1,
                  style: Helper.defaultTextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                tileColor: Theme.of(context).primaryColor,
                hoverColor: index == selectedIndex
                    ? constants.kNavBarColor
                    : constants.TURQUOISE,
                selectedTileColor: constants.kNavBarColor,
                selected: index == selectedIndex,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ]));
  }
}
