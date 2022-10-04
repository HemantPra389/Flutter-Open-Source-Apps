import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vishal_mega_mart_app/screens/bloc/subcatbloc.dart';
import 'package:vishal_mega_mart_app/screens/model/subcatmodel.dart';
import 'package:vishal_mega_mart_app/screens/subcategorywidget.dart';
import 'package:vishal_mega_mart_app/screens/themes/app_fonts.dart';
import 'package:vishal_mega_mart_app/screens/themes/apptheme.dart';

class SubcatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchallSubcategory();
    return Scaffold(
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
      // backgroundColor: Color.fromARGB(255, 204, 246, 255),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 40),
          child: StreamBuilder(
            stream: bloc.allsubcategory,
            builder: (context, AsyncSnapshot<SubCatModel> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) => SubCat(
                        image: snapshot.data!.categories![index].thumbnail
                            .toString(),
                        text: snapshot
                            .data!.categories![index].name!.nameDefault
                            .toString()));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
