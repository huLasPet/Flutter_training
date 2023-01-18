import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  String text;
  Color colorToUse;
  List<Color> gradientToUse;

  GlassBox({
    super.key,
    required this.text,
    required this.colorToUse,
    required this.gradientToUse,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.5,
        child: Stack(
          children: [
            //Adding the blur effect
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorToUse,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: gradientToUse,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      //TODO: Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                      text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
