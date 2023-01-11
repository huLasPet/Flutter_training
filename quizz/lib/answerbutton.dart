import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizz/neumoprh.dart';

class Answerbutton extends StatefulWidget {
  bool isAnswerButtonPressed;
  Color answerColor;
  String answerNumber;
  String answer;
  String question;
  int correctNumber;
  int incorrectNumber;
  int questionNumber;

  Answerbutton({
    super.key,
    required this.isAnswerButtonPressed,
    required this.answerColor,
    required this.answerNumber,
    required this.answer,
    required this.question,
    required this.correctNumber,
    required this.incorrectNumber,
    required this.questionNumber,
  });

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
    return Neumorph(
      answerColor: widget.answerColor,
      isButtonPressed: widget.isAnswerButtonPressed,
      text: widget.answerNumber,
      onTap: () {
        answerButtonPressed();
        Timer(
          const Duration(milliseconds: 300),
          () {
            if (widget.answer == widget.answerNumber) {
              setState(
                () {
                  widget.answerColor = Colors.green;
                  widget.question = 'Correct, the answer was ${widget.answer}';
                  widget.correctNumber += 1;
                  widget.isAnswerButtonPressed = false;
                },
              );
            } else if (widget.answer == 'Fetching questions...') {
              setState(
                () {
                  widget.question = widget.answer;
                  widget.isAnswerButtonPressed = false;
                },
              );
            } else {
              setState(
                () {
                  widget.answerColor = Colors.red;
                  widget.question =
                      'Wrong, the correct answer was ${widget.answer}';
                  widget.incorrectNumber += 1;
                  widget.isAnswerButtonPressed = false;
                },
              );
            }
            widget.questionNumber += 1;
          },
        );
      },
    );
  }
}
