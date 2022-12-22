import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:developer';

void main() {
  //Need to wrap it as a MaterialApp for the MediaQuery.of(context).size.height to work
  runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'IM Fell Great Primer SC'),
      home: const W40K()));
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
              enlargeCenterPage: true),
          items: [
            {
              "title": "Title 1",
              "text":
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae vulputate lacus. Fusce dignissim mattis tortor, eu laoreet mauris aliquet eu. Integer aliquam in dui in mollis. Aliquam vel lectus id tortor viverra tempor eu at est. Fusce at gravida risus, vel molestie mi. Ut vel ligula non nisi posuere porta. Nulla maximus volutpat commodo. Vivamus sodales efficitur purus, in ultricies turpis condimentum id. Sed at nisl eu justo aliquet tristique sit amet quis risus. Curabitur elementum volutpat mi, non tempus felis pulvinar ut. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean nec egestas urna. Duis ornare.",
              "link":
                  "https://images.chesscomfiles.com/uploads/v1/images_users/tiny_mce/skittIe-chan/php3Q6y1e.jpeg"
            },
            {
              "title": "Title 2",
              "text":
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum faucibus orci vel sodales fringilla. Ut molestie, tellus eget porta placerat, magna orci venenatis libero, quis vehicula metus lectus in libero. Suspendisse sapien sapien, rhoncus in purus id, imperdiet efficitur quam. Aenean non ligula pellentesque mi bibendum tempor imperdiet sit amet enim. Curabitur dapibus massa non nisl viverra, eget consectetur eros ultricies. Vivamus pretium eget diam eu aliquet. Sed a tempor arcu. Donec dictum ligula eget pharetra dictum. Nunc eget nisi nec nisl porttitor dapibus. Sed fringilla auctor eros, et sollicitudin urna luctus eget. In rhoncus dui vel odio sodales scelerisque.",
              "link":
                  "http://images6.fanpop.com/image/photos/34600000/random-memes-34690623-482-636.jpg"
            },
            {
              "title": "Title 3",
              "text":
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra arcu nec elit cursus, eget auctor nunc malesuada. Sed fringilla, tortor id consectetur tincidunt, justo elit facilisis neque, sed accumsan nisi risus nec quam. Praesent vitae blandit mauris, et tincidunt lorem. Morbi ultrices ultrices ex ac hendrerit. Sed massa diam, mattis quis quam nec, fringilla ornare odio. Aliquam tincidunt eu ipsum a ullamcorper. Aliquam eleifend mauris a volutpat dictum. Ut tristique leo diam, eget tincidunt dolor sagittis non. Phasellus ante lacus, lobortis ut faucibus eu, lobortis at mauris. Sed nisi erat, ullamcorper in aliquet vitae, faucibus sed nisi. Praesent congue.",
              "link":
                  "https://static.wikia.nocookie.net/cd728776-9761-44d4-ae71-85eb4c33145d/scale-to-width/755"
            }
          ].map((imageLink) {
            //log(imageLink.toString());
            return Builder(
              builder: (BuildContext context) {
                return Wrap(
                  children: [
                    AppBar(
                      title: Text(imageLink["title"].toString()),
                      backgroundColor: Colors.black,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.network(imageLink["link"].toString()),
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Center(
                        child: Text(
                          imageLink["text"].toString(),
                          style: const TextStyle(color: Colors.white),
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
