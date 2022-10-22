import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:momento/data/models/note.dart';
import 'package:momento/business_logic/providers/providers.dart';
import 'package:momento/presentation/widgets/note_card.dart';

class NotesGrid extends StatelessWidget {
  final String page;
  final String type;
  NotesGrid({this.page,this.type});
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
            print(asyncnotelist);
            print(data?.length);
            return SliverPadding(
              // This [Padding] affects the area between the edge of the screen and the [StaggeredGridView]
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              sliver: SliverStaggeredGrid.countBuilder(
                // The [crossAxisSpacing] and [mainAxisSpacing] affects the area the between Grid Items
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
                itemCount: data?.length ?? 0,
                staggeredTileBuilder: (index) {
                  return const StaggeredTile.fit(1);
                },
                crossAxisCount: 2,
                itemBuilder: (context, index) {
                  return NoteCard(
                    id: data[index].id,
                    page: page,
                  );
                },
              ),
            );
          },
          loading: () {
            return SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()));
          },
          error: (error, stack) =>
              SliverFillRemaining(child:  Text('$error')),
        );
      },
    );
    // AsyncValue<List<Note>> notelist = watch(AllNotesProvider);
  }
}
