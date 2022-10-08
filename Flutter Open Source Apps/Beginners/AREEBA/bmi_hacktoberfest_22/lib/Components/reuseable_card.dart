import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  //PROPERTY Color(0xFFFD8756)
  final colour;
  final childCard;
  final VoidCallback onPress;

//CONSTRUCTOR
  const ReuseableCard(
      {Key? key, required this.colour, this.childCard, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
