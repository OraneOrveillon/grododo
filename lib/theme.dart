import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFEC887D),
      secondary: Color(0xFF021228),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.white),
      trackColor: MaterialStateProperty.all(Colors.white.withOpacity(0.5)),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
    ),
    splashColor: Colors.white.withOpacity(0.5),
    iconTheme: IconThemeData(
      color: Colors.white.withOpacity(0.8),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white.withOpacity(0.2),
      dialBackgroundColor: Colors.white.withOpacity(0.2),
      dialHandColor: const Color(0xFFEC887D),
      entryModeIconColor: Colors.white,
      dayPeriodColor: const Color(0xFFEC887D),
      dayPeriodBorderSide: const BorderSide(
        color: Colors.transparent,
      ),
      dayPeriodTextColor: Colors.white,
      hourMinuteColor: Colors.white.withOpacity(0.2),
      hourMinuteTextColor: Colors.black,
      helpTextStyle: const TextStyle(color: Colors.white),
      // inputDecorationTheme: InputDecorationTheme(
      //     // fillColor: Colors.red,
      //     ),
    ),
    textTheme: GoogleFonts.quicksandTextTheme().apply(bodyColor: Colors.black).copyWith(
        // bodyText1: const TextStyle(color: kBodyTextColorLight),
        // bodyText2: const TextStyle(color: kBodyTextColorLight),
        // headline4: const TextStyle(color: kTitleTextLightColor, fontSize: 32),
        // headline1: const TextStyle(color: kTitleTextLightColor, fontSize: 80),
        ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF021228),
      secondary: Color(0xFF021228),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    primaryColor: kPrimaryColor,
    // scaffoldBackgroundColor: const Color(0xFF0D0C0E),
    // backgroundColor: kBackgroundDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: kBodyTextColorDark),
    primaryIconTheme: const IconThemeData(color: kPrimaryIconDarkColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: const TextStyle(color: kBodyTextColorDark),
      bodyText2: const TextStyle(color: kBodyTextColorDark),
      headline4: const TextStyle(color: kTitleTextDarkColor, fontSize: 32),
      headline1: const TextStyle(color: kTitleTextDarkColor, fontSize: 80),
    ),
  );
}
