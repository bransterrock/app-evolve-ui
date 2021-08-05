import 'package:flutter/material.dart';

//Color Strings
const MaterialColor SUPER_DARK_BLUE = MaterialColor(0xff2C2D35, <int, Color>{
  50: Color(0xff2C2D35),
  100: Color(0xff2C2D35),
  200: Color(0xff2C2D35),
  300: Color(0xff2C2D35),
  400: Color(0xff2C2D35),
  500: Color(0xff2C2D35),
  600: Color(0xff2C2D35),
  700: Color(0xff2C2D35),
  800: Color(0xff2C2D35),
  900: Color(0xff2C2D35),
});
const Color SCAFFOLD_BACKGROUND = Color(0xffE5E5E5);
const Color MEDIUM_GREY = Color(0xff8C8A98);
const Color TURQUOISE = Color(0xff55A3AE);

//Image Path Strings
const String imagePath = 'assets/images';
const String avatarImage = '$imagePath/avatar_image.png';
const String avatarImageSvg = '$imagePath/avatar_image_svg.svg';
const String appEvolveLogo = '$imagePath/appevolve_logo.svg';

//Icon Path Strings
const String iconPath = 'assets/icons';
const String filterLogo = '$iconPath/filter_icon.svg';
const String searchIcon = '$iconPath/magnifying_glass.svg';
const String sortIcon = '$iconPath/sort.svg';

const List<String> filterTitles = [
  'All Orders',
  'Preparing',
  'Sent',
  'Returned',
  'Cancelled',
  'Delivered',
];
const List<int> filternumberValues = [294, 12, 77, 14, 16, 134];
