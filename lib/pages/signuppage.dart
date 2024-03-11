// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, unused_catch_clause, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harvestapp/pages/loginpage.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isHidden = true;
  late String _locationName;
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordcon = TextEditingController();
  final TextEditingController _username = TextEditingController();
  // final TextEditingController _destrict = TextEditingController();

  List locations = [
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

  Future<void> registerUser() async {
    BuildContext? localContext = context;
    showDialog(
        context: localContext,
        builder: (localContext) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailCon.text, password: _passwordcon.text);

      userdata(userCredential);

      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Login()), (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException (e.g., display error message)
      print('FirebaseAuthException: ${e.message}');
      Navigator.pop(context); // Close the loading dialog
    } catch (e) {
      // Handle other exceptions
      print('Error: $e');
      Navigator.pop(context); // Close the loading dialog
    }
  }

  Future<void> userdata(UserCredential userCredential) async {
    if (userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential
              .user!.uid) // Use UID instead of email as document ID
          .set({
        'email': userCredential.user!.email,
        'username': _username.text.trim(), // Trim whitespace
        'location': _locationName.trim(), // Trim whitespace
      }).catchError((error) {
        // Handle Firestore error (e.g., display error message)
        print('Firestore Error: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/image1.png"), fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: signUpAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(100))),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 30.0, left: 20, right: 20, bottom: 40),
                child: Column(
                  children: [
                    Column(
                      children: [
                        signupMessage(),
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Ener details to sign up",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.grey.shade700,
                                      height: 0.8)),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    locationInfo(),
                    SizedBox(
                      height: 20,
                    ),
                    usernameTextfield(),
                    SizedBox(
                      height: 20,
                    ),
                    emailTextfield(),
                    SizedBox(
                      height: 20,
                    ),
                    signUpPass(),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          registerUser();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.green[700]),
                        child: Text(
                          "Finish",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have account ?"),
                            SizedBox(
                              width: 60,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      splashFactory: NoSplash.splashFactory,
                                      padding: EdgeInsets.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap),
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => Login()),
                                        (route) => false);
                                  },
                                  child: Text(
                                    'login',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox signupMessage() {
    return SizedBox(
        width: double.infinity,
        child: Text(
          "Sign up",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 40,
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold)),
        ));
  }

  SizedBox locationInfo() {
    return SizedBox(
      height: 55,
      child: DropdownSearch(
        items: locations,
        dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                prefixIcon: Icon(Icons.explore_outlined),
                labelText: "Destrict",
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)))),
        onChanged: (value) {
          _locationName = value!;
        },
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
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              labelText: "Email",
              labelStyle:
                  GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black)),
              filled: true,
              fillColor: Colors.grey.shade300,
              prefixIcon: Icon(
                Icons.email_outlined,
              )),
        ),
      ),
    );
  }

  SizedBox usernameTextfield() {
    return SizedBox(
      height: 55,
      child: Material(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(0)),
        child: TextField(
          controller: _username,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              labelText: "Username",
              labelStyle:
                  GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black)),
              filled: true,
              fillColor: Colors.grey.shade300,
              prefixIcon: Icon(
                Icons.account_circle_outlined,
              )),
        ),
      ),
    );
  }

  SizedBox signUpPassAgain() {
    return SizedBox(
      height: 55,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          obscureText: _isHidden,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none)),
              labelText: "Password",
              labelStyle:
                  GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black)),
              filled: true,
              fillColor: Colors.grey.shade300,
              prefixIcon: IconButton(
                  onPressed: _togglePasswordView,
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                  ))),
        ),
      ),
    );
  }

  SizedBox signUpPass() {
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
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none)),
              labelText: "Password",
              labelStyle:
                  GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black)),
              filled: true,
              fillColor: Colors.grey.shade300,
              prefixIcon: IconButton(
                  onPressed: _togglePasswordView,
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                  ))),
        ),
      ),
    );
  }

  AppBar signUpAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white, size: 40),
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
