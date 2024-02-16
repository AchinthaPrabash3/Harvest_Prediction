// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FlutterCarousel(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  height: 250.0,
                  showIndicator: true,
                  slideIndicator: CircularSlideIndicator(),
                ),
                items: [
                  Container(
                    decoration: BoxDecoration(color: Colors.deepPurple),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.amberAccent),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
