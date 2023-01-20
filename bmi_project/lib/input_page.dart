import 'package:flutter/material.dart';
import 'package:bmi_project/reusable_card.dart';
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
                  child: cardIcon(FontAwesomeIcons.mars, 'MALE'),
                ),
                ReusableCard(
                  cardColor: colorOfTheCard,
                  child: cardIcon(FontAwesomeIcons.venus, 'FEMALE'),
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

  Column cardIcon(IconData iconName, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FaIcon(
          iconName,
          size: 80,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
