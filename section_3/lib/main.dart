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
            'Test appbar',
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            //With this below multiple widgets can be added as children
            children: const <Widget>[
              Text(
                'Test body',
                style: TextStyle(color: Colors.deepOrange),
              ),
              //Expanded fits the picture otherwise too big to the screen
              Expanded(
                child: Image(
                    image: NetworkImage(
                        'https://imageproxy.ifunny.co/crop:x-20,resize:640x,quality:90x75/images/452f1819d7cb7673052a1175050af39b1c238be14935c0b461b7d49ca1042dfd_1.jpg')),
              ),
              Expanded(child: Image(image: AssetImage('images/images.jpeg')))
            ],
          ),
        ),
      ),
    ),
  );
}
