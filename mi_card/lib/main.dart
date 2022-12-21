import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  //Need to wrap it as a MaterialApp for the MediaQuery.of(context).size.height to work
  runApp(const MaterialApp(home: W40K()));
}

class W40K extends StatelessWidget {
  const W40K({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          //Get the height of the screen and change it to 20%
          height: MediaQuery.of(context).size.height * 0.2,
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          alignment: Alignment.center,
          color: Colors.red,
          child: const Text(
            "Test",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
