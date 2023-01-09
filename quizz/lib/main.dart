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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final unescape = HtmlUnescape();
  QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String question = "Tap any of the buttons to start";
  String answer = "";
  Color correctColor = Colors.blueGrey;
  String answerOption1 = "-";
  String answerOption2 = "-";
  String answerOption3 = "-";
  String answerOption4 = "-";
  int correctNumber = 0;
  int incorrectNumber = 0;

  //Has to be here so it can use setState - otherwise the value of the button and what is displayed is different
  void getQuestion(widget) async {
    final rawData = await http
        .get(Uri.parse('https://opentdb.com/api.php?amount=1&type=multiple'));
    var responseData = json.decode(utf8.decode(rawData.bodyBytes));

    //Create a list of all answers
    List? answerList = [
      widget.unescape.convert(responseData["results"][0]["correct_answer"])
    ];
    List? temp = responseData["results"][0]["incorrect_answers"];
    answerList.addAll(temp!);

    //Set buttons with possible answers from the previous list
    setState(
      () {
        correctColor = Colors.blueGrey;
        question =
            widget.unescape.convert(responseData["results"][0]["question"]);
        answer = widget.unescape
            .convert(responseData["results"][0]["correct_answer"]);
        answerOption1 = widget.unescape
            .convert(answerList.removeAt(Random().nextInt(answerList.length)));
        answerOption2 = widget.unescape
            .convert(answerList.removeAt(Random().nextInt(answerList.length)));
        answerOption3 = widget.unescape
            .convert(answerList.removeAt(Random().nextInt(answerList.length)));
        answerOption4 = widget.unescape
            .convert(answerList.removeAt(Random().nextInt(answerList.length)));
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
        style: TextButton.styleFrom(backgroundColor: correctColor),
        child: Text(
          answerNumber,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          if (answer == answerNumber) {
            setState(() {
              correctColor = Colors.green;
              correctNumber += 1;
              getQuestion(widget);
            });
          } else if (answer == "") {
            getQuestion(widget);
          } else {
            setState(() {
              correctColor = Colors.red;
              incorrectNumber += 1;
              getQuestion(widget);
            });
          }
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
              backgroundColor: Colors.grey.shade900, elevation: 0),
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
