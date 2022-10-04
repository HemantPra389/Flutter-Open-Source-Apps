import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vishal_mega_mart_app/screens/home.dart';
import 'package:vishal_mega_mart_app/screens/themes/app_fonts.dart';
import 'package:vishal_mega_mart_app/screens/themes/apptheme.dart';
class SplashScreen extends StatefulWidget {
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   reDricet();
    super.initState();
  }

  reDricet(){
    Timer(Duration(seconds: 2), (() {
     

     Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Home()));
    }));

  }
  @override
  Widget build(BuildContext context) {
    AppFonts(context);
       return Scaffold(
      backgroundColor: AppTheme.whitColor,
      body: Center(
        child: Container(
          height: 100.0,
          decoration: BoxDecoration(
            color: AppTheme.whitColor,
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.cover,
                    height: 50,
                    width: 200,
                  ),

                  Text(
                    "Welcome To Vishal Megamart",

                    style:GoogleFonts.poppins(
                      color:AppTheme.blackText,

                      fontSize: AppFonts.subtitle1,
                      fontWeight: FontWeight.w500
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  
  }
}