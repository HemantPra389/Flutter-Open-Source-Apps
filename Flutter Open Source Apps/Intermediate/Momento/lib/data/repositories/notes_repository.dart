import 'package:flutter/foundation.dart';
import 'package:momento/data/models/note.dart';
import 'package:momento/data/services/database_service.dart';

enum LayoutType { List, Grid }

class NotesRepository extends ChangeNotifier {
  List<Note> notes_list;
  LayoutType layout = LayoutType.Grid;
  NotesRepository() {
    this.notes_list = [];
  }

  Future<int> addNote(Note note) async {
    var result = await DatabaseService.instance.addNote(note);
    await getAllNotes();
    // notifyListeners();
    return result;
  }

  Future<void> getAllNotes() async {
    notes_list = await DatabaseService.instance.getAllNotes();
    notifyListeners(); //  if(notes_list == null) return [];
  }

  Future<Note> getNote(int noteId) async {
    return notes_list.map((element) {
      if (element.id == noteId) {
        return element;
      }
    }).first;
  }

  Future<int> deleteNote(int noteid) async {
    var result = await DatabaseService.instance.deleteNote(noteid);
    //await getAllNotes();
    // notifyListeners();
    return result;
  }

  Future<void> deleteMultipleNotes(List<int> noteids) async {
    noteids.forEach((element) async {
      await DatabaseService.instance.deleteNote(element);
    });
    await getAllNotes();
    // notifyListeners();
  }

  setPin(List<Note> notelist) {
    notelist.forEach((element) {
      Note temp = element;
      temp.isPinned = 1;
      element.update(temp);
    });
    notifyListeners();
  }

  unsetPin(List<Note> notelist) {
    notelist.forEach((element) {
      Note temp = element;
      temp.isPinned = 0;
      element.update(temp);
    });
    notifyListeners();
  }
  // Future<void> updateNote(Note note) async {

  //   await DatabaseHelper.instance.updateNote(note);

  //   // await getAllNotes();
  //   notifyListeners();
  // }

  void toggleView() {
    if (layout == LayoutType.Grid) {
      layout = LayoutType.List;
    } else {
      layout = LayoutType.Grid;
    }
    notifyListeners();
  }
  // Future<int> updateNote(Note note) async {
  //   var result = await DatabaseHelper.instance.updateNote(note);
  //   // notes_list = await DatabaseHelper.instance.getAllNotes();

  //  int index= notes_list.indexWhere((element) => element.id == note.id);
  //  notes_list[index] = note;
  //   notifyListeners();
  //   return result;
  // }
}
