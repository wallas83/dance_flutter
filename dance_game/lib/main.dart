
import 'package:dance_game/pages/secondary_home_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google stadia App concept',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Colors.white,
          primaryColor: Colors.blue,
          fontFamily: 'Oxygen'),
      home: SecondaryHomePage(),
    );
  }
}
