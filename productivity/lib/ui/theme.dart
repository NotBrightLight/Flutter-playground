import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const Color purpleClr = Color(0xFFA0338A);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFF54B80);

const primaryClr = purpleClr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = Colors.grey[800]!;

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryClr,
      onPrimary: Colors.white,
      secondary: Colors.black12,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );

  static final dark = ThemeData(
    primaryColorDark: darkGreyClr,
    brightness: Brightness.dark,
    primaryColor: primaryClr,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryClr,
      onPrimary: Colors.white,
      secondary: Colors.black12,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      background: darkGreyClr,
      onBackground: Colors.white,
      surface: darkGreyClr,
      onSurface: Colors.white,
    ),
  );
}

// Define the text styles
TextStyle get headingTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get subHeadingTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
    ),
  );
}

TextStyle get titleTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get subTitleTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[700],
    ),
  );
}

TextStyle get bodyTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get body2TextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.grey[200] : Colors.grey[600],
    ),
  );
}
