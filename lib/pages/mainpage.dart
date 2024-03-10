// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:harvestapp/pages/harvestpage.dart';
import 'package:harvestapp/pages/yieldpage.dart';

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
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('lib/assets/crimg.png'),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 15),
                          child: Text(
                            'New Tech To \nThe Filed',
                            style: TextStyle(
                                height: 1.1,
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.amberAccent),
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MainPageNavBtn(context),
            ),
            SingleChildScrollView(
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row MainPageNavBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: SizedBox(
          height: 70,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [Colors.green.shade900, Colors.green.shade300])),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Yield()))
                    },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.trending_up_outlined,
                      size: 34,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      'Yield',
                      style: TextStyle(
                          height: 1, fontSize: 14, color: Colors.white),
                    )
                  ],
                )),
          ),
        )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: SizedBox(
          height: 70,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.green.shade900, Colors.green.shade300])),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HarvestPrediction()))
                    },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.analytics_outlined,
                      size: 34,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      'Harvest',
                      style: TextStyle(
                          height: 1, fontSize: 14, color: Colors.white),
                    )
                  ],
                )),
          ),
        )),
      ],
    );
  }
}
