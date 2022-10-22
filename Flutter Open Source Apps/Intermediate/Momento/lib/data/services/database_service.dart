import 'dart:io';
import 'package:momento/data/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static const String tableName = "notes_tb";
  static const String columnId = "id";
  static const String columnTitle = "title";
  static const String columnContent = "content";
  static const String columnIsPinned = "isPinned";
  static const String columnDateCreated = "date_created";
  static const String columnLastUpdated = "last_updated";

  DatabaseService._();
  static final DatabaseService instance = new DatabaseService._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "notes.db");
    Database dbCreated =
        await openDatabase(path, version: 1, onCreate: _onCreate);
    return dbCreated;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE $tableName(
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT,
        $columnContent TEXT NOT NULL,
        $columnIsPinned INTEGER NOT NULL,
        $columnDateCreated TEXT,
        $columnLastUpdated TEXT);
        ''');
  }

  Future<int> addNote(Note note) async {
    var db = await database;
    int result = await db.insert("$tableName", note.toMap());
    return result;
  }

  Future<List<Note>> getAllNotes() async {
    var db = await database;
    var result = await db.query(
      "$tableName",
      orderBy: columnDateCreated + ' DESC',
    );
    if (result.isEmpty) return null;
    return result.map((row) => Note.fromMap(row)).toList();
  }

  Future<Note> getNote(int noteId) async {
    var db = await database;
    var item = await db
        .query("$tableName", where: "$columnId = ?", whereArgs: [noteId]);
    if (item.length == 0) return null;
    return new Note.fromMap(item.first);
  }

  Future<int> deleteNote(int noteid) async {
    var db = await database;
    int rowsDeleted = await db
        .delete("$tableName", where: "$columnId = ?", whereArgs: [noteid]);
    return rowsDeleted;
  }

  Future<int> updateNote(Note note) async {
    var db = await database;
    int rowsUpdated = await db.update("$tableName", note.toMap(),
        where: "$columnId  = ?", whereArgs: [note.id]);
    return rowsUpdated;
  }

  Future close() async {
    var db = await database;
    db.close();
  }
}
