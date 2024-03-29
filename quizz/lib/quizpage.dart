import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizz/neumoprh.dart';

class QuizPage extends StatefulWidget {
  final unescape = HtmlUnescape();
  String difficulty;
  int topic;
  bool start;
  QuizPage(
      {super.key,
      required this.difficulty,
      required this.topic,
      required this.start});
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String question = 'Fetching questions...';
  String answer = 'Fetching questions...';
  Color answerColor = Colors.black;
  String answerOption1 = '-';
  String answerOption2 = '-';
  String answerOption3 = '-';
  String answerOption4 = '-';
  int correctNumber = 0;
  int incorrectNumber = 0;
  int questionNumber = 10;
  int questionNumberDisplayed = 0;
  dynamic responseData;
  bool isAnswer1Pressed = false;
  bool isAnswer2Pressed = false;
  bool isAnswer3Pressed = false;
  bool isAnswer4Pressed = false;

  //Get 10 new questions via the API call and create a list from them
  //This list is used to set the text on the buttons and the question text
  void getQuestion(widget) async {
    if (questionNumber >= 10) {
      final rawData = await http.get(
        Uri.parse(
          'https://opentdb.com/api.php?amount=10&type=multiple&difficulty=${widget.difficulty}&category=${widget.topic}',
        ),
      );
      responseData = json.decode(
        utf8.decode(rawData.bodyBytes),
      );
      setState(
        () {
          questionNumber = 0;
        },
      );
    }

    //Create the list of all answer options
    List? answerList = [
      widget.unescape
          .convert(responseData['results'][questionNumber]['correct_answer'])
    ];
    List? temp = responseData['results'][questionNumber]['incorrect_answers'];
    answerList.addAll(temp!);

    //Set buttons with possible answers from the previous list after a 2 second delay
    Timer(
      const Duration(seconds: 2),
      () {
        setState(
          () {
            answerColor = Colors.black;
            question = widget.unescape
                .convert(responseData['results'][questionNumber]['question']);
            answer = widget.unescape.convert(
                responseData['results'][questionNumber]['correct_answer']);
            answerOption1 = widget.unescape.convert(
                answerList.removeAt(Random().nextInt(answerList.length)));
            answerOption2 = widget.unescape.convert(
                answerList.removeAt(Random().nextInt(answerList.length)));
            answerOption3 = widget.unescape.convert(
                answerList.removeAt(Random().nextInt(answerList.length)));
            answerOption4 = widget.unescape.convert(
                answerList.removeAt(Random().nextInt(answerList.length)));
            questionNumberDisplayed += 1;
          },
        );
      },
    );
  }

  //Menu that opens when clicking on Stats that show the number of correct and incorrect answers
  void settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.grey.shade300,
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.check),
                  iconColor: Colors.green,
                  title: Text(
                    'Correct - $correctNumber',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.not_interested),
                  iconColor: Colors.red,
                  title: Text(
                    'Incorrect - $incorrectNumber',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        });
  }

  //Set the clicked button to pressed
  void answerButtonPressed(whichButton) {
    setState(
      () {
        switch (whichButton) {
          case 1:
            {
              isAnswer1Pressed = true;
            }
            break;
          case 2:
            {
              isAnswer2Pressed = true;
            }
            break;
          case 3:
            {
              isAnswer3Pressed = true;
            }
            break;
          case 4:
            {
              isAnswer4Pressed = true;
            }
            break;
        }
      },
    );
  }

  //Create the buttons to click when answering the question
  //Should have used a class here instead and assign that to 4 variables - next time
  Padding createAnswerButton(
      answerNumber, int whichButton, bool isButtonPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Neumorph(
        answerColor: Colors.black,
        isButtonPressed: isButtonPressed,
        text: answerNumber,
        onTap: () {
          answerButtonPressed(whichButton);
          Timer(
            const Duration(milliseconds: 300),
            () {
              if (answer == answerNumber) {
                setState(
                  () {
                    answerColor = Colors.green;
                    question = 'Correct, the answer was $answer';
                    correctNumber += 1;
                  },
                );
              } else if (answer == 'Fetching questions...') {
                setState(
                  () {
                    question = answer;
                  },
                );
              } else {
                setState(
                  () {
                    answerColor = Colors.red;
                    question = 'Wrong, the correct answer was $answer';
                    incorrectNumber += 1;
                  },
                );
              }
              isAnswer1Pressed = false;
              isAnswer2Pressed = false;
              isAnswer3Pressed = false;
              isAnswer4Pressed = false;
              questionNumber += 1;
              getQuestion(widget);
            },
          );
        },
      ),
    );
  }

  @override
  //Display the questions and possible answers
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.start == true) {
      widget.start = false;
      getQuestion(widget);
    }

    return ListView(
      reverse: true,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            settingModalBottomSheet(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              elevation: 0,
              foregroundColor: Colors.black),
          child: const Text('Stats'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.05,
              child: Center(
                child: Text('Question $questionNumberDisplayed'),
              ),
            ),
            SizedBox(
              height: size.height * 0.35,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Neumorph(
                    isButtonPressed: false,
                    text: question,
                    answerColor: answerColor),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            createAnswerButton(answerOption1, 1, isAnswer1Pressed),
            createAnswerButton(answerOption2, 2, isAnswer2Pressed),
            createAnswerButton(answerOption3, 3, isAnswer3Pressed),
            createAnswerButton(answerOption4, 4, isAnswer4Pressed),
          ],
        ),
      ],
    );
  }
}
