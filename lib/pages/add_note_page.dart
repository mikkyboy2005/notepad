import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notepad/database/model.dart';
import 'package:notepad/pages/notes_page.dart';
import 'package:notepad/util/navigate.dart';
import 'package:notepad/util/increment_counter.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  var now = new DateTime.now();

  bool validate = false;

  final noteTitle = TextEditingController();
  final noteContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.blue,
        ),
        title: Text(
          'Note',
          style: TextStyle(color: Colors.black),
        ),
        actions: [ 
          Visibility(
            visible: noteContent.text.isNotEmpty,
            child: IconButton(
              tooltip: 'Done',
              disabledColor: Colors.grey,
              icon: Icon(
                Icons.done,
                color: Colors.blue,
              ),
              onPressed: () async {
                noteContent.text.isEmpty ? validate = false : validate = true;
                print('Note validate = $validate');

                Note added = await IncrementCounter.incrementCounter(
                  noteTitle.text,
                  noteContent.text,
                  now.toIso8601String(),
                );

                // Quickly collapse android keyboard.
                if (validate == true) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Future.delayed(
                    Duration(milliseconds: 100),
                  );
                  Navigate.pushPage(context, NotesPage());
                }
                setState(() {});
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  '${DateFormat('MMMM dd, yyyy HH:mm').format(now)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0, top: 10.0),
            child: TextFormField(
              controller: noteTitle,
              decoration: const InputDecoration.collapsed(
                hintText: 'Title',
              ),
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 17.0, top: 30),
              child: TextField(
                controller: noteContent,
                decoration: InputDecoration.collapsed(
                  hintText: 'Note Something down',
                ),
                onChanged: (val) {
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_photo,
              color: Colors.grey[600],
            ),
            title: Text(
              'Albums',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_list,
              color: Colors.grey[600],
            ),
            title: Text(
              'To-do list',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.grey[600],
            ),
            title: Text(
              'Reminder',
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
