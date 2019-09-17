import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
class _DanceProvider{
  List<dynamic> opciones=[];
  _DanceProvider(){
    //cargarData();
  }

  Future<List<dynamic>>cargarData() async{

    final resp=await rootBundle.loadString('data/dance_opts.json');
    Map dataMap =json.decode(resp);
    opciones=dataMap['dances'];
   // print("asdasda $opciones");
    return opciones;
  }
}

final danceProvider=new _DanceProvider();