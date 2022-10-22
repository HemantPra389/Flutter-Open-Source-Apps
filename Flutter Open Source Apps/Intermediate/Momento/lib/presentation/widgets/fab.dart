import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:momento/utils/themes.dart';

class Fab extends StatelessWidget {
  final VoidCallback onPressed;
  Fab({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Add Note',
      child: Icon(
        Icons.add,
        color: Theme.of(context).fabTextColor,
      ),
      backgroundColor: Theme.of(context).fabBackgroundColor,
      elevation: 8.0,
    );
  }
}
