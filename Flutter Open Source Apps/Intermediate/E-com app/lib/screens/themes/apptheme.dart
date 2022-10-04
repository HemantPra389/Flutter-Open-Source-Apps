import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color appThemeColor = Color(0xff0068A9);
  static const Color buttonThemeColor = Color(0xff1FA0BD);
  static const Color hintText = Color(0xffAABCCC);
  static const Color whitColor = Color(0xffffffff);
  static const Color background = Color(0xffF7F7F7);
  static const Color blackText = Color(0xFF000000);
 
 
  static const Color scaffoldBackgroundColor = Color(0xffEEEEEE);
  static const Color gobutton = Color(0xffF9E56F);

  static const Color subscriptionColor = Colors.green;
  static const Color discountColor = Colors.red;

  static const Color toastColor = Color(0xff415841);

  // #F9E56F
  lightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        buttonTheme: const ButtonThemeData(
            buttonColor: Color(0xff1FA0BD),
            textTheme: ButtonTextTheme.primary,
            disabledColor: Color(0x1a25a3bf),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignedDropdown: true),
        appBarTheme: const AppBarTheme(
            elevation: 0.2,
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            )),
        primaryColor: const Color(0xff1FA0BD),
        primaryColorLight: const Color(0x1a84FFFF),
        scaffoldBackgroundColor: const Color(0xffFFFFFF),
        bottomAppBarColor: const Color(0xffFFFFFF),
        dividerColor: const Color(0x1f84FFFF),
        textTheme: TextTheme(
            headline1: GoogleFonts.abel(),
            headline2: GoogleFonts.aBeeZee(),
            bodyText1: GoogleFonts.aBeeZee(),
            bodyText2: GoogleFonts.poppins()),
        focusColor: const Color(0x1aF5E0C3),
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: const MaterialColor(
          0xff1FA0BD,
          <int, Color>{
            50: Color(0xff000000),
            100: Color(0xff000000),
            200: Color(0xff000000),
            300: Color(0xff000000),
            400: Color(0xff000000),
            500: Color(0xff000000),
            600: Color(0xff000000),
            700: Color(0xff000000),
            800: Color(0xff000000)
          },
        )).copyWith(secondary: const Color(0xff1FA0BD)));
  }
}
