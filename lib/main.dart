import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home_screen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自己紹介',
      themeMode:ThemeMode.dark ,
      home: HomeScreen(),
    );
  }
}

