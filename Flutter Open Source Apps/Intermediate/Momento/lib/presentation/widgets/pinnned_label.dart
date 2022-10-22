import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momento/data/models/note.dart';
import 'package:momento/business_logic/providers/providers.dart';

class PinnedLable extends StatelessWidget {
  const PinnedLable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        AsyncValue<List<Note>> asyncnotelist = watch(AllNotesProvider);
        return asyncnotelist.when(
          data: (allnotes) {
            var pinnedcount = 0,unpinnedcount = 0;
            allnotes.forEach((element) {
              if(element.isPinned == 1) {
                pinnedcount++;
              }
              else{
                unpinnedcount++;
              }
            });
            if (pinnedcount > 0) {
              return SliverPadding(
                padding: EdgeInsets.only(top: 12.0, left: 20.0, bottom: 12.0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'PINNED',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.overline.color,
                    ),
                  ),
                ),
              );
            } else {
              return SliverToBoxAdapter(
              );
            }
          },
          error: (Object error, StackTrace stackTrace) {
            return SliverToBoxAdapter();
          },
          loading: () {
            return SliverToBoxAdapter();
          },
        );
      },
    );
  }
}