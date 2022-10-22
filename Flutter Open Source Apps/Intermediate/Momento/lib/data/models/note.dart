import 'package:flutter/foundation.dart';
import 'package:momento/data/services/database_service.dart';

class Note extends ChangeNotifier {
  int id;
  String title;
  String content;
  int isPinned;
  String date_created;
  String last_updated;

  bool _disposed = false;
  Note({
    this.id,
    this.title,
    this.content,
    this.isPinned,
    this.date_created,
    this.last_updated,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return new Note(
        id: map['id'],
        title: map['title'],
        content: map['content'],
        isPinned: map['isPinned'],
        date_created: map['date_created'],
        last_updated: map['last_updated']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'title': title,
      'content': content,
      'isPinned': isPinned,
      'date_created': date_created,
      'last_updated': last_updated
    };

    return map;
  }

  Future<int> update(Note note) async {
    var result = await DatabaseService.instance.updateNote(note);
    this.content = note.content;
    this.date_created = note.date_created;
    this.id = note.id;
    this.isPinned = note.isPinned;
    this.last_updated = note.last_updated;
    this.last_updated = note.last_updated;
    this.title = note.title;
    notifyListeners();
    return result;
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
