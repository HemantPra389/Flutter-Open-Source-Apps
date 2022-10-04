import 'package:flutter/material.dart';


class AppFonts {
  static double pageviewHeader = 0.0;
  static double registerHeader = 0.0;
  static double bigSubtitle = 0.0;
  static double buttomtext = 0.0;
  static double headertitle = 0.0;
  static double hinttextsize = 0.0;
  static double iconsize = 0.0;
  static double historysubtitlesize = 0.0;
  static double historycouplesize = 0.0;
  static double subtitle1 = 0.0;

  AppFonts(context) {
    var device = MediaQuery.of(context).size.width;
    pageviewHeader = device > 600.0 ? 50 :38.0;
    registerHeader = device > 600.0 ? 45 : 30.0;
    bigSubtitle = device > 600 ? 24 :  18.0;
    buttomtext = device > 600.0 ?24: 20.0;
    headertitle = device > 600.0 ? 24 :20.0;
    hinttextsize = device > 600.0 ? 20: 16.0;
    iconsize = device > 600.0 ? 45 : 30.0;
    historysubtitlesize = device > 600 ? 18 :  12.0;
    historycouplesize = device > 600.0 ?18: 14.0;
    subtitle1 = device > 600.0 ? 18: 12.0;

  }
}



