import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("")),
          SizedBox(height: 20,),
          Text("Notes App",) ,
          SizedBox(height: 20,),
          CircularProgressIndicator()
        ],
      ),
    );
  }

}