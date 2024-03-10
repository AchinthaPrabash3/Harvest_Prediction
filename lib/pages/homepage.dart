// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harvestapp/pages/harvestpage.dart';
import 'package:harvestapp/pages/historypage.dart';
import 'package:harvestapp/pages/loginpage.dart';
import 'package:harvestapp/pages/mainpage.dart';
import 'package:harvestapp/pages/yieldpage.dart';

class HomePage extends StatefulWidget {
  final String name;

  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    Mainpage(),
    SecondPage(),
  ];
  int _page = 0;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid) // Assuming UID is used as document ID
          .get();
    } else {
      throw Exception('User not authenticated');
    }
  }

  // final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      extendBody: true,
      appBar: appBarFunc(),
      drawer: _homeDrawer(context),
      body: _screens[_page],
      // bottomNavigationBar: Theme(
      //   data: Theme.of(context)
      //       .copyWith(iconTheme: IconThemeData(color: Colors.black)),
      //   child: CurvedNavigationBar(
      //     buttonBackgroundColor: Theme.of(context).primaryColor,
      //     key: _bottomNavigationKey,
      //     animationDuration: Duration(milliseconds: 400),
      //     backgroundColor: Colors.transparent,
      //     items: <Widget>[
      //       Icon(Icons.home_outlined, size: 30),
      //       Icon(Icons.energy_savings_leaf_outlined, size: 30),
      //       Icon(Icons.account_circle_outlined, size: 30),
      //     ],
      //     onTap: (index) {
      //       setState(() {
      //         _page = index;
      //       });
      //     },
      //   ),
      // ),
    );
  }

  AppBar appBarFunc() {
    return AppBar(
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              size: 35, // Changing Drawer Icon Size
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }));
  }

  Drawer _homeDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          SizedBox(child: drawerHeader()),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      title: Text("Home"),
                      leading: Icon(
                        Icons.home_outlined,
                        size: 30,
                      ),
                      splashColor:
                          Theme.of(context).primaryColor.withOpacity(0.5),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _page = 0;
                        });
                      },
                    ),
                    ListTile(
                      title: Text("History"),
                      leading: Icon(
                        Icons.history,
                        size: 30,
                      ),
                      splashColor:
                          Theme.of(context).primaryColor.withOpacity(0.5),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _page = 1;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.black54, width: 0.6)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, bottom: 8, top: 23),
                            child: Text(
                              'Prediction Tools',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text("Yield"),
                            leading: Icon(
                              Icons.trending_up_outlined,
                              size: 30,
                            ),
                            splashColor:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Yield()));
                            },
                          ),
                          ListTile(
                            title: Text("Harvest"),
                            leading: Icon(
                              Icons.analytics_outlined,
                              size: 30,
                            ),
                            splashColor:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HarvestPrediction()));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text('Settings'),
                      leading: Icon(
                        Icons.settings_outlined,
                        size: 30,
                      ),
                      splashColor:
                          Theme.of(context).primaryColor.withOpacity(0.5),
                      onTap: () {},
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Login()),
                            (route) => false);
                        // FirebaseAuth.instance.signOut();
                      },
                      title: Text('Logout'),
                      leading: Icon(
                        Icons.logout,
                        size: 30,
                      ),
                      splashColor:
                          Theme.of(context).primaryColor.withOpacity(0.5),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  DrawerHeader drawerHeader() {
    return DrawerHeader(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/image1.png'), fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        'lib/assets/profile.jpeg',
                        fit: BoxFit.cover,
                        width: 85,
                        height: 85,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: getUserDetails(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator(); // Or any other loading indicator
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.hasError}');
                              } else if (snapshot.hasData) {
                                Map<String, dynamic>? user =
                                    snapshot.data!.data();
                                return Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Text(
                                        (user != null &&
                                                user.containsKey('username'))
                                            ? user['username'].toUpperCase()
                                            : 'No Username',
                                        style: TextStyle(
                                          color: Colors.white,
                                          height: 1.2,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Text(
                                    "No Data"); // Or any other placeholder
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: getUserDetails(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator(); // Or any other loading indicator
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.hasError}');
                              } else if (snapshot.hasData) {
                                Map<String, dynamic>? user =
                                    snapshot.data!.data();
                                return Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Text(
                                      (user != null &&
                                              user.containsKey('location'))
                                          ? user['location'] + " " + "Destrict"
                                          : 'No Username',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                );
                              } else {
                                return Text(
                                    "No Data"); // Or any other placeholder
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }
}
