// ignore_for_file: unused_field, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harvestapp/pages/homepage.dart';
import 'package:harvestapp/pages/signuppage.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;
  bool _checked = false;
  late String errorText;
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordcon = TextEditingController();

  late String _name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/image1.png"), fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(100))),
              child: Padding(
                padding: EdgeInsets.only(top: 46.0, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        loginWelcomwText(),
                        SizedBox(
                          height: 50,
                        ),
                        emailTextfield(),
                        SizedBox(
                          height: 20,
                        ),
                        passwordTextfield(),
                        SizedBox(
                          height: 10,
                        ),
                        passwordFunc(),
                        SizedBox(
                          height: 10,
                        ),
                        loginBtn(context),
                        SizedBox(
                          height: 65,
                        )
                      ],
                    ),
                    signupPageNav(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox passwordFunc() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  value: _checked,
                  onChanged: (value) {
                    setState(() {
                      _checked = !_checked;
                    });
                  }),
              Text(
                "Remember Me",
                style: TextStyle(color: Colors.grey.shade600),
              )
            ],
          ),
          TextButton(
              style:
                  TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
              onPressed: () {},
              child: Text(
                "forgot password ?",
                style: TextStyle(color: Colors.grey.shade600),
              ))
        ],
      ),
    );
  }

  Padding signupPageNav(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
            style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: Text(
              "Don't have a account sign up now",
              style:
                  GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black)),
            )),
      ),
    );
  }

  SizedBox loginBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          userlogin();
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.green[700]),
        child: Text(
          "Login",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          )),
        ),
      ),
    );
  }

  SizedBox passwordTextfield() {
    return SizedBox(
      height: 55,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          controller: _passwordcon,
          obscureText: _isHidden,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none)),
              labelText: "Password",
              labelStyle:
                  GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black)),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: IconButton(
                  onPressed: _togglePasswordView,
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey.shade600,
                  ))),
        ),
      ),
    );
  }

  SizedBox emailTextfield() {
    return SizedBox(
      height: 55,
      child: Material(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(0)),
        child: TextField(
          controller: _emailCon,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(style: BorderStyle.none, width: 0)),
              labelText: "Email",
              labelStyle:
                  GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black)),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.grey.shade600,
              )),
        ),
      ),
    );
  }

  Padding loginWelcomwText() {
    return Padding(
      padding: EdgeInsets.only(left: 0.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text("Welcome",
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.green[700],
                    height: .9,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Please log in with your information",
              textAlign: TextAlign.left,
              style:
                  GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey)),
            ),
          )
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void userlogin() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailCon.text, password: _passwordcon.text);

      if (context.mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(name: "Achintha")));
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      print("Error $e");
    }
  }
}
