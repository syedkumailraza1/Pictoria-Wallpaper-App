import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pictoria/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 224, 224) ,
      body: Center(
        child: Container(
          width: 500,
          child: Image.asset(
            "assets/logo.png"),
        ),
      ),
    );
  }
}