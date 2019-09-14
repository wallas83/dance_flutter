
import 'package:dance_game/pages/detail_game.dart';
import 'package:dance_game/pages/landing_page.dart';
import 'package:flutter/material.dart';

import 'game_process_widget.dart';

class PopularWithFriendsWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String subName;



  const PopularWithFriendsWidget({Key key, @required this.imagePath, this.name, this.subName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        child: InkWell(
          child: Stack(
            children: <Widget>[
               Container(
                  height: 180.0,
                  width: 340.0,
                  child: Image.asset(imagePath, fit: BoxFit.fitWidth),
                ),

              Positioned(
                left: 10.0,
                bottom: 10.0,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22.0),
                    ),
                    Text(
                     subName,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 12.0),
                    )

                  ],
                ),
              )
            ],
          ),
          onTap: ()=>{
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailGame()))
          },
        ),
      ),
    );
  }
}
