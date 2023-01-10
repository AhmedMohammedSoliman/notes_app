import 'dart:ui';

import 'package:flutter/material.dart';

class Mytheme{
  static Color primaryColorLight = Colors.blue ;
  static Color blackColor = Colors.black12 ;
  static Color primaryColorDark = Colors.indigo ;

 static ThemeData lightTheme = ThemeData(
   scaffoldBackgroundColor: Mytheme.blackColor ,
   appBarTheme: AppBarTheme(
     backgroundColor: Mytheme.primaryColorLight ,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30) , bottomRight: Radius.circular(30)),
     ),
     elevation: 0 ,
     centerTitle: true
   ),
   textTheme: TextTheme(
     headline1: TextStyle(
       color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold
     )
   )

 );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Mytheme.blackColor ,
    appBarTheme: AppBarTheme(
        backgroundColor: Mytheme.primaryColorDark ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30) , bottomRight: Radius.circular(30)),
        ),
        elevation: 0 ,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        centerTitle: true
    ),


  );

}