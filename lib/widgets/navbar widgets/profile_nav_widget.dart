import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

class ProfileNavBarWidget extends StatelessWidget {
  const ProfileNavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      color: constants.SUPER_DARK_BLUE,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 5,),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: CircleAvatar(
              radius: 18,
              child: Stack(alignment: Alignment.bottomRight, children: [
                ClipOval(
                  child: SvgPicture.asset(constants.avatarImageSvg),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: constants.TURQUOISE, shape: BoxShape.circle),
                ),
              ]),
            ),
          ),
          Text(
            'Admin',
            style: Helper.defaultTextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(width: 35),
          SvgPicture.asset(constants.kSettingIcon),
          SizedBox(width: 10,)
        ],
      ),
    );
  }
}