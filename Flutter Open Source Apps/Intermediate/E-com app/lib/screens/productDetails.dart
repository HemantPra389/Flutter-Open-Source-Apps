import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vishal_mega_mart_app/screens/bloc/productbloc.dart';
import 'package:vishal_mega_mart_app/screens/productdetailsapipage.dart';
import 'package:vishal_mega_mart_app/screens/themes/app_fonts.dart';
import 'package:vishal_mega_mart_app/screens/themes/apptheme.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    bloc.fetchallproduct();
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
        child: SizedBox(
          height: 1700,
          child:SearchProduct()
        ),
      ),
    );
  }
}
