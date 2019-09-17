import 'package:dance_game/providers/dance_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDay = true;
  int color = 0xFFEEEEEE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lista(),
      backgroundColor: Color(color),
    );
  }

  Widget _cabecera(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image(
              width: screenWidth,
              height: screenHeight / 2,
              image: ExactAssetImage('assets/images/op1.jpeg'),
              fit: BoxFit.fill,
            ),
            Container(
              color: Colors.grey.withOpacity(0.5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 12),
                  child: InkWell(
                    child: Icon(Icons.person, color: Colors.white),
                    onTap: () {
                      Navigator.pushNamed(context, "perfil");
                    },
                  ),
                ),
                Text(
                  "FolKlore",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: IconButton(
                    icon: (_isDay
                        ? FlareActor("assets/flare/switch_daytime.flr",
                            animation: "switch_night")
                        : FlareActor("assets/flare/switch_daytime.flr",
                            animation: "switch_day")),
                    onPressed: toggleNight,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: danceProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Stack(children: <Widget>[
          ListView(
            children: _listaItems(snapshot.data, context),
          ),
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF263238),
                    Color(0xFF263238).withOpacity(.2),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  stops: [0.0, 0.5],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
          ),
        ]);
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    opciones.add(_cabecera(context));
    data.forEach((opt) {
      final int colorCard = int.parse(opt['color']);
      // final  int colorText = int.parse(opt['textColor']);
      print(" el color de las cards ${opt['color']}");
      final widgetTemp = Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
        child: Card(
          // color: Color.fromRGBO(79, 91, 98, 0.8),
          color: Color(colorCard),
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 160,
            width: 340,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "detail");
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 160,
                    height: 180,
                    child: FlareActor(
                      opt['anim'],
                      animation: opt['animCard'],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 112,
                    child: Padding(
                        padding:
                            EdgeInsets.only(left: 35.0, top: 8.0, bottom: 16.0),
                        child: Text(
                          opt['texto'],
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "BubblegumSans",
                            //color: Color(0xFFc1d5e0),
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      opciones.add(widgetTemp);
    });
    opciones.add(Container(
      height: 100,
    ));
    return opciones;
  }

  Widget _fondoGradiente() {
    final Gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );
    return Gradient;
  }

  void toggleNight() {
    setState(() {
      if (_isDay) {
        _isDay = false;
        color = 0xFFEEEEEE;

      } else {
        _isDay = true;
        color = 0xFF263238;
      }
    });
  }
}
