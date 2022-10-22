import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momento/business_logic/providers/providers.dart';
import 'package:momento/presentation/pages/add_note_page.dart';
import 'package:momento/presentation/widgets/custom_drawer.dart';
import 'package:momento/utils/helper_functions.dart';
import 'package:momento/data/repositories/notes_repository.dart';
import 'package:momento/presentation/widgets/contextual_appbar.dart';
import 'package:momento/presentation/widgets/fab.dart';
import 'package:momento/presentation/widgets/notes_grid.dart';
import 'package:momento/presentation/widgets/notes_list.dart';
import 'package:momento/presentation/widgets/main_app_bar.dart';
import 'package:momento/presentation/widgets/pinnned_label.dart';
import 'package:momento/presentation/widgets/unPinnned_label.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliver_tools/sliver_tools.dart';

final GlobalKey<ScaffoldState> homePageScaffoldkey = GlobalKey<ScaffoldState>();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      key: homePageScaffoldkey,
      // backgroundColor: kBackgroundColor,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
//          physics: BouncingScrollPhysics(),
          slivers: [
            // there is a bug in flutter which causes app to crash if the first widget
            // in [CustomScrollView] is not a sliver i.e. [Consumer] thats why here first
            // widget is [SliverToBoxAdapter].
            SliverToBoxAdapter(),
            Consumer(
              builder: (context, watch, child) {
                final selectednotes = watch(SelectedNotesProvider);
                // [isSelected] will be true if any notes are selected
                bool isSelected = selectednotes.notes_list.isNotEmpty;
//                return SliverAnimatedSwitcher(
//                    child: isSelected
//                        ? MultiSliver(children: [
//                            ContextualAppBar(),
//                            SizedBox(
//                              height: 15.0,
//                            ),
//                          ])
//                        : MainAppBar(),
//                    duration: Duration(milliseconds: 200));
                return SliverStack(
                  children: [
                    SliverOffstage(
                        offstage: isSelected,
                        sliver: MainAppBar(onClick: () {
                          homePageScaffoldkey.currentState.openDrawer();
                        })),
                    if (isSelected)
                      MultiSliver(children: [
                        ContextualAppBar(),
                        SizedBox(
                          height: 15.0,
                        ),
                      ])
                  ],
                );
              },
            ),
            PinnedLable(),
            // pinned notes
            Consumer(
              builder: (context, watch, child) {
                LayoutType layout = watch(NotesRepositoryProvider).layout;
                return layout == LayoutType.Grid
                    ? NotesGrid(
                        page: 'home',
                        type: 'pinned',
                      )
                    : NotesList(
                        page: 'home',
                        type: 'pinned',
                      );
              },
            ),
            UnPinnedLable(),
            // unpinned notes
            Consumer(
              builder: (context, watch, child) {
                LayoutType layout = watch(NotesRepositoryProvider).layout;
                return layout == LayoutType.Grid
                    ? NotesGrid(
                        page: 'home',
                        type: 'unpinned',
                      )
                    : NotesList(
                        page: 'home',
                        type: 'unpinned',
                      );
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 70.0,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Fab(
        onPressed: () async {
          context.read(SelectedNotesProvider).clear();

          bool shouldShowSnackBar = await Navigator.push(
            context,
            PageTransition(
                // type: PageTransitionType.scale,
                // child: AddNotePage(),
                // duration: Duration(milliseconds: 200),
                // alignment: Alignment.bottomRight,
                // curve: Curves.easeInOutCubic),

                //   type: PageTransitionType.rightToLeft,
                //   child: AddNotePage(),
                //   duration: Duration(milliseconds: 200),curve: Curves.easeInOutCubic

                type: PageTransitionType.rightToLeft,
                child: AddNotePage(),
                duration: Duration(milliseconds: 200),
                reverseDuration: Duration(milliseconds: 200),
                // alignment: Alignment.bottomRight,
                curve: Curves.easeInOutCubic),
          );

          if (shouldShowSnackBar == true) {
            emptyNoteDiscardedFlushbar..show(context);
          }
        },
      ),
    );
  }
}
