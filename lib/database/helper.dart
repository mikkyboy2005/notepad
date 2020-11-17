import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:notepad/database/model.dart';

class NoteHelper {
  final String tableName = "notesTable";
  final String columnId = "id";
  final String columnTitle = "title";
  final String columnContent = "content";
  final String columnDateTime = "dateTime";

  static final NoteHelper _instance = NoteHelper.internal();
  factory NoteHelper() => _instance;

  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  NoteHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentDirectory.path}/notes.db";
    print(path);

    var ourDb = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return ourDb;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute("CREATE TABLE IF NOT EXISTS $tableName("
        "$columnId INTEGER PRIMARY KEY , "
        "$columnTitle TEXT, "
        "$columnContent TEXT, "
        "$columnDateTime TEXT"
        ")");
  }

  // Insert Note
  Future<Note> addNote(Note note) async {
    var dbClient = await db;
    note.id = null;
    note.id = await dbClient.insert(tableName, note.toJson());
    return note;
  }

  // Future<List> getNotes() async {
  //   var dbClient = await db;
  //   var res = await dbClient.rawQuery("SELECT * FROM $tableName");
  //   return res.toList();
  // }

  getNotes() async {
    var dbClient = await db;
    return await dbClient.query(tableName);
  }
}
