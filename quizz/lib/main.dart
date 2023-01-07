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
  String question = "Tap any of the buttons to start";
  String answer = "";
  Color correctColor = Colors.blueGrey;
  late String answerOption1 = "-";
  late String answerOption2 = "-";
  late String answerOption3 = "-";
  late String answerOption4 = "-";
  QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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
        widget.correctColor = Colors.blueGrey;
        widget.question =
            widget.unescape.convert(responseData["results"][0]["question"]);
        widget.answer = widget.unescape
            .convert(responseData["results"][0]["correct_answer"]);
        widget.answerOption1 = widget.unescape
            .convert(answerList.removeAt(Random().nextInt(answerList.length)));
        widget.answerOption2 = widget.unescape
            .convert(answerList.removeAt(Random().nextInt(answerList.length)));
        widget.answerOption3 = widget.unescape
            .convert(answerList.removeAt(Random().nextInt(answerList.length)));
        widget.answerOption4 = widget.unescape
            .convert(answerList.removeAt(Random().nextInt(answerList.length)));
      },
    );
  }

  Padding createButton(widgetNumber) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: widget.correctColor),
        child: Text(
          widgetNumber,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          if (widget.answer == widgetNumber || widget.answer == "") {
            setState(() {
              widget.correctColor = Colors.green;
              getQuestion(widget);
            });
          } else {
            setState(() {
              widget.correctColor = Colors.red;
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              widget.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: size.height * 0.20,
            ),
            createButton(widget.answerOption1),
            createButton(widget.answerOption2),
            createButton(widget.answerOption3),
            createButton(widget.answerOption4),
          ],
        ),
      ],
    );
  }
}
