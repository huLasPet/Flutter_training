import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Section 5 AppBar"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(height: 400.0, enlargeCenterPage: true),
          items: [
            "https://images.chesscomfiles.com/uploads/v1/images_users/tiny_mce/skittIe-chan/php3Q6y1e.jpeg",
            "http://images6.fanpop.com/image/photos/34600000/random-memes-34690623-482-636.jpg",
            "https://static.wikia.nocookie.net/cd728776-9761-44d4-ae71-85eb4c33145d/scale-to-width/755"
          ].map((imageLink) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.network(imageLink));
              },
            );
          }).toList(),
        ),
      ),
    ),
  ));
}
