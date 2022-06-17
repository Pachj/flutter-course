import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        // () around questions --> as List<String> says dart, that this is is a List
        // spread operator to have individual items in the children list
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map(
              (answer) =>
                  Answer(() => answerQuestion(answer['score']), answer['text']),
            )
            .toList()
      ],
    );
  }
}
