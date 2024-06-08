import 'package:flutter/material.dart';
import 'homepage.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
            }));
          },
          child: Text("Sign in"),
          style: TextButton.styleFrom(
            backgroundColor: Colors.lightGreenAccent,
          ),
        ),
      ),
    );
  }
}
