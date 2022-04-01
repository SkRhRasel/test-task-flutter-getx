import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/local/constants.dart';
import 'dimens.dart';

class MyTheme with ChangeNotifier {
  bool isDark = false;

  ThemeMode currentTheme() {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  void setThemeMode(bool isDarkMode) {
    isDark = isDarkMode;
    notifyListeners();
  }
}

ThemeData lightTheme = ThemeData(
    backgroundColor: kBackgroundColor,
    primaryColor: kPrimaryColor,
    primaryColorDark: kPrimaryDarkColor,
    primaryColorLight: kMainTextGrayColor,
    shadowColor: kGrayLightColor,
    secondaryHeaderColor: kMainTextGrayColor,
    errorColor: kLinkTextColor,
    splashColor: kBlueColor,
    dividerColor: kBorderColor,
    focusColor: kBlueColor,
    toggleableActiveColor: kAccentColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor, brightness: Brightness.light),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: kPrimaryColor, selectedItemColor: kAccentColor, unselectedItemColor: kMainTextGrayColor),
    textTheme: TextTheme(

      headlineLarge: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: kAlterTextColor, fontSize: Dimens.regularFontSizeLarge),
      headlineMedium: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: Dimens.titleFontSizeMid), // for splash logo sub title
      headlineSmall: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: kMainTextGrayColor, fontSize: Dimens.regularFontSizeSmall),

      labelLarge: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: Dimens.buttonFontSize), // for button
      labelMedium: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: Dimens.regularFontSizeMid),
      labelSmall: GoogleFonts.poppins(fontWeight: FontWeight.normal, color: kMainTextGrayColor, fontSize: Dimens.regularFontSizeSmall), // for subtitle 12

      titleLarge: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: kAlterTextColor, fontSize: Dimens.titleFontSizeLarge), // onBoarding large title
      titleMedium: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: kMainTextGrayColor, fontSize: Dimens.titleFontSizeMid),
      titleSmall: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: kMainTextGrayColor, fontSize: Dimens.titleFontSizeSmall),

      bodyLarge: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: kMainTextGrayColor, fontSize: Dimens.regularFontSizeLarge),//for App Bar, body large text
      bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.normal, color: kMainTextGrayColor, fontSize: Dimens.regularFontSizeMid), // onBoarding subtitle  title
      bodySmall: GoogleFonts.karla(fontWeight: FontWeight.normal, color: kMainTextGrayColor, fontSize: Dimens.regularFontSizeSmall),


    ),
    buttonTheme: const ButtonThemeData(buttonColor: kPrimaryColor, disabledColor: kMainTextGrayColor),
    textSelectionTheme: const TextSelectionThemeData(selectionColor: kLinkTextColor));

ThemeData darkTheme = ThemeData(
    primaryColor: kMainTextGrayColor,
    primaryColorDark: blackColor,
    primaryColorLight: kMainTextGrayColor,
    secondaryHeaderColor: kGrayLightColor,
    splashColor: kBlueColor,
    dividerColor: kBorderColor,
    focusColor: kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor, brightness: Brightness.dark),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: kPrimaryColor, selectedItemColor: kAccentColor, unselectedItemColor: Colors.white),
    textTheme: TextTheme(
        headline1: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        headline2: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        headline3: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        headline4: GoogleFonts.poppins(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16, decoration: TextDecoration.underline),
        headline5: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        headline6: GoogleFonts.poppins(fontWeight: FontWeight.normal, color: kGrayLightColor, fontSize: 16)),
    buttonTheme: const ButtonThemeData(buttonColor: kAccentColor, disabledColor: kMainTextGrayColor),
    textSelectionTheme: const TextSelectionThemeData(selectionColor: kLinkTextColor));
