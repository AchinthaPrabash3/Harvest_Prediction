// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:harvestapp/pages/harvestCard.dart';

class HarvestPrediction extends StatefulWidget {
  const HarvestPrediction({super.key});

  @override
  State<HarvestPrediction> createState() => _HarvestPredictionState();
}

class _HarvestPredictionState extends State<HarvestPrediction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green.shade300,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              "Harvest Prediction",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
          child: Column(
            children: [
              DropdownSearch(
                items: const ["colombo", "Matara", "Galle", "GAmpaha", "ino"],
                dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green.shade300)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(style: BorderStyle.none, width: 0)),
                        label: Text("District"),
                        labelStyle: TextStyle(color: Colors.black))),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "N",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            fillColor: Colors.grey.shade300,
                            filled: true),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "P",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            fillColor: Colors.grey.shade300,
                            filled: true),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "K",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            fillColor: Colors.grey.shade300,
                            filled: true),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Temperature",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            fillColor: Colors.grey.shade300,
                            filled: true),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 5,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "PH",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            fillColor: Colors.grey.shade300,
                            filled: true),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Rainfall",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            fillColor: Colors.grey.shade300,
                            filled: true),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 5,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Farmer ID",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            fillColor: Colors.grey.shade300,
                            filled: true),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Text(
                    "predict".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Result',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: 350,
                    child: SingleChildScrollView(
                      child: Column(children: [HarvestCard()]),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
