import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizz/neumoprh.dart';
import 'package:quizz/topics.dart' as topics;
import 'package:quizz/quizpage.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: const SafeArea(
          child: HomePage(),
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
  bool isButtonPressed = false;
  bool isEasyButtonPressed = false;
  bool isMediumButtonPressed = false;
  bool isHardButtonPressed = false;
  String startButtonText = 'Start';

  String difficulty = '';
  bool start = true;
  int dropdownValue = 15;

  void buttonPressed() {
    //Start button will stay pressed with a restart text
    //until a new topic or difficulty is selected to indicate that
    //clicking start will use the same settings as last time
    setState(
      () {
        isButtonPressed = true;
        startButtonText = 'Restart with same settings';
      },
    );
    Timer(
      const Duration(milliseconds: 300),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Scaffold(
              backgroundColor: Colors.grey.shade300,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: QuizPage(
                    difficulty: difficulty,
                    topic: dropdownValue,
                    start: start,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: DropdownButton(
              style: const TextStyle(fontSize: 18, color: Colors.black),
              alignment: AlignmentDirectional.center,
              value: dropdownValue,
              items: topics.list,
              onChanged: (value) {
                setState(
                  () {
                    dropdownValue = value;
                    isButtonPressed = false;
                    startButtonText = 'Start';
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: size.width * 0.3,
                child: Neumorph(
                  answerColor: Colors.black,
                  onTap: () {
                    setState(
                      () {
                        if (isEasyButtonPressed) {
                          isEasyButtonPressed = false;
                        } else {
                          isEasyButtonPressed = true;
                          isMediumButtonPressed = false;
                          isHardButtonPressed = false;
                          isButtonPressed = false;
                          startButtonText = 'Start';
                        }
                        difficulty = 'easy';
                      },
                    );
                  },
                  isButtonPressed: isEasyButtonPressed,
                  text: 'Easy',
                ),
              ),
              SizedBox(
                width: size.width * 0.3,
                child: Neumorph(
                  answerColor: Colors.black,
                  onTap: () {
                    setState(
                      () {
                        if (isMediumButtonPressed) {
                          isMediumButtonPressed = false;
                        } else {
                          isMediumButtonPressed = true;
                          isEasyButtonPressed = false;
                          isHardButtonPressed = false;
                          isButtonPressed = false;
                          startButtonText = 'Start';
                        }
                        difficulty = 'medium';
                      },
                    );
                  },
                  isButtonPressed: isMediumButtonPressed,
                  text: 'Medium',
                ),
              ),
              SizedBox(
                width: size.width * 0.3,
                child: Neumorph(
                  answerColor: Colors.black,
                  onTap: () {
                    setState(
                      () {
                        if (isHardButtonPressed) {
                          isHardButtonPressed = false;
                        } else {
                          isHardButtonPressed = true;
                          isEasyButtonPressed = false;
                          isMediumButtonPressed = false;
                          isButtonPressed = false;
                          startButtonText = 'Start';
                        }
                        difficulty = 'hard';
                      },
                    );
                  },
                  isButtonPressed: isHardButtonPressed,
                  text: 'Hard',
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.25,
          ),
          SizedBox(
            height: size.height * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Neumorph(
                answerColor: Colors.black,
                onTap: buttonPressed,
                isButtonPressed: isButtonPressed,
                text: startButtonText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
