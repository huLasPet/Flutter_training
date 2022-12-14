import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
      body: Column(
        children: const <Widget>[
          Center(
            child: Text(
              "Test body",
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
          Image(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
        ],
      ),
    ),
  ));
}
