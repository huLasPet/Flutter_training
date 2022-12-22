import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:developer';

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
      appBar: AppBar(
        title: const Text("Section 6"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(height: 400.0, enlargeCenterPage: true),
              items: [
                {
                  "text": "text1",
                  "link":
                      "https://images.chesscomfiles.com/uploads/v1/images_users/tiny_mce/skittIe-chan/php3Q6y1e.jpeg"
                },
                {
                  "text": "text1",
                  "link":
                      "http://images6.fanpop.com/image/photos/34600000/random-memes-34690623-482-636.jpg"
                },
                {
                  "text": "text1",
                  "link":
                      "https://static.wikia.nocookie.net/cd728776-9761-44d4-ae71-85eb4c33145d/scale-to-width/755"
                }
              ].map((imageLink) {
                log(imageLink.toString());
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.network(imageLink["link"].toString()),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            imageLink["text"].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

//fonts:
//normal text: https://fonts.google.com/specimen/IM+Fell+Great+Primer+SC?query=primer
