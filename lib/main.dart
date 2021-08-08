import 'package:app_evolve_ui/pages/orientation_condition.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: constants.SUPER_DARK_BLUE,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test UI',
      theme: ThemeData(
        primarySwatch: constants.SUPER_DARK_BLUE,
        scaffoldBackgroundColor: constants.SCAFFOLD_BACKGROUND,
        appBarTheme: AppBarTheme(brightness: Brightness.dark),
      ),
      home: OrientationCondition(),
    );
  }
}
