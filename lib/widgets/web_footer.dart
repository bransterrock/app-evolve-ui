import 'package:app_evolve_ui/utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('1-20 of 294'),
          Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: constants.kTurquoise,
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 20),
                Text(
                  'Next Row',
                  style: Helper.defaultTextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 8),
                SvgPicture.asset(
                  constants.kArrowIcon,
                  height: 16,
                  width: 11,
                ),
                SizedBox(width: 12),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Text(
                  '1',
                  style: Helper.defaultTextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'of 15',
                style: Helper.defaultTextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 8),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                alignment: Alignment.center,
                child: RotatedBox(
                    quarterTurns: 1,
                    child: SvgPicture.asset(
                      constants.kDropdownIcon,
                      color: constants.kTurquoise.withOpacity(0.25),
                    )),
              ),
              SizedBox(width: 8),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                alignment: Alignment.center,
                child: RotatedBox(
                    quarterTurns: -1,
                    child: SvgPicture.asset(
                      constants.kDropdownIcon,
                      color: constants.kTurquoise,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
