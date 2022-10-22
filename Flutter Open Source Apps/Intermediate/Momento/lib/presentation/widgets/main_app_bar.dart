import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momento/presentation/pages/search_page.dart';
import 'package:momento/business_logic/providers/providers.dart';
import 'package:momento/data/repositories/notes_repository.dart';

class MainAppBar extends StatefulWidget {
  final VoidCallback onClick;
  MainAppBar({this.onClick});
  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
      floating: true,
      snap: true,
      primary: false,
      elevation: 0.0,
      toolbarHeight: 71.0,

      // centerTitle: true,
      // forceElevated: true,
      automaticallyImplyLeading: false,
      // backgroundColor: Color(0xFF354252),
      backgroundColor: Colors.transparent,
      title: Column(
        children: [
          SizedBox(
            height: 5.0,
          ),
          Card(
            // elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                // color: Color(0xFF303440),
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10.0),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        splashRadius: 25.0,
                        icon: Icon(
                          Icons.menu,
                          color: Theme.of(context).appBarTheme.iconTheme.color,
                        ),
                        onPressed: () {
                          widget.onClick();
                        },
                      ),
                      Expanded(
                        child: Hero(
                          tag: 'searchbar',
                          transitionOnUserGestures: true,
                          child: Material(
                            type: MaterialType.transparency,
                            child: Text(
                              'Search your notes',
                              style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 18.0,
                                  // color: Colors.grey.shade400,
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .titleTextStyle
                                      .color),
                            ),
                          ),
                        ),
                      ),
                      Consumer(
                        builder: (context, watch, child) {
                          final viewModel = watch(NotesRepositoryProvider);
                          // layout variable is used to determine currently slected layout
                          LayoutType layout = viewModel.layout;
                          if (layout == LayoutType.Grid) {
                            return IconButton(
                              splashRadius: 25.0,
                              icon: Icon(
                                Icons.view_agenda_outlined,
                                // color: Colors.grey.shade400,
                                color: Theme.of(context)
                                    .appBarTheme
                                    .actionsIconTheme
                                    .color,
                              ),
                              onPressed: () {
                                viewModel.toggleView();
                              },
                            );
                          } else {
                            // if current layout is List then Show the Grid Icon
                            return IconButton(
                              splashRadius: 25.0,
                              icon: Icon(
                                Icons.grid_view,
                                // color: Colors.grey.shade400,
                                color: Theme.of(context)
                                    .appBarTheme
                                    .actionsIconTheme
                                    .color,
                              ),
                              onPressed: () {
                                viewModel.toggleView();
                              },
                            );
                          }
                          // }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
