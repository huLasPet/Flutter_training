import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizz/neumoprh.dart';

class Answerbutton extends StatefulWidget {
  bool isAnswerButtonPressed;
  Answerbutton({super.key, required this.isAnswerButtonPressed});

  @override
  State<Answerbutton> createState() => _AnswerbuttonState();
}

class _AnswerbuttonState extends State<Answerbutton> {
  void answerButtonPressed() {
    setState(
      () {
        widget.isAnswerButtonPressed = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Neumorph(
        answerColor: answerColor,
        isButtonPressed: widget.isAnswerButtonPressed,
        text: answerNumber,
        onTap: () {
          answerButtonPressed();
          Timer(
            const Duration(milliseconds: 300),
            () {
              if (answer == answerNumber) {
                setState(
                  () {
                    answerColor = Colors.green;
                    question = 'Correct, the answer was $answer';
                    correctNumber += 1;
                    isAnswerButtonPressed = false;
                  },
                );
              } else if (answer == 'Fetching questions...') {
                setState(
                  () {
                    question = answer;
                    isAnswerButtonPressed = false;
                  },
                );
              } else {
                setState(
                  () {
                    answerColor = Colors.red;
                    question = 'Wrong, the correct answer was $answer';
                    incorrectNumber += 1;
                    isAnswerButtonPressed = false;
                  },
                );
              }
              questionNumber += 1;
              getQuestion(widget);
            },
          );
        },
      ),
    );
  }
}
