import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WebUI extends StatefulWidget {
  @override
  _WebUIState createState() => _WebUIState();
}

class _WebUIState extends State<WebUI> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constants.SCAFFOLD_BACKGROUND,
        body: Row(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [SvgPicture.asset(constants.appEvolveLogo)],
              ),
            ),
            Expanded(
              child: Center(
                child: Text('HELLO WORLD'),
              ),
            ),
          ],
        ));
  }
}
