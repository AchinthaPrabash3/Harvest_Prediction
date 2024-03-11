// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:harvestapp/pages/harvestCard.dart';
import 'package:harvestapp/pages/yieldCard.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey.shade300),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              YieldCard(
                district: 'Matara',
                plantation: "Rice",
                aria: "3",
                Prediction: "3",
                farmerId: "SP20030110",
              ),
              HarvestCard(
                fId: 'SA20030110',
                n: '10',
                p: '10',
                k: '10',
                rainfall: '14',
                temp: '33',
                ph: '2.5',
                recommendation: 'Rice',
              )
            ],
          ),
        ));
  }
}
