import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momento/utils/app_colors.dart';

Flushbar emptyNoteDiscardedFlushbar = Flushbar(
  messageText: Text('Empty note discarded'),
  flushbarStyle: FlushbarStyle.FLOATING,
  dismissDirection: FlushbarDismissDirection.HORIZONTAL,
  margin: EdgeInsets.only(bottom: 40.0, left: 15.0, right: 15.0),
  backgroundColor: kSnackBarColorDark,
  borderRadius: BorderRadius.circular(5.0),
  leftBarIndicatorColor: Colors.redAccent,
  duration: Duration(seconds: 2),
  // animationDuration: Duration(seconds: 10),
  forwardAnimationCurve: Curves.easeInOut,
  reverseAnimationCurve: Curves.easeInOut,
);

String getLastEdited(String lastEdited) {
  DateTime ledited = DateTime.parse(lastEdited);
  String result = "";
  DateTime now = DateTime.now();
  if (ledited.year < now.year) {
    result = "Edited ${DateFormat().add_d().add_MMM().add_y().format(ledited)}";
  } else if (ledited.month < now.month) {
    result = "Edited ${DateFormat().add_d().add_MMM().format(ledited)}";
  } else if ((now.day - ledited.day) == 1) {
    result = "Edited Yesterday, ${DateFormat().add_jm().format(ledited)}";
  } else if (ledited.day < now.day) {
    result = "Edited ${DateFormat().add_d().add_MMM().format(ledited)}";
  } else if (ledited.hour < now.hour || ledited.second < now.second) {
    result = "Edited ${DateFormat().add_jm().format(ledited)}";
  }
  else{
    result = "Edited ${DateFormat().add_jm().format(ledited)}";
  }
  return result;
}
