import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:developer';

void main() {
  //Need to wrap it as a MaterialApp for the MediaQuery.of(context).size.height to work
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'IM Fell Great Primer SC'),
      home: const W40K(),
    ),
  );
}

class W40K extends StatelessWidget {
  const W40K({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            enlargeCenterPage: true,
          ),
          items: [
            {
              "title": "Emperor of Mankind",
              "text":
                  'The Emperor of Mankind, often referred to by His faithful as the "God-Emperor," the "Master of Mankind," or simply "the Emperor," and who sometimes referred to Himself as "Revelation," is the immortal Perpetual and psyker who serves as the reigning monarch of the Imperium of Man, and is described by the Imperial Ecclesiarchy and the Imperial Cult as the Father, Guardian and God of Humanity.',
              "link":
                  "https://static.wikia.nocookie.net/warhammer40k/images/5/50/EmperorsWisdom.jpg"
            },
            {
              "title": "Abaddon",
              "text":
                  'Abaddon, also known as Abaddon the Despoiler, once named Ezekyle Abaddon, is the Warmaster of Chaos, a Chaos Lord and the greatest Champion of Chaos Undivided in the galaxy. Abaddon is the master of the Black Legion of Chaos Space Marines and is rumoured to be the clone-progeny of the Warmaster Horus, the greatest Traitor in Imperial history, and at one time his most favoured son as the first captain of the Space Marines of the Sons of Horus Legion.',
              "link":
                  'https://static.wikia.nocookie.net/warhammer40k/images/7/76/Abaddon_the_Despoiler3.jpg'
            },
            {
              "title": "Sanguinius",
              "text":
                  'Sanguinius, also known as the "Great Angel" and the "Brightest One" during his lifetime, was the Primarch of the Blood Angels Legion of Space Marines. He was killed during the climax of the Horus Heresy at the Battle of Terra defending the Emperor of Mankind from the Warmaster Horus aboard his flagship, the Battle Barge Vengeful Spirit.',
              "link":
                  'https://static.wikia.nocookie.net/warhammer40k/images/1/1e/Primarch_Sanguinius_Victorious.jpg'
            }
          ].map((imageLink) {
            //log(imageLink.toString());
            return Builder(
              builder: (BuildContext context) {
                return Wrap(
                  children: [
                    AppBar(
                      title: Text(
                        imageLink["title"].toString(),
                        style: const TextStyle(color: Colors.amber),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      margin: const EdgeInsets.symmetric(vertical: 25.0),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Image.network(imageLink["link"].toString()),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Center(
                        child: Text(
                          imageLink["text"].toString(),
                          style: const TextStyle(color: Colors.amber),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
