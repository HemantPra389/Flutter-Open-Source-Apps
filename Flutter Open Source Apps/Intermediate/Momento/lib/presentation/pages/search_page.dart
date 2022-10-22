import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momento/business_logic/providers/providers.dart';
import 'package:momento/data/repositories/notes_repository.dart';
import 'package:momento/presentation/widgets/contextual_appbar.dart';
import 'package:momento/presentation/widgets/notes_grid.dart';
import 'package:momento/presentation/widgets/notes_list.dart';
import 'package:momento/presentation/widgets/search_bar.dart';
import 'package:sliver_tools/sliver_tools.dart';

final GlobalKey<ScaffoldState> searchPageScaffoldkey =
    GlobalKey<ScaffoldState>();

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: searchPageScaffoldkey,
      // backgroundColor: kBackgroundColor,
      backgroundColor: Theme.of(context).backgroundColor,
      // appBar: AppBar(
      //   title: const Text('Notes'),
      //   centerTitle: true,
      // ),
      body: WillPopScope(
        onWillPop: () async {
          if (context.read(SelectedNotesProvider).notes_list.isEmpty) {
            return true;
          } else {
            context.read(SelectedNotesProvider).clear();
            return false;
          }
        },
        child: SafeArea(
          top: true,
          child: CustomScrollView(
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
//                  child: isSelected
//                      ? ContextualAppBar()
//                      : SearchBar(
//                          onTextChanged: (val) {
//                            setState(() {
//                              txt = val;
//                            });
//                          },
//                        ),
//                  duration: Duration(milliseconds: 200),
//                );
                  return SliverStack(
                    children: [
                      SliverOffstage(
                        offstage: isSelected,
                        sliver: SearchBar(),
                      ),
                      if (isSelected) ContextualAppBar()
                    ],
                  );
                },
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),

              Consumer(
                builder: (context, watch, child) {
                  String txt = watch(SearchTextProvider).state;
                  if (txt.isNotEmpty) {
                    return context.read(NotesRepositoryProvider).layout ==
                            LayoutType.Grid
                        ? NotesGrid(
                            page: 'search',
                            type: 'all',
                          )
                        : NotesList(
                            page: 'search',
                            type: 'all',
                          );
                  } else {
                    return SliverToBoxAdapter(
                      child: Container(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
