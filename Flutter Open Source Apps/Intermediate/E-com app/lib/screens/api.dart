import 'package:flutter/material.dart';

class Commonwidgets extends StatelessWidget {
   String? imglink;
  final String discription;
  final String brand;
  String? price;

  Commonwidgets(
      {required this.brand,
      this.price,
      required this.discription,
       this.imglink});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      //color: Colors.red[200],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 10.0,
            ),
            height: 130.0,
            width: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imglink.toString()),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              brand,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              discription,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     price.toString(),
          //     style: const TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
        ],
      ),
    );
  }
}
