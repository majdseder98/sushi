import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class ImageSliders extends StatefulWidget {
  const ImageSliders({Key? key}) : super(key: key); // Corrected typo

  @override
  _ImageSlidersState createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImageSlider in Flutter"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: AnotherCarousel(
              images: [
                AssetImage('assets/box.png'), // Corrected asset path
                NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg"),
              ],
              dotSize: 6,
              indicatorBgPadding: 5.0,
            ),
          ),
        ],
      ),
    );
  }
}
