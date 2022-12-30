import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: const Text("An orange said..."),
          backgroundColor: Colors.deepOrange,
        ),
        body: Orange(),
      ),
    ),
  );
}

class Orange extends StatefulWidget {
  const Orange({super.key});

  @override
  State<Orange> createState() => _OrangeState();
}

class _OrangeState extends State<Orange> {
  String quote = "Click the orange to get a quote";
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  final rawData = await http.get(Uri.parse(
                      'https://api.whatdoestrumpthink.com/api/v1/quotes/random'));
                  var responseData =
                      json.decode(utf8.decode(rawData.bodyBytes));
                  setState(() {
                    quote = responseData["message"];
                  });
                },
                style: ElevatedButton.styleFrom(
                    elevation: 30,
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.deepOrange),
                child: Image.asset(
                  "images/orange.png",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                quote,
                style: const TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
