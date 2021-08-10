import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

///Navbar List Tiles
class NavBarTiles extends StatefulWidget {
  NavBarTiles();

  @override
  _NavBarTilesState createState() => _NavBarTilesState();
}

class _NavBarTilesState extends State<NavBarTiles> {
  int selectedIndex = 1;
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
                      height: 60,
                      width: 5,
                      color: constants.kNavBarColor,
                    )),
              ),
              Column(
                children: [
                  Container(
                    height: 4,
                    color: Theme.of(context).primaryColor,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(top: 8),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: SvgPicture.asset(
                        constants.kNavBarIconPaths[index],
                        color: constants.kNavBarTitles[index].isEmpty
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
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
                        : constants.kTurquoise,
                    selectedTileColor: constants.kNavBarColor,
                    selected: index == selectedIndex,
                    enabled: constants.kNavBarTitles[index].isNotEmpty,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ],
              ),
            ]));
  }
}
