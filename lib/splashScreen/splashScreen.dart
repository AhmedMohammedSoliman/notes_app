import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app/home/home.dart';
import 'package:notes_app/theme/themeing.dart';

class SplashScreen extends StatefulWidget{
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3) , () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.redAccent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Positioned(
              bottom: 150,
              child: Text("News App" , style: TextStyle(color: Colors.white , fontFamily: "demo" , fontWeight:
              FontWeight.bold , fontSize: 25),),
            ),
            Positioned(
              bottom: 75,
                child: CircularProgressIndicator())
          ],
        )
      ),
    );
  }
}