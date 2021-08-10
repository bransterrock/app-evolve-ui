import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    Key? key,
    required this.logoPath,
  }) : super(key: key);

  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: DrawerHeader(
          child: SvgPicture.asset(
            logoPath,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
