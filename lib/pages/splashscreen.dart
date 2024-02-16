import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harvestapp/pages/loginpage.dart';

class SplahScreen extends StatefulWidget {
  const SplahScreen({super.key});

  @override
  State<SplahScreen> createState() => __SplahScreenState();
}

class __SplahScreenState extends State<SplahScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Login()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green.shade600, Colors.green.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Icon(
          Icons.face,
          size: 40,
        ),
      ),
    );
  }
}
