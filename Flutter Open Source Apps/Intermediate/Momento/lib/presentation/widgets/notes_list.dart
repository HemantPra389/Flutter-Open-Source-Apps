import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momento/data/models/note.dart';
import 'package:momento/presentation/widgets/note_card.dart';
import 'package:momento/business_logic/providers/providers.dart';

class NotesList extends StatelessWidget {
  final String page;
  final String type;
  NotesList({this.page,this.type});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
       AsyncValue<List<Note>> asyncnotelist;
        if(page == 'home' && type=="pinned"){
          asyncnotelist = watch(PinnedNotesProvider);
        }
        else if(page == 'home' && type=="unpinned"){
          asyncnotelist = watch(UnPinnedNotesProvider);
        }
        else if(page == 'search'){
         asyncnotelist = watch(AllSearchResultProvider);
        }
        return asyncnotelist.when(
          data: (data) {
            // This [Padding] affects the area between the edge of the screen and the [ListView]
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (contex, index) {
                    return NoteCard(
                      id: data[index].id,
                      page: page,
                    );
                  },
                  childCount: data?.length ?? 0,
                ),
              ),
            );
          },
          loading: () {
            return SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()));
          },
          error: (errr, stack) =>
              SliverFillRemaining(child: const Text('error')),
        );
      },
    );
  }
}
