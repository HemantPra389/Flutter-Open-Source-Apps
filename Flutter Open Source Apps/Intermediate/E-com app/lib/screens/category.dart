import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vishal_mega_mart_app/screens/productDetails.dart';
import 'package:vishal_mega_mart_app/screens/subcat.dart';
import 'package:vishal_mega_mart_app/screens/themes/apptheme.dart';

class CategoriesItem extends StatelessWidget {
  final String? image;
  final String? categoryName;

  CategoriesItem({
    Key? key,
    this.image,
    this.categoryName = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubcatScreen(),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .11,
        width: MediaQuery.of(context).size.height * .14,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .1,
              width: MediaQuery.of(context).size.height * .1,
              decoration: const BoxDecoration(
                  color: AppTheme.whitColor, shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: image != null && image!.isNotEmpty
                    ? Image.network(
                        image.toString(),
                        fit: BoxFit.contain,
                      )
                    : Image.asset(image.toString()),
              ),
            ),
            Text(
              categoryName.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppTheme.blackText,
                fontSize: 10,
                fontWeight: FontWeight.normal,
                wordSpacing: 0.3,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
