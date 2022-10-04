import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vishal_mega_mart_app/screens/lastapi.dart';
import 'package:vishal_mega_mart_app/screens/lastpagescreen.dart';
import 'package:vishal_mega_mart_app/screens/themes/app_fonts.dart';
import 'package:vishal_mega_mart_app/screens/themes/apptheme.dart';

class LatScreen extends StatefulWidget {
  const LatScreen({Key? key}) : super(key: key);

  @override
  State<LatScreen> createState() => _LatScreenState();
}

class _LatScreenState extends State<LatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(80.0), // here the desired height
        child: AppBar(
          backgroundColor: AppTheme.appThemeColor,
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          elevation: 0,
          titleSpacing: 0,
          title: Container(
            width: MediaQuery.of(context).size.width,
            height: 55,
            child: Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/location.png",
                      height: 25,
                      color: AppTheme.whitColor,
                    ),
                    Expanded(
                        child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 14, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Noida Sector 1",
                                  style: GoogleFonts.poppins(
                                      color: AppTheme.whitColor,
                                      fontSize: AppFonts.subtitle1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                    Image.asset(
                      "assets/like.png",
                      height: 25,
                      color: AppTheme.whitColor,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Image.asset(
                      "assets/shopping-cart.png",
                      height: 25,
                      color: AppTheme.whitColor,
                    ),
                  ]),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * .14,
                  width: double.infinity,
                  child: list()),
              Container(height: 3000, child: LastPage()),
              // LastPage(),
            ],
          ),
        ),
      ),
    );
  }
}
