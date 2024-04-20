import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CorseShow extends StatelessWidget {
  final List list;
  final Widget Function(int index) item;
  final double? hight;
  const CorseShow(
      {super.key, this.hight, required this.item, required this.list});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(list.length, (index) => item(index)),
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        initialPage: 0,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayCurve: Curves.linearToEaseOut,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
