import 'dart:convert';
import 'dart:developer';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:vishal_mega_mart_app/screens/apis/tokenapi.dart';
import 'package:vishal_mega_mart_app/screens/bloc/categorybloc.dart';
import 'package:vishal_mega_mart_app/screens/categoryss.dart';
import 'package:vishal_mega_mart_app/screens/constant.dart';
import 'package:vishal_mega_mart_app/screens/extra.dart';
import 'package:vishal_mega_mart_app/screens/lastapi.dart';
import 'package:vishal_mega_mart_app/screens/model/token.dart';
import 'package:vishal_mega_mart_app/screens/page.dart';
import 'package:vishal_mega_mart_app/screens/productdetailsapipage.dart';
import 'package:vishal_mega_mart_app/screens/searchwidget.dart';
import 'package:vishal_mega_mart_app/screens/themes/app_fonts.dart';
import 'package:vishal_mega_mart_app/screens/themes/apptheme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    print("++++++++++${myController.text}+++++++++++++");
    myController.dispose();
    super.dispose();
  }

  // Future<TokenModel> Token() async {
  //   // ignore: avoid_print
  //   print(
  //     "======= API CALLING  =========",
  //   );
  //   // const token = tokens.TOKEN;
  //   var headers = {
  //     'Authorization':
  //         'Basic OTgwNGY4YjQtZTQzMS00OTUwLWE3NDMtYmRhMjJmMDllYmI4OlZNTU1vYmlsZUFwcDIwMjAj',
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'Cookie':
  //         'route=1660200976.763.118.455900|b4b9366450a28a63ee5f72b7d8464f5c'
  //   };

  //   var request = http.Request('POST',
  //       Uri.parse('https://account.demandware.com/dwsso/oauth2/access_token'));
  //   request.bodyFields = {'grant_type': 'client_credentials'};
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();
  //   final res = await response.stream.bytesToString();
  //   Map valueMap = json.decode(res);
  //   // print("=== VALUE MAP ==========");
  //   // print("=== VALUE MAP ===== ${valueMap}=====");

  //   dynamic Token = valueMap.remove('access_token');
  //   print('Value popped from the Map ${Token}');
  //   // tokens.TOKEN =Token;
  //   TokenValue.mytoken = Token;
  //   print("+++++7777777+++++${TokenValue.mytoken}+++++++++++++");

  //   if (response.statusCode == 200) {
  //     print("=======Product====== ${res}");
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //     // print("======= Failed to load posts =========");
  //   }

  //   return TokenModel.fromJson(jsonDecode(res));
  // }

  void text() {
    Searchtext.searchelemnt = myController.text;
    print("++++++++++${myController.text}+++++++++++++");
    print("++++++++++${Searchtext.searchelemnt}+++++++++++++");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text();

    // Token();
  }

  var category = [
    {"name": "Women", "url": "assets/images.jpeg"},
    {"name": "Men's Fashion", "url": "assets/men.webp"},
    {"name": "Kids & Infants", "url": "assets/kid.webp"},
    {"name": "Home & Kitchen", "url": "assets/home.jpeg"},
    {"name": "Application", "url": "assets/electronic.jpeg"},
  ];

  @override
  Widget build(BuildContext context) {
    bloc.fetchallcategory();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
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
                                      color: AppTheme.whitColor, fontSize: 17),
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
              Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.whitColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,

                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .5,
                    ),

                    cursorColor: AppTheme.buttonThemeColor,
                    // cursorHeight: scaler.scalerV(20),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                        counterStyle: const TextStyle(
                          color: AppTheme.hintText,
                        ),
                        hintText: "Search for Product",
                        enabledBorder: outlineBorder,
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          letterSpacing: .5,
                          fontSize: AppFonts.subtitle1,
                          color: AppTheme.hintText,
                        ),
                        focusedBorder: outlineBorder,
                        focusedErrorBorder: outlineBorder,
                        errorBorder: outlineBorder,
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppTheme.hintText,
                        ),
                        // contentPadding: EdgeInsets.only(
                        //     left: 10, right: 5, bottom: 12,top: 12),
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Shop by category",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              //Expanded(child: MovieList()),
              Container(
                  height: MediaQuery.of(context).size.height * .14,
                  width: double.infinity,
                  child: MovieList()),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Products",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              // CarouselSlider(
              //   options: CarouselOptions(
              //     height: 200.0,
              //     viewportFraction: 1,
              //     autoPlay: true,
              //   ),
              //   items: [1, 2, 3, 4, 5].map((i) {
              //     return Builder(
              //       builder: (BuildContext context) {
              //         return Container(
              //           width: MediaQuery.of(context).size.width,
              //           margin: EdgeInsets.symmetric(horizontal: 1.0),
              //           // decoration: BoxDecoration(color: Colors.red[100]),
              //           child: ClipRRect(
              //             child: Image.asset("assets/img.png"),
              //           ),
              //         );
              //       },
              //     );
              //   }).toList(),
              // ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                ),
                child: SizedBox(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  child: Carousel(
                    images: [
                      Image.asset(
                        "assets/ss1.webp",
                        fit: BoxFit.fitWidth,
                      ),
                      Image.asset(
                        "assets/ss2.webp",
                        fit: BoxFit.fitWidth,
                      ),
                      Image.asset(
                        "assets/ss3.jpeg",
                        fit: BoxFit.fitWidth,
                      ),
                      Image.asset(
                        "assets/ss4.jpeg",
                        fit: BoxFit.fitWidth,
                      ),
                      Image.asset(
                        "assets/ss5.jpeg",
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.lightGreenAccent,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.transparent,
                    borderRadius: true,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Best Deals",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 300),
                itemCount: category.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // color: AppTheme.appThemeColor,
                    child: Image.asset(
                      "${category[index]["url"]}",
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Searchtext {
  static var searchelemnt;
}

// class TokenValue {
//   static var mytoken;
// }
