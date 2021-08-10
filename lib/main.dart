import 'package:app_evolve_ui/pages/orientation_condition.dart';
import 'package:flutter/material.dart';
import 'package:app_evolve_ui/utilities/constants.dart' as constants;
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: constants.kSuperDarkBlue,
    statusBarBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test UI',
      theme: ThemeData(
        primarySwatch: constants.kSuperDarkBlue,
        scaffoldBackgroundColor: constants.kScaffoldBackground,
        appBarTheme: AppBarTheme(brightness: Brightness.dark),
      ),
      home: OrientationCondition(),
    );
  }
}
