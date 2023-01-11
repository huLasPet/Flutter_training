import 'package:flutter/material.dart';

class Neumorph extends StatefulWidget {
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
  State<Neumorph> createState() => _NeumorphState();
}

class _NeumorphState extends State<Neumorph> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
            boxShadow: widget.isButtonPressed
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
            children: [
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(color: widget.answerColor, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
