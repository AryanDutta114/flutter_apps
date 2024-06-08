import 'package:flutter/material.dart';
import 'widget/subject.dart';
import 'add_subject.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Subject> subjects = [];

  void _addSubject(String subjectName) {
    setState(() {
      subjects.add(Subject(subjectName: subjectName));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return AddSubject(onAddSubject: _addSubject);
            },
          );
        },
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.white38,
        child: Icon(Icons.add),
      ),
      body: Container(
        color: Colors.blueGrey[900],
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
              color: Colors.blueGrey[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Subjects",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                    ),
                    child: Text('Sign out'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return subjects[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
