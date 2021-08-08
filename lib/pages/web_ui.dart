import 'package:app_evolve_ui/widgets/navbar%20widgets/web_navbar.dart';
import 'package:flutter/material.dart';

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
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: WebNavBar(),
        ),
        Flexible(
          flex: 9,
          child: Center(
            child: Text('HELLO WORLD'),
          ),
        ),
      ],
    );
  }
}




