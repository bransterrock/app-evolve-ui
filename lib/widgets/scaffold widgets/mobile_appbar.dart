import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String image;
  @override
  Size get preferredSize => Size.fromHeight(62);

  const MobileAppBar({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      title: Text(
        'Orders',
        style: Helper.defaultTextStyle(color: Colors.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Center(
              child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 13,
            child: CircleAvatar(
              radius: 12,
              child: Stack(alignment: Alignment.bottomRight, children: [
                ClipOval(
                  child: SvgPicture.asset(image),
                ),
                Container(
                  height: 6.7,
                  width: 6.7,
                  decoration: BoxDecoration(
                      color: constants.kTurquoise, shape: BoxShape.circle),
                ),
              ]),
            ),
          )),
        )
      ],
    );
  }
}
