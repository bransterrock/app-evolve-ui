import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:app_evolve_ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

class MobileUI extends StatefulWidget {
  @override
  _MobileUIState createState() => _MobileUIState();
}

class _MobileUIState extends State<MobileUI> {
  String image = '';
  String logoPath = '';
  @override
  void initState() {
    super.initState();
    image = constants.avatarImageSvg;
    logoPath = constants.appEvolveLogo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.SCAFFOLD_BACKGROUND,
      drawer: Drawer(
        child: Container(
          color: constants.SUPER_DARK_BLUE,
          child: ListView(
            children: [
              DrawerHeader(
                child: SvgPicture.asset(
                  logoPath,
                  fit: BoxFit.scaleDown,
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        //leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text(
          'Orders',
          style: Helper.defaultTextStyle(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
                child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: CircleAvatar(
                radius: 13.5,
                child: ClipOval(
                  child: SvgPicture.asset(image),
                ),
              ),
            )),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
               SearchBar()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
