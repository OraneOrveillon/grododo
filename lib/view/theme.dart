import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    colorScheme: const ColorScheme.light(
      primary: primaryLightColor,
      secondary: primaryDarkColor,
      tertiary: darkColor,
      surface: lightColor,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: darkColor.withOpacity(0.7)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: lightColor,
      unselectedItemColor: lightColor.withOpacity(0.5),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      shape: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.2), width: 1)),
      color: Colors.transparent, //lightColor.withOpacity(0.2),
      shadowColor: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.all(0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryLightColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(lightColor),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) return lightColor.withOpacity(0.5);
        return darkColor.withOpacity(0.2);
      }),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: darkColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
    ),
    splashColor: lightColor.withOpacity(0.5),
    iconTheme: const IconThemeData(
      color: lightColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: lightColor,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: darkColor.withOpacity(0.2),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(darkColor.withOpacity(0.7)),
      fillColor: MaterialStateProperty.all(lightColor),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightColor,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightColor,
          width: 2,
        ),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: darkColor.withOpacity(0.2),
      dialBackgroundColor: lightColor.withOpacity(0.2),
      dialHandColor: primaryLightColor,
      entryModeIconColor: lightColor,
      dayPeriodColor: primaryLightColor,
      dayPeriodBorderSide: const BorderSide(
        color: Colors.transparent,
      ),
      dialTextColor: lightColor,
      dayPeriodTextColor: lightColor,
      hourMinuteColor: lightColor.withOpacity(0.2),
      hourMinuteTextColor: lightColor,
      helpTextStyle: const TextStyle(color: lightColor),
    ),
    textTheme: GoogleFonts.quicksandTextTheme().apply(bodyColor: darkColor).copyWith(
          bodyText1: GoogleFonts.quicksand(color: lightColor),
        ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return themeData(context).copyWith(
    colorScheme: themeData(context).colorScheme.copyWith(
          primary: primaryDarkColor,
        ),
  );
}
