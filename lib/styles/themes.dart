import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(
        primary: defaultDarkBlue,
        secondary: defaultAppColor2,
      ),
      iconTheme: const IconThemeData(color: defaultAppWhiteColor),
      buttonTheme: const ButtonThemeData(
        buttonColor: defaultDarkBlue,
      ),
      scaffoldBackgroundColor: defaultAppColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: defaultAppColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          )),
      drawerTheme: const DrawerThemeData(backgroundColor: defaultAppColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: defaultDarkBlue, elevation: 0));

  static ThemeData darkTheme = ThemeData(
    drawerTheme: const DrawerThemeData(backgroundColor: defaultDarkBlue),
    colorScheme: const ColorScheme.light(
      primary: defaultAppColor2,
      secondary: defaultAppColor,
    ),
    iconTheme: const IconThemeData(color: defaultAppWhiteColor),
    buttonTheme: const ButtonThemeData(
      buttonColor: defaultDarkBlue,
    ),
    scaffoldBackgroundColor: defaultDarkBlue,
    appBarTheme: const AppBarTheme(
        backgroundColor: defaultDarkBlue,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: defaultDarkBlue, elevation: 0),
    sliderTheme: SliderThemeData(
      inactiveTickMarkColor: Colors.transparent,
      activeTickMarkColor: Colors.transparent,
      valueIndicatorColor: defaultAppColor.withOpacity(0.5),
    ),
  );
}
