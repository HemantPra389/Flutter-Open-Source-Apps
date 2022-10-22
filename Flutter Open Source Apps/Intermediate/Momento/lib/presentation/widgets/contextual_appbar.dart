import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momento/business_logic/providers/providers.dart';
import 'package:momento/data/models/note.dart';

class ContextualAppBar extends StatefulWidget {
  @override
  _ContextualAppBarState createState() => _ContextualAppBarState();
}

class _ContextualAppBarState extends State<ContextualAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 3,
      forceElevated: true,
      pinned: true,
      automaticallyImplyLeading: false,
      // backgroundColor: kAppBarColor,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      leadingWidth: 100,
      leading: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.clear,
            ),
            onPressed: () {
              context.read(SelectedNotesProvider).clear();
            },
          ),
          SizedBox(
            width: 5.0,
          ),
          Consumer(builder: (context, watch, child) {
            final selectednotes = watch(SelectedNotesProvider);
            final count = selectednotes.notes_list.length;
            return Text(
              '$count',
              style: TextStyle(
                fontSize: 23.0,
              ),
            );
          }),
        ],
      ),
      // toolbarHeight: 71.0,
      actions: [
        Consumer(
          builder: (context, watch, child) {
            List<Note> selectednotes = watch(SelectedNotesProvider).notes_list;
            var pinnedcount = 0, unpinnedcount = 0;
            selectednotes.forEach((element) {
              if (element.isPinned == 1) {
                pinnedcount++;
              } else {
                unpinnedcount++;
              }
            });
            if (pinnedcount > 0 && unpinnedcount > 0) {
              // show a way to pin notes
              return IconButton(
                icon: Icon(Icons.push_pin_outlined),
                onPressed: () {
                  context.read(NotesRepositoryProvider).setPin(selectednotes);
                  context.read(SelectedNotesProvider).clear();
                },
              );
            } else if (pinnedcount > 0 && unpinnedcount == 0) {
              // show a way to unpin notes
              return IconButton(
                icon: Icon(Icons.push_pin),
                onPressed: () {
                  context.read(NotesRepositoryProvider).unsetPin(selectednotes);
                  context.read(SelectedNotesProvider).clear();
                },
              );
            } else if (pinnedcount == 0 && unpinnedcount > 0) {
              // show a way to pin notes
              return IconButton(
                icon: Icon(Icons.push_pin_outlined),
                onPressed: () {
                  context.read(NotesRepositoryProvider).setPin(selectednotes);
                  context.read(SelectedNotesProvider).clear();
                },
              );
            } else {
              return Container();
            }
          },
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            context.read(NotesRepositoryProvider).deleteMultipleNotes(context
                .read(SelectedNotesProvider)
                .notes_list
                .map((e) => e.id)
                .toList());
            context.read(SelectedNotesProvider).clear();
          },
        ),
      ],
    );
  }
}
