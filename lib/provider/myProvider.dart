import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{

  String appLanguage = "en" ;
  ThemeData appMode = ThemeData.light();

  void changeLanguage (String newLanguage){
    if (appLanguage == newLanguage){
      return ;
    }else {
      appLanguage = newLanguage ;
    }
    notifyListeners() ;
  }

  void changeMode (ThemeData newMode){
    if (appMode == newMode){
      return ;
    }else {
      appMode = newMode ;
    }
    notifyListeners() ;
  }
}