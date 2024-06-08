import 'package:flutter/material.dart';

class Subject extends StatefulWidget {
  final String subjectName;
  final int present;
  final int totalClasses;

  Subject({
    required this.subjectName,
    this.present = 0,
    this.totalClasses = 0,
  });

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  late int present;
  late int totalClasses;

  @override
  void initState() {
    super.initState();
    present = widget.present;
    totalClasses = widget.totalClasses;
  }

  double getPercentage() {
    return totalClasses == 0 ? 0 : (present / totalClasses) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 300,
        width: double.infinity,
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.subjectName,
                  style: TextStyle(
                    color: Colors.white38,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    decoration: TextDecoration.none,
                  ),
                ),
                Expanded(child: SizedBox(width: 20)),
                Text(
                  '${getPercentage().toStringAsFixed(1)}%',
                  style: TextStyle(
                    color: Colors.white38,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 15,
                  bottom: 8,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  'Attended $present out of $totalClasses classes',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    "Did you attend today's class?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      present += 1;
                      totalClasses += 1;
                    });
                  },
                  child: Text('YES'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                  ),
                ),
                Expanded(child: SizedBox(width: 10)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      totalClasses += 1;
                    });
                  },
                  child: Text('NO'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  present = 0;
                  totalClasses = 0;
                });
              },
              child: Text('RESET'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
