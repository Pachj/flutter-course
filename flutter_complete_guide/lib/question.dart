import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  // Constructor (positional argument)
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      // takes as much space as possible (the screen width)
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        // TextAlign. --> Enum
        textAlign: TextAlign.center,
      ),
    );
  }
}
