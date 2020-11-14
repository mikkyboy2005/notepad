import 'package:flutter/material.dart';
import 'package:notepad/database/model.dart';
import 'package:notepad/database/helper.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List notes = List();

  getNotes() async {
    notes = await NoteHelper().getNotes();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        backgroundColor: Color(0xfffafafa),
        elevation: 0,
        title: Text('Saved Notes'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Notes',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
