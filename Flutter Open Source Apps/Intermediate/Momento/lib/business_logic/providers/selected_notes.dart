import 'package:flutter/cupertino.dart';
import 'package:momento/data/models/note.dart';


// stores notes which are currrently selected and notifies it's listners when ever selection changes
class SelectedNotes extends ChangeNotifier{
  List<Note> notes_list = [];
  
  void add(Note note){
    notes_list.add(note);
    notifyListeners();
  }

  void remove(Note note){
    notes_list.removeWhere((element) => element.id == note.id);
    notifyListeners();
  }

  void clear(){
    notes_list = [];
    notifyListeners();
  }
}