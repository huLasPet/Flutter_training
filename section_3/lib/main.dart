import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          title: const Text(
            "Test appbar",
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.black,
        ),
        body: const Center(
          child: Text(
            "Test body",
            style: TextStyle(color: Colors.deepOrange),
          ),
        ),
      ),
    ),
  );
}
