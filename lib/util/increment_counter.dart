import 'package:notepad/database/helper.dart';
import 'package:notepad/database/model.dart';
import 'package:notepad/pages/add_note_page.dart';

class IncrementCounter {
  static Future<Note> incrementCounter(
      String noteTitle, String noteContent, String dateTime) async {
    Note note = Note(
        id: 0,
        title: '$noteTitle',
        content: '$noteContent',
        dateTime: '$dateTime');
    Note added = await NoteHelper().addNote(note);
    print(added.toJson());
    return added;
  }
}
