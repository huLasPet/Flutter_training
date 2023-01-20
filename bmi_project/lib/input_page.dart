import 'package:flutter/material.dart';
import 'package:bmi_project/custom_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const colorOfTheCard = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    Size cardSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  cardColor: colorOfTheCard,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                      Text('Male'),
                    ],
                  ),
                ),
                ReusableCard(
                  cardColor: colorOfTheCard,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.venus,
                        size: 80,
                      ),
                      Text('Female'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                ReusableCard(
                  cardColor: colorOfTheCard,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                ReusableCard(
                  cardColor: colorOfTheCard,
                ),
                ReusableCard(
                  cardColor: colorOfTheCard,
                ),
              ],
            ),
          ),
          Container(
            height: cardSize.height * 0.08,
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 20),
          )
        ],
      ),
    );
  }
}
