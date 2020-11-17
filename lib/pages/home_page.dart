import 'package:flutter/material.dart';
import 'package:notepad/pages/add_note_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfffafafa),
      ),
      backgroundColor: Color(0xfffafafa),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 210),
            child: Text(
              'Notepad',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Image.asset('images/notepad.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Voice note, a record of your past path and a',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            'reminder of your future steps.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          tooltip: 'New Note',
          elevation: 5.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNotePage(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
 