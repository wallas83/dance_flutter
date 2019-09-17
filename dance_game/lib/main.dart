
import 'package:dance_game/pages/home_page.dart';
import 'package:dance_game/routes/routes.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Folklore App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'BubblegumSans'
    ),
    initialRoute: '/',
    routes: getApplicationRoutes(),
    onGenerateRoute: (RouteSettings settings) {
    return MaterialPageRoute(
    builder: (BuildContext context) => HomePage());

      }
    );

  }
}
