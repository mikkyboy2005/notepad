import 'package:flutter/material.dart';
import 'package:notepad/database/model.dart';
import 'package:notepad/database/helper.dart';

import 'add_note_page.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> noteList = List<Note>();

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  getNotes() async {
    noteList = List<Note>();
    var notes = await NoteHelper().getNotes();

    notes.forEach((note) {
      setState(() {
        var model = Note();
        model.id = note['id'];
        model.title = note['title'];
        model.content = note['content'];
        model.dateTime = note['dateTime'];
        noteList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        backgroundColor: Color(0xfffafafa),
        elevation: 0,
        title: Text(
          'Saved Notes',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notes',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 35,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: (5.0))),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.14),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(44.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.14),
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                    hintText: "Search notes",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Card(
                      color: Colors.grey.withOpacity(0.14),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                        title: Text(
                          noteList[index].title,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  noteList[index].content,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(noteList[index].dateTime),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNotePage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
