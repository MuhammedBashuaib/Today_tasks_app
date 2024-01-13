import 'package:flutter/material.dart';

//my colors
//////////////////////////////////////////////////////////////

class MyColors {
  static const Color myTeal = Colors.teal;
  static const Color myWhite = Colors.white;
}
//////////////////////////////////////////////////////////////

//my Icons
//////////////////////////////////////////////////////////////
class MyIcons {
  static const Icon add = Icon(Icons.add);
  static const Icon playListAddCheck = Icon(Icons.playlist_add_check);
}
//////////////////////////////////////////////////////////////

//Screen coordinates and the default size of the font
//////////////////////////////////////////////////////////////
double widthScreen = 0;
double heightScreen = 0;
double fSize = 0;

initializeHWFSize(BuildContext context) {
  widthScreen = MediaQuery.of(context).size.width;
  heightScreen = MediaQuery.of(context).size.height;
  fSize = widthScreen / 25;
}
//////////////////////////////////////////////////////////////

