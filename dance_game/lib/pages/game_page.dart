import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';


import '../image_asset.dart';

class GamePage extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<GamePage> with TickerProviderStateMixin {
  var _animationDuration =
  Duration(seconds: 2); //vamos a recibir esto como parámetro
  //facil 5, normal 3, leyenda 1
  Timer _timer;
  Color _color = Colors.orange;
  var _alignment = Alignment.bottomLeft;
  AudioPlayer advancedPlayer;

  GlobalKey _containerKey = GlobalKey();
  GlobalKey _dianaKey = GlobalKey();

  Offset _containerPosition = Offset(0, 0);
  Offset _dianaPosition = Offset(0, 0);
  int _puntaje = 100;
  double _anchoDificultad = 50; //100 normal, 50 dificil, 20 leyenda
  String animPuntaje = "latidos";
  String animBaile = "Pañuelo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF862133),
              image: DecorationImage(
                image: ExactAssetImage('assets/images/monticulo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: FlareActor(
              'assets/flare/cueca_hombre.flr',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: animBaile,
            ),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        child: FlareActor(
                          'assets/flare/corazon.flr',
                          animation: animPuntaje,
                        ),
                      ),
                      Text(
                        'Puntos: $_puntaje',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "BubblegumSans",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: Colors.deepPurple,
                        width: 4.0,
                      ),
                    ),
                    child: Stack(children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          key: _dianaKey,
                          padding: EdgeInsets.all(16.0),
                          height: 25,
                          width: _anchoDificultad,
                          color: _color,
                          duration: Duration(milliseconds: 500),
                        ),
                      ),
                      AnimatedContainer(
                        duration: _animationDuration,
                        curve: Curves.easeInOut,
                        alignment: _alignment,
                        child: Container(
                            key: _containerKey,
                            height: 25,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              color: Colors.indigoAccent,
                            )),
                      ),
                    ]),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _mostrarPosicion(context);
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text('PASO')),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    shape: StadiumBorder(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarPosicion(BuildContext context) {
    setState(() {
      _getContainerPosition();
      if (_containerPosition.dx >= _dianaPosition.dx &&
          _containerPosition.dx <= _dianaPosition.dx + _anchoDificultad) {
        _puntaje = _puntaje + 10;
        _color = Colors.green;
      } else {
        _puntaje = _puntaje - 10;
        _color = Colors.orange;
      }
      _verificaPuntaje(context);
    });
  }

  void _verificaPuntaje(BuildContext context) {
    if (_puntaje >= 100) {
      animPuntaje = "latidos";
    } else {
      animPuntaje = "roto";
      if(_puntaje<=0){
        advancedPlayer.stop();
        advancedPlayer.release();
        advancedPlayer = null;
        animBaile="Espera";
        _timer.cancel();
        _mostrarAlert(context);
        //y también seteamos a la animación de baile una que lo haga quedarse quieto o con mivimientos suaves
      }
    }
  }

  void _ladoALado() {
    setState(() {
      if (_alignment == Alignment.bottomLeft)
        _alignment = Alignment.bottomRight;
      else
        _alignment = Alignment.bottomLeft;
    });
  }

  /// New
  _getContainerPosition() {
    final RenderBox containerRenderBox =
    _containerKey.currentContext.findRenderObject();
    final containerPosition = containerRenderBox.localToGlobal(Offset.zero);

    setState(() {
      _containerPosition = containerPosition;
    });
  }

  _getDianaPosition() {
    final RenderBox containerRenderBox =
    _dianaKey.currentContext.findRenderObject();
    final dianaPosition = containerRenderBox.localToGlobal(Offset.zero);

    setState(() {
      _dianaPosition = dianaPosition;
    });
  }

  @override
  void initState() {
    super.initState();
    loadMusic();
    _timer = Timer.periodic(_animationDuration, (timer) => _ladoALado());
    WidgetsBinding.instance.addPostFrameCallback(_onBuildCompleted);
  }

  @override
  void dispose() {
    advancedPlayer?.stop();
    _timer.cancel();
    super.dispose();
  }

  /// New
  _onBuildCompleted(_) {
    _getContainerPosition();
    _getDianaPosition();
  }

  Future loadMusic() async {
    advancedPlayer = await AudioCache().play("assets/music/cueca_ejemplo.mp3");
  }

  void _mostrarAlert(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            title: Text("Fin del Game"),
            content: Text("Puntaje: $_puntaje"),
          );
        }
    );
  }
}

