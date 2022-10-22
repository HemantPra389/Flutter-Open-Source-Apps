import 'package:flutter/material.dart';

class NotePin extends StatefulWidget {
  Function(int) onChanged;
  int isPinned;
  NotePin({this.onChanged, this.isPinned});
  @override
  _NotePinState createState() => _NotePinState();
}

class _NotePinState extends State<NotePin> {
  @override
  Widget build(BuildContext context) {
    if (widget.isPinned == 1) {
      return IconButton(
        splashRadius: 25.0,
        icon: Icon(Icons.push_pin),
        onPressed: () {
          setState(() {
            widget.isPinned = 0;
          });
          widget.onChanged(widget.isPinned);
        },
      );
    } else {
      return IconButton(
        splashRadius: 25.0,
        icon: Icon(Icons.push_pin_outlined),
        onPressed: () {
          setState(() {
            widget.isPinned = 1;
          });
          widget.onChanged(widget.isPinned);
        },
      );
    }
  }
}
