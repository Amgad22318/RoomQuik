import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme.light(
        primary: defaultAppColor4,
        secondary: defaultAppColor4,
      ),
      iconTheme: IconThemeData(color: defaultAppColor4),
      buttonTheme: const ButtonThemeData(
        buttonColor: defaultAppColor3,
      ),
      scaffoldBackgroundColor: defaultAppColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: defaultAppColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          )),
      canvasColor: defaultAppColor4,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: defaultAppColor3,
        selectedItemColor: defaultAppWhiteColor,
        unselectedItemColor: defaultAppWhiteColor.withOpacity(0.5),
        elevation: 0,
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: defaultAppColor4),
      sliderTheme: const SliderThemeData(
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(defaultAppColor4),
      ),
      dialogBackgroundColor: defaultAppColor,
      toggleButtonsTheme: ToggleButtonsThemeData(
          selectedColor: defaultAppColor4,
          selectedBorderColor: Colors.transparent,
          borderColor: Colors.transparent,
          fillColor: Colors.transparent));

  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: defaultAppColor2,
      secondary: defaultAppColor,
    ),
    iconTheme: const IconThemeData(color: defaultAppWhiteColor),
    buttonTheme: const ButtonThemeData(
      buttonColor: defaultAppColor3,
    ),
    scaffoldBackgroundColor: defaultAppColor3,
    appBarTheme: const AppBarTheme(
        backgroundColor: defaultAppColor3,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        )),
    canvasColor: defaultAppColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      backgroundColor: defaultAppColor,
      selectedItemColor: defaultAppColor3,
      elevation: 0,
      unselectedItemColor: defaultAppColor3.withOpacity(0.5),
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: defaultAppColor),
    sliderTheme: const SliderThemeData(
      inactiveTickMarkColor: Colors.transparent,
      activeTickMarkColor: Colors.transparent,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(defaultAppColor2),
    ),
    dialogBackgroundColor: defaultAppColor2,
    toggleButtonsTheme: const ToggleButtonsThemeData(
        selectedBorderColor: Colors.transparent,
        borderColor: Colors.transparent,
        fillColor: Colors.transparent),
  );
}
