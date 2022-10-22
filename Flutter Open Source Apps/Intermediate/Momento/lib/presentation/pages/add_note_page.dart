import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momento/business_logic/providers/providers.dart';
import 'package:momento/data/models/note.dart';
import 'package:momento/presentation/widgets/note_pin.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController t1;
  TextEditingController t2;
  int isPinned;

  @override
  void initState() {
    super.initState();
    isPinned = 0;
    t1 = TextEditingController();
    t2 = TextEditingController();
  }

  @override
  void dispose() {
    t1.dispose();
    t2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Add note'),
        centerTitle: true,
        // backgroundColor: kBackgroundColor,
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          NotePin(
            isPinned: isPinned,
            onChanged: (val) {
              isPinned = val;
            },
          ),
        ],
        leading: IconButton(
          splashRadius: 25.0,
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            bool isDiscarded = false;
            isDiscarded =
                await _addOrDiscard(context, t1.text, t2.text, isPinned);
            Navigator.pop(context, isDiscarded);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          bool isDiscarded = false;
          isDiscarded =
              await _addOrDiscard(context, t1.text, t2.text, isPinned);
          Navigator.pop(context, isDiscarded);
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 26.0,
                ),
                TextField(
                  autofocus: true,
                  style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).textTheme.bodyText1.color),
                  controller: t1,
                  maxLines: null,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      hintText: 'Title',
                      // hintStyle: TextStyle(color: Colors.grey.shade400),
                      hintStyle: TextStyle(
                          color: Theme.of(context).textTheme.headline3.color),
                      border: InputBorder.none),
                ),
                TextField(
                  maxLines: null,
                  controller: t2,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color),
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      hintText: 'Type Something',
                      // hintStyle: TextStyle(color: Colors.grey.shade400),
                      hintStyle: TextStyle(
                          color: Theme.of(context).textTheme.headline3.color),
                      border: InputBorder.none),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> _addOrDiscard(
  BuildContext context,
  String title,
  String content,
  int isPinned,
) async {
  bool isDiscarded = false;
  // if only title or content is note empty then update the note
  if (title.trim() != "" || content.trim() != "") {
    await context.read(NotesRepositoryProvider).addNote(Note.fromMap({
          'title': '$title',
          'content': '$content',
          'isPinned': isPinned,
          'date_created': '${DateTime.now()}',
          'last_updated': '${DateTime.now()}'
        }));
  }
  // if both title and content are note empty then discard the note
  else if (title.trim() == "" && content.trim() == "") {
    isDiscarded = true;
  }

  return isDiscarded;
}
