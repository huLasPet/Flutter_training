import 'package:bmi_project/constants.dart';
import 'package:bmi_project/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color maleCardColor = inactiveCardColor;
Color femaleCardColor = inactiveCardColor;

enum GenderSelect { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double _currentHeight = 40;
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('HEIGHT', style: cardFontStyle),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              _currentHeight.toStringAsFixed(0),
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text('cm'),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            overlayColor: bottomContainerColor.withOpacity(0.5),
                            thumbColor: bottomContainerColor,
                            activeTrackColor: Colors.white,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12),
                          ),
                          child: Slider(
                            value: _currentHeight,
                            min: 40,
                            max: 250,
                            onChanged: (value) {
                              setState(
                                () {
                                  _currentHeight = value.floorToDouble();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text('Placeholder for WEIGHT')],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: activeCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text('Placeholder for AGE')],
                    ),
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
          style: cardFontStyle,
        ),
      ],
    );
  }
}
