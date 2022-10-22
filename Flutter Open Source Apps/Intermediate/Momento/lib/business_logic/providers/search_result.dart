import 'package:flutter/cupertino.dart';
import 'package:momento/data/models/note.dart';

class SearchResult extends ChangeNotifier {
  // ProviderReference ref;
  // SearchResult(this.ref);
  List<Note> notes;
  String str;
  SearchResult({this.notes,this.str}){
    // get search results every time this constructor is called
    // in order to fetch search results every time the value of
    // [notes] or [str] changes.
    _get();
  }

  List<Note> result_notes_list = [];

  void _get() {
    List<Note> notes_filtered = [];
    str = str.trim();
    if (str.isEmpty || notes == null) {
      result_notes_list = [];
      notifyListeners();
      return;
    }

    List<String> searchwords = str.split(" ").toList();
    notes.forEach((element) {
      bool flag = searchwords.every((word) {
        return (element.content.toLowerCase().contains(word) ||
            element.title.toLowerCase().contains(word));
      });
      if (flag && !notes_filtered.contains(element))
        notes_filtered.add(element);
    });

    // notes_filtered.forEach((element) {
    //   print('filtered note' + element.id.toString() + ' ' + element.title);
    // });
    result_notes_list = notes_filtered;

    notifyListeners();
  }
}
