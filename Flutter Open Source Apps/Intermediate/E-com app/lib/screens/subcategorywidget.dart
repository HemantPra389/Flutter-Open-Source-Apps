import 'package:flutter/material.dart';
import 'package:vishal_mega_mart_app/screens/lastpagescreen.dart';
import 'package:vishal_mega_mart_app/screens/lastscrenn.dart';
import 'package:vishal_mega_mart_app/screens/productDetails.dart';

class SubCat extends StatelessWidget {
  final String text;
  final String image;

  SubCat({required this.image, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.all(10),
      child: Center(
          child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: image != null && image.isNotEmpty
                ? Image.network(
                    image,
                    fit: BoxFit.contain,
                  )
                : Image.asset("assets/p.jpeg"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LatScreen(),
                ),
              );
            },
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(80.0)),
            // padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 235, 120, 178),
                      Color.fromARGB(255, 166, 110, 152)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
