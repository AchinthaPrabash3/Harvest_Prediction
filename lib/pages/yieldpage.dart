// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:harvestapp/pages/yieldCard.dart';

class Yield extends StatefulWidget {
  const Yield({
    super.key,
  });

  @override
  State<Yield> createState() => _YieldState();
}

class _YieldState extends State<Yield> {
  late String district;

  List<String> cropTypes = [
    "Rice",
    "Carrot",
    "Banana",
    "Tea",
    "Corn",
    "Cinnamon",
    "Pepper",
    "Greenchilli",
    "Cucumber",
    "Mungbean",
    "Potato",
    "Pomegranate",
    "Mango",
    "Watermelon",
    "Beetroot",
    "Orange",
    "Papaya",
    "Coconut",
    "Brinjal",
    "Yard long bean",
    "Coffee"
  ];

  List<String> locations = [
    "Galle",
    "Matara",
    'Hambantota',
    "Kalutara",
    "Colombo",
    "Hampaha",
    "Matala",
    "Kandy",
    "Nuwara Eliya",
    "kegalle",
    "Ratnapura",
    "Anuradapura",
    "Polonnaruwa",
    "Jaffna",
    "Kilinochchi",
    "Mannar",
    "Mullativeu",
    "Vavuniya",
    "Puttalam",
    "Kurunegala",
    "Trincomalee",
    "Batticola",
    "Ampara",
    "Badulla",
    "Monaragala"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 28),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              "Yield Prediction",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: Colors.green.shade300,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
          child: Column(
            children: [
              districtDropDown(),
              SizedBox(
                height: 10,
              ),
              ladAria(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: cropTypeDropdown(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: farmerID(),
                  ),
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
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Result",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 400,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        YieldCard(
                          district: 'Matara',
                          plantation: "Rice",
                          aria: "3",
                          Prediction: "3",
                          farmerId: "SP20030110",
                        ),
                      ]),
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

  SizedBox farmerID() {
    return SizedBox(
      height: 60,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          labelText: 'Farmer ID',
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade300),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  DropdownSearch<String> cropTypeDropdown() {
    return DropdownSearch(
      items: cropTypes,
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade300,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade300)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(style: BorderStyle.none, width: 0)),
              label: Text("Crop Type"),
              labelStyle: TextStyle(color: Colors.black))),
    );
  }

  TextField ladAria() {
    return TextField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          fillColor: Colors.grey.shade300,
          filled: true,
          label: Text('Land Aria'),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade300)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(style: BorderStyle.none, width: 0))),
    );
  }

  DropdownSearch<String> districtDropDown() {
    return DropdownSearch(
      items: locations,
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade300,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade300)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(style: BorderStyle.none, width: 0)),
              label: Text("District"),
              labelStyle: TextStyle(color: Colors.black))),
      onChanged: (value) {
        setState(() {
          district = value!;
        });
      },
    );
  }
}
