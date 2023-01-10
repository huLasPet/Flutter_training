import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        //style: TextButton.styleFrom(backgroundColor: Colors.black),
        child: const Text(
          'Placeholder for Easy questions',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Scaffold(
                backgroundColor: Colors.black,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: QuizPage(
                      difficulty: 'easy',
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final unescape = HtmlUnescape();
  String difficulty;
  QuizPage({super.key, required this.difficulty});
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String question = 'Tap any of the buttons to start';
  String answer = 'Fetching questions...';
  Color answerColor = Colors.blueGrey;
  String answerOption1 = '-';
  String answerOption2 = '-';
  String answerOption3 = '-';
  String answerOption4 = '-';
  int correctNumber = 0;
  int incorrectNumber = 0;
  int questionNumber = 10;
  dynamic responseData;

  //Get 10 new questions via the API call and create a list from them which is used to set the buttons
  void getQuestion(widget) async {
    if (questionNumber >= 10) {
      final rawData = await http.get(
        Uri.parse(
          'https://opentdb.com/api.php?amount=10&type=multiple&difficulty=${widget.difficulty}',
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
            answerColor = Colors.blueGrey;
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
          },
        );
      },
    );
  }

  //Menu that opens when clicking on Stats that show the number of correct and incorrect answers
  void settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.grey.shade900,
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
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.not_interested),
                  iconColor: Colors.red,
                  title: Text(
                    'Incorrect - $incorrectNumber',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        });
  }

  //Create the buttons to click when answering the question
  Padding createButton(answerNumber) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: answerColor),
        child: Text(
          answerNumber,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
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
          questionNumber += 1;
          getQuestion(widget);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      reverse: true,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            settingModalBottomSheet(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, elevation: 0),
          child: const Text('Stats'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: size.height * 0.20,
            ),
            createButton(answerOption1),
            createButton(answerOption2),
            createButton(answerOption3),
            createButton(answerOption4),
          ],
        ),
      ],
    );
  }
}
//TODO: Difficulty and topic selector at start
