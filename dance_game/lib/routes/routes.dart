import 'package:dance_game/pages/detail_game_page.dart';
import 'package:dance_game/pages/game_page.dart';
import 'package:dance_game/pages/home_page.dart';
import 'package:dance_game/pages/perfil_page.dart';
import 'package:flutter/material.dart';


Map<String,WidgetBuilder>getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'detail': (BuildContext context) => DetailGame(),
    'game': (BuildContext context) => GamePage(),
    'perfil': (BuildContext context) => DetailGamePerfil()
  };
}