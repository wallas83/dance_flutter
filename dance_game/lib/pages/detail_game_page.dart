import 'package:dance_game/common/circular_buttom.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailGame extends StatefulWidget {
  @override
  DetailGameState createState() => DetailGameState();
}

class DetailGameState extends State<DetailGame> {
  bool _isFavorite = true;
  final String desc =
      "La cueca paceña desde sus inicios es una danza de seducción y coqueteo."
      "La mujer huye a la provocadora mirada de su pareja, donde el varón la busca siguiendo las cadencias de la música, entre la concertina y guitarras "
      "agitando el pañuelo, llamando su mirar";

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color(0xDD000000),
      body: ListView(children: <Widget>[
        Container(
          height: height,
          child: Stack(
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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF9575CD),
                      Color(0xFF9575CD).withOpacity(.3),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.5],
                    tileMode: TileMode.clamp,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    //   height: ScreenUtil().setHeight(400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            //    height: ScreenUtil().setHeight(24),
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Cueca Paceña",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(54),
                                    fontFamily: "BubblegumSans",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            CircularButton(
                              color: Colors.white,
                                 icon: (_isFavorite ? Icon(Icons.favorite,color: Colors.red[500],) : Icon(Icons.favorite_border, color: Colors.red[500],)),


                              onPressed: _toggleFavorite,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: ScreenUtil().setWidth(460),
                              ),
                              child: Text(
                                desc,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(30),
                                    fontFamily: "Montserrat",
                                    color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: RaisedButton(
                                    color: Color(0xffad1457),
                                    child: Text(
                                      "Jugar",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () =>
                                        {Navigator.pushNamed(context, "game")}),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var linePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.4;

    canvas.drawLine(
        Offset(0, size.height - 4), Offset(size.width, 4), linePaint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LinePainter oldDelegate) => false;
}
