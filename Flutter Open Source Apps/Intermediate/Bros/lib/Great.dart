import 'package:flutter/material.dart';

class Great extends StatelessWidget {
  Great(this.color, this.text, this.id);
  final Color color;
  final String text;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              colors: [Color(0xFFff017f), Color(0xFFce24b3), Color(0xFFbb18d5)],
            ),
          ),
          child: MaterialButton(
            onPressed: () {
              //Go to registration screen.
              Navigator.pushNamed(context, id);
            },
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
