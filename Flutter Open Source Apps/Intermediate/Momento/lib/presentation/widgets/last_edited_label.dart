import 'package:flutter/material.dart';
import 'package:momento/business_logic/providers/providers.dart';
import 'package:momento/utils/helper_functions.dart';


class LastEditedLabel extends StatefulWidget {
  final String last_updated;
  LastEditedLabel({this.last_updated});
  @override
  _LastEditedLabelState createState() => _LastEditedLabelState();
}

class _LastEditedLabelState extends State<LastEditedLabel> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: a,
      builder: (context, isEdited, child) {
        print(isEdited);
        if (!isEdited) {
          return Text(
            getLastEdited(widget.last_updated),
            style: TextStyle(
              fontSize: 15.0,
            ),
          );
        }
        return Container();
      },
    );
  }
}
