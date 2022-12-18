import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(questions[_questionIndex]),
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer["score"]), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
