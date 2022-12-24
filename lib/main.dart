import 'package:flutter/material.dart';
import 'package:notes_app/theme/themeing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ,
      routes: {

      },
      locale: Locale("en"),
      theme: Mytheme.lightTheme,
      darkTheme: Mytheme.darkTheme,
    );
  }
}

