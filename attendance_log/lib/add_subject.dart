import 'package:flutter/material.dart';

class AddSubject extends StatefulWidget {
  final Function(String) onAddSubject;

  AddSubject({required this.onAddSubject});

  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  final TextEditingController _controller = TextEditingController();

  void _handleAdd() {
    final subjectName = _controller.text.trim();
    if (subjectName.isNotEmpty) {
      widget.onAddSubject(subjectName);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Add Subject",
            style: TextStyle(
              color: Colors.white38,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              decoration: TextDecoration.none,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              controller: _controller,
            ),
          ),
          TextButton(
            onPressed: _handleAdd,
            child: Icon(Icons.add, color: Colors.white),
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightGreenAccent,
            ),
          ),
        ],
      ),
    );
  }
}
