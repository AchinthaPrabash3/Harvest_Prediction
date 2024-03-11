// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HarvestCard extends StatefulWidget {
  const HarvestCard({super.key});

  @override
  State<HarvestCard> createState() => _HarvestCardState();
}

class _HarvestCardState extends State<HarvestCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(999)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    // ID input
                    'ID: 12345567',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text(
                'Harvest',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mineral Precentage',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              'N :',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '10%',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'P: ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '10%',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'K :',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '10%',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'PH: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '3.5',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Rainfall: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '14mm',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Temperature: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "33C",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              decoration: BoxDecoration(color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommendation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              Text(
                'Rice',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )
            ],
          )
        ]),
      ),
    );
  }
}
