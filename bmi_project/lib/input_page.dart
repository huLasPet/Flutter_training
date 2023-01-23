import 'package:bmi_project/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
Color maleCardColor = inactiveCardColor;
Color femaleCardColor = inactiveCardColor;

enum GenderSelect { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  void changeSelectedCardColor(GenderSelect gender) {
    setState(
      () {
        switch (gender) {
          case GenderSelect.male:
            maleCardColor = activeCardColor;
            femaleCardColor = inactiveCardColor;
            break;
          case GenderSelect.female:
            femaleCardColor = activeCardColor;
            maleCardColor = inactiveCardColor;
            break;
        }
      },
    );
  }

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
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: maleCardColor,
                    child: cardIcon(FontAwesomeIcons.mars, 'MALE'),
                    onPress: () {
                      changeSelectedCardColor(GenderSelect.male);
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: femaleCardColor,
                    child: cardIcon(FontAwesomeIcons.venus, 'FEMALE'),
                    onPress: () {
                      changeSelectedCardColor(GenderSelect.female);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: activeCardColor,
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: activeCardColor,
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: activeCardColor,
                    onPress: () {},
                  ),
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
