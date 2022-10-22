import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momento/business_logic/providers/providers.dart';
import 'package:momento/data/models/note.dart';
import 'package:momento/presentation/widgets/last_edited_label.dart';
import 'package:momento/presentation/widgets/note_pin.dart';
import 'package:share_plus/share_plus.dart';

class EditNotePage extends StatefulWidget {
  final String page;
  final int id;
  EditNotePage({this.page, this.id});
  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  TextEditingController t1;
  TextEditingController t2;
  Note currentNote;
  int isPinned;
  bool isEdited;
  @override
  void initState() {
    super.initState();

    currentNote = context.read(NoteProvider(widget.id));
    isPinned = currentNote.isPinned;

    t1 = TextEditingController(text: currentNote.title);
    t2 = TextEditingController(text: currentNote.content);
    isEdited = false;
    t1.addListener(() {
      if (t1.text.toLowerCase() != currentNote.title.toLowerCase()) {
        isEdited = true;
        a.value = true;
      }
    });
    t2.addListener(() {
      if (t2.text.toLowerCase() != currentNote.content.toLowerCase()) {
        isEdited = true;
        a.value = true;
      }
    });
  }

  @override
  void dispose() {
    t1.dispose();
    t2.dispose();
    a.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.id.toString() + widget.page.toString(),
      transitionOnUserGestures: true,
      // flightShuttleBuilder: (
      //   BuildContext flightContext,
      //   Animation<double> animation,
      //   HeroFlightDirection flightDirection,
      //   BuildContext fromHeroContext,
      //   BuildContext toHeroContext,
      // ) {
      //   // this fixes issue which causes yellow underline to apear when trasitioning back
      //   return DefaultTextStyle(
      //     style: DefaultTextStyle.of(fromHeroContext).style,
      //     child: toHeroContext.widget,
      //   );
      // },
      child: Scaffold(
        // backgroundColor: kBackgroundColor,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          // backgroundColor: kBackgroundColor,
          backgroundColor: Theme.of(context).backgroundColor,
          leading: IconButton(
              splashRadius: 25.0,
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                bool isDiscarded = false;
                if (isEdited) {
                  isDiscarded = await _updateOrDiscard(
                      context, t1.text, t2.text, currentNote, isPinned);
                }
                Navigator.pop(context, isDiscarded);
              }),
          actions: [
            // Consumer(
            //   builder: (context, watch, child) {
            //     Note note = watch(NoteProvider(currentNote.id));
            //     if (note == null) return Container();
            //     if (note.isPinned == 1) {
            //       return IconButton(
            //         icon: Icon(Icons.push_pin),
            //         onPressed: () {
            //           context.read(NoteListViewModelProvider).unsetPin([note]);
            //         },
            //       );
            //     } else {
            //       return IconButton(
            //         icon: Icon(Icons.push_pin_outlined),
            //         onPressed: () {
            //           context.read(NoteListViewModelProvider).setPin([note]);
            //         },
            //       );
            //     }
            //   },
            // ),
            NotePin(
              isPinned: isPinned,
              onChanged: (val) {
                isPinned = val;
                isEdited = true;
                a.value = true;
              },
            ),
            IconButton(
                splashRadius: 25.0,
                icon: Icon(Icons.share),
                onPressed: () {
                  Share.share(t1.text + '\n' + t2.text, subject: t1.text);
                })
          ],
        ),
        body: WillPopScope(
          onWillPop: () async {
            bool isDiscarded = false;
            if (isEdited) {
              isDiscarded = await _updateOrDiscard(
                  context, t1.text, t2.text, currentNote, isPinned);
            }
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
                  Column(
                    children: [
                      TextField(
                        style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                        controller: t1,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            focusedBorder: InputBorder.none,
                            hintText: 'Title',
                            border: InputBorder.none),
                      ),
                      TextField(
                        style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color),
                        maxLines: null,
                        controller: t2,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            hintText: 'Type Something',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            border: InputBorder.none),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          height: 50.0,
          padding: EdgeInsets.only(
            top: 5.0,
          ),
          // color: kBackgroundColor,
          color: Theme.of(context).backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LastEditedLabel(
                last_updated: currentNote.last_updated,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> _updateOrDiscard(
  BuildContext context,
  String title,
  String content,
  Note currentNote,
  int isPinned,
) async {
  bool isDiscarded = false;
  // if only title or content is note empty then update the note
  if (title.trim() != "" || content.trim() != "") {
    Note newNote = Note.fromMap(
      {
        'title': '$title',
        'content': '$content',
        'isPinned': isPinned,
        'last_updated': '${DateTime.now()}'
      },
    );
    newNote.id = currentNote.id;
    // if isPinned is changed update the note and also update HomePage
    bool _shouldUpdateHomePage = false;
    if (currentNote.isPinned != isPinned) {
      _shouldUpdateHomePage = true;
    }
    // update note
    await context.read(NoteProvider(currentNote.id)).update(newNote);

    // setPin() and unsetPin methods will update the homepage if it should be updated
    if (_shouldUpdateHomePage && isPinned == 1) {
      context.read(NotesRepositoryProvider).setPin([newNote]);
    } else if (_shouldUpdateHomePage && isPinned == 0) {
      context.read(NotesRepositoryProvider).unsetPin([newNote]);
    }
  }
  // if both title and content are note empty then discard the note
  else if (title.trim() == "" && content.trim() == "") {
    await context
        .read(NotesRepositoryProvider)
        .deleteMultipleNotes([currentNote.id]);
    isDiscarded = true;
  }

  return isDiscarded;
}
