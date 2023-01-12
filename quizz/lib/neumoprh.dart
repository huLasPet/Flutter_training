import 'package:flutter/material.dart';

class Neumorph extends StatelessWidget {
  final onTap;
  late bool isButtonPressed;
  late String text;
  late Color answerColor;
  Neumorph(
      {super.key,
      this.onTap,
      required this.isButtonPressed,
      required this.text,
      required this.answerColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isButtonPressed
                ? []
                : [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, -5),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: answerColor,
                  fontSize: 20,
                  shadows: <Shadow>[
                    Shadow(
                      offset: const Offset(5.0, 5.0),
                      blurRadius: 15.0,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
